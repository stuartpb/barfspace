# Adding Kured

Okay, so, weird that the main README doesn't mention this, but kured's helm repo is at https://weaveworks.github.io/kured/

pointing to https://github.com/weaveworks/kured/tree/master/charts/kured

## Trying to set this up using gotk-toolkit

Thinking about how it would be cool if

- the gotk command installed to the git repo it's currently in, by some rule (like I'd have "put the manifests in a subdirectory of `base` by namespace), and allowed the user to finalize by committing + pushing
- the gotk command had a `gotk helm` route that translated helm commands to the equivalent gotk resource manipulation (ie. create HelmRepository, create HelmRelease, etc.)

## fuck it though, whatever

That would be cool and all, but, honestly, it's not too tricky to add it ourselves.

I just go ahead and copy-paste the files from cert-manager and change all the fields to `kured`, and copy-paste the chart repo for kubernetes-dashboard.

I took a peek at `/usr/share/k8s-yaml/kured/kured.yaml` and saw that Kubic by default puts it in the `kube-system` namespace, but, nah, I'm gonna give it its own `kured` namespace.

I almost include the values to put a Prometheus monitor on this, but [I'm not convinced the chart would work as-is](https://github.com/weaveworks/kured/pull/209), so I hold off on trying this for now.

## more hijinks

Some more changes from here are documented in the Git history for Stubernetes, the notes would be redundant

Anyway, I get kured rolled out

## Changing the host

Per https://en.opensuse.org/Kubic:Update_and_Reboot, I want to run this:

```
  echo "REBOOT_METHOD=kured" > /etc/transactional-update.conf
```

I roll that out via clusterssh, and add a script for it in hack/node-setup, so any new nodes I might spin up in the future will fit in

## Eschewed customization

I looked up the default timer at `/usr/lib/systemd/system/transactional-update.timer`, and it looks like it staggers updates by a random point within a 2-hour window by default, which is good enough for me:

```
[Unit]
Description=Daily update of the system
Documentation=man:transactional-update(8)
After=network.target local-fs.target

[Timer]
OnCalendar=daily
AccuracySec=1m
RandomizedDelaySec=2h
#Persistent=true

[Install]
WantedBy=timers.target
```

## Continuing

Right before I do this, I realize that a node-loss-tolerant cluster design means that [all data will need at least one replica](ek854-zy6f3-tr9z3-bnnr2-55vmf)

Since I've broken rook-ceph by not realizing this (I had a node failure overnight), I segue into [Teardown, Reconfigure, and Rebuild 2020-10-04](yh6xx-ghwp8-c190b-jae1w-hff3k)
