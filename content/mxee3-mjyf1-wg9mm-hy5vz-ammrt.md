# Persistent Storage for Prometheus

Before I start going all in on the stuff I want to do with this, I have one more component to confirm is working properly: persistent storage.

I had a field in the Prometheus release to set this up, but it turns out it's not in the right place (lol yaml)

Moved it to the right place, and now it's stuck...

Hmm, after a little investigation per https://github.com/rook/rook/blob/master/Documentation/ceph-common-issues.md#pvcs-stay-in-pending-state it does genuinely look like we don't have the right OSDs

Since I just yanked the hard drive's USB cable by accident (it fell into a crack) while checking the hardware for this, let's just go ahead and restart the prepare pod anyway:

`kubectl -n rook-ceph delete pod -l app=rook-ceph-operator`

hmm, still few OSDs...

## zero fucks given

rook-ceph uninstalled

I was able to `wipefs -a /dev/sda` to blank the hard drive, but ended up yanking the USB hub and `wipefs -af /dev/sd{b,c,d}` (individually) to blank the flash drives, because I would get `wipefs: error: /dev/sda: probing initialization failed: Device or resource busy` every time.

the drives are recognized as /dev/sd{d,e,f} now that I've plugged them back in but that shouldn't matter

hmm, okay, looking at https://github.com/rook/rook/blob/master/Documentation/ceph-teardown.md since the rook stuff is stuck deleting

https://rook.io/docs/rook/v1.4/ceph-teardown.html

`for CRD in $(kubectl get crd -n rook-ceph | awk '/ceph.rook.io/ {print $1}'); do kubectl patch crd -n rook-ceph $CRD --type merge -p '{"metadata":{"finalizers": [null]}}'; done` got it done

running `sgdisk --zap-all /dev/sdX` on all the devices too for good measure

rebooting the nodes too, what the heck

re-applying rook-ceph...

...fuck, when the nodes came back online and tried to rejoin, they got rejected because of the reverted hostname (`node "stuby" not found` errors in `journal -b -u kubelet`). I'm gonna need to figure out a better solution than manually resetting these

ugh, this happened to sturl somehow too.

anyway, bringing it back, the OSDs got stuck in a CrashLoop: realized I hadn't read all of the teardown doc, which noted I'd need to remove `/var/lib/rook`. I go back and delete:

- the storage docs (cluster/pools/classes)
- the rook-ceph HelmRelease
- the rook-ceph namespace

I also get this every time I restart the kubelet service (after setting the hostname) unless I actually do reload the units first:

> `Warning: The unit file, source configuration file or drop-ins of kubelet.service changed on disk. Run 'systemctl daemon-reload' to reload units.`

## anyway

after rolling out rook-ceph once again, it looks like we should have enough OSDs:

```
[root@rook-ceph-tools-78cdfd976c-kcj44 /]# ceph status
  cluster:
    id:     a6995e60-71ba-49ba-95e6-f0a374eb4ef6
    health: HEALTH_WARN
            Degraded data redundancy: 4 pgs undersized

  services:
    mon: 2 daemons, quorum a,b (age 19m)
    mgr: a(active, since 11m)
    osd: 4 osds: 4 up (since 6m), 4 in (since 6m)

  data:
    pools:   2 pools, 64 pgs
    objects: 0 objects, 0 B
    usage:   4.0 GiB used, 2.0 TiB / 2.0 TiB avail
    pgs:     60 active+clean
             4  active+undersized
 ```

looks like there's only one mon? that seems wrong?

gonna try restarting the operator

I think there might be stale metadata... looks like I'll probably have to fully wipe the disks like they said to

anyway I'll handle this [tomorrow](y4mf6-9f4ke-gfagh-zw043-3b9we)
