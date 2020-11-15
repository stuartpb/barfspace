# Welp, Time to Burn Down and Restart

Out of frustration with my nginx changeover wedging the system state, I removed the `stubernetes-system` kustomization. This was a bad idea.

I've got a few nodes looking like they're wedged from Rook, kubeadm is frozen at the `Unmounting mounted directores in "/var/lib/kubelet"` stage

Trying `systemctl restart kubelet` and `systemctl restart crio` didn't fix it, `rm -rf /var/lib/kubelet/pods` didn't fix it... and CTRL+C does nothing

```
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/cni-teardown.sh)
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/weave-teardown.sh)
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/rook-ceph-lvm2-teardown.sh)
```

In that third script, `blkid` is hanging again, and `lsblk` is showing an `rbd0`. `rbd unmap -o force /dev/rbd0` hung. `lvremove --select vg_name=~^ceph-block` in `lvm` ran, but nothing unstuck.

okay, screw it, I'm rebooting and retrying the teardown on these nodes

The reboot is taking so long I figure I might as well power cycle them manually.

After they come back, I run the three teardown scripts

wpc-gomez gets stuck in Rook teardown, looks like another RBD thing blocking lsblk. I know that a reboot will likely hang, so I try `echo b > /proc/sysrq-trigger` to see if a lower-level reboot will do the trick.

Oof, okay, looks like it's rebooted.

After re-running Rook teardown on wpc-gomez, I go ahead and reboot all nodes

I run `bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/cluster-setup/init-cluster.sh)` on mpi-rose

I yoink the credentials and here we go, all six nodes are ready.

## flashing forward

I rolled out the system, and I think the thing where the Redis stuff worked before was a fluke: I identified a few major flaws in the way the Pomerium chart handles Redis that suggest they not only never tested the codepath where the user did not specify a sharedSecret on installation, they didn't even think terribly hard about it (as in, enough to recognize the difference between ). (As I said, the  more I discover about Pomerium, at least at the Helm Chart level, the more the sloppiness)

I should probably fix this by introducing a `lookup` to the chart to reuse a secret from a previous installation, but, like, I think everyone can agree that a system that only uses deterministic inputs that don't depend on prior document state are best for these pipelines, since you can't do a lookup in an export-to-file in your build system, you know.

So anyway, secret-generator, plus the HelmRelease's `valuesFrom` in GOTK, give me pretty much all one ought to need to set up a HelmRelease in the system - I'm honestly wondering if this annnotation-oriented secret generation shouldn't be a core part of gotk, or even an upstream Kubernetes Incubator / SIG thing

I mean, really it's just a nother kind of Provisioner

## big oof

I somehow got the Pomerium chart in a mess with all the Redis trouble, combined with my deciding to roll bback the upgrade to Redis until I'm sure I want to commit to it (which, ironically, removes the one failure point that led to me introducing the secret-generator in the first place)

I tried deleting the PVs, but they just held in the Terminating state - I think that's because the PVCs were still being used, and I'd have to at least kill the Pods they were bound to if I wanted the PVs to get recreated? or delete the PVCs if I wanted them gone?

I ultimately unwedged it by suspending the stubernetes-system Kustomization rollout, removing the pomerium namespace, re-applying secrets/actual (since one of the Pomerium secrets, the github token, was in the namespace I deleted), and resuming reconciliation
