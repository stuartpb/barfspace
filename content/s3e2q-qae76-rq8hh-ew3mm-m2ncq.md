# The Plan for Introducing the containerd-opt Flash Drive

My new plan is based on [this suggested procedure](https://unix.stackexchange.com/a/131318/7733), with modifications based on reading the man page for `mkfs.ext4` (as described [in the runup to this](wp9bz-01xt9-m996k-s3ejj-8ec4d)) and looking into how runlevels work on OpenRC.

I'm thinking is that, since this would stop (halt?) SSH, I'll log in on the direct terminal (ie. open the lid and use the laptop)

```
sudo -i
openrc single
mkfs.ext4 /dev/sdb1 -L containerd-opt -d /var/lib/rancher/k3s/agent/etc/containerd/
mount /dev/sdb1 /var/lib/rancher/k3s/agent/etc/containerd/
openrc default
```

and then, if ssh starts working here, I'd nano in a new fstab `write_files` entry - and, what the heck, I'll make the fstab rule label-based

```
LABEL=containerd-opt /var/lib/rancher/k3s/agent/containerd ext4 defaults 0 2
```

and if ssh isn't working, I'll do that from the direct terminal again, then reboot and hope everything comes back

## Things to do after rebooting

- Ensure the system works okay now
- Make sure nothing's touching the directory beneath the mount (ie. everything's using the mounted flash drive)
  - Is there way to guarantee this? I'm not sure it's worth worrying about
- Mount the root filesystem under /mnt
- `sudo rm -rf /mnt/var/lib/rancher/k3s/agent/containerd` to free up space for non-containerd root stuff

## nitty gritty on the details

[Background on /etc/fstab for k3os](0a9dc-1mrpw-8ja4f-m66sf-hhxdw)

considerations around why I'm okay with the fragility implications of a label-based mount:

- We already consider the USB boundary a trusted zone
  - if we introduce another stick with that label, it's probably because we're looking to do a switchover
    - and perhaps a future system can find a way to maybe clone the directory and respawn kubelet and make that happen
      - like, just by seeing that there's a
      - and maybe in some wacky world, we spawn an instance of kubelet for *each `containerd-opt` partition at once* unless they have the same UUID (ie. it's an image-clone situation)
        - this would probably be where we start to look into a new GPT partition type though, TBH
        - I do kind of like the idea of a "node" in the cluster meaning a separate runtime
        - Or yeah, can one node host multiple containerd instances concurrently? What if they're in a microVM like Firecracker?
  - (and there's probably a way to delist the "wrong stick" / prevent it from getting mounted in the event of a label collision

these are kind of interesting ideas and all, but kind of off-track

## Really jumping trains of thought here

TODO: REHOME ME - should go into the Bagtent Federation Notes et al

- [On Bagtent Threading as Actual Communication](e9t8r-50bvz-wk82r-9cndw-qawfq)
