# All I Want From a Kubernetes Distro

This is based on me looking for an alternative to k3s that doesn't use containerd and a bunch of weird Rancherisms, and running into walls where every other system expects you to define Your Whole Cluster In One Provisioning Plan using Tectonic or some crap.

All I want is a system where I set it up initially to join whatever cluster I've already partially set up, and also I can hack whatever low-level customizations I need on the node straightforwardly.

I can bring whatever deployment system I want to coordinate that "node customizations" stuff, but the base API isn't some elaborate build system, it's just "the files in this directory that gets mounted over the root"

Really, all I need is:

- A base layer for the system image that can be swapped A/B style like ChromeOS or old "CoreOS Container Linux"
  - Tihs can contain some component that bootstraps a cluster based on some files contained in the next layer
- An overlay for every "customization" local to the node
  - This can be tracked in some kind of outside system
    - like maintained by a privileged container that deploys it from Git
- An overlay/partition specifically for /var/lib/containers
  - The idea is, this is like cache for the system
    - it should be possible to powerwash and rejoin the cluster and not lose anything meaningful
- A Longhorn class for "system persistence"
  - I'm just saying Longhorn because that's the simplest way I know to set up Volumes that just live in your filesystem, but are managed device-independently
  - This handles, for example, the backing volume for any local etcd instance that specifies the cluster state
  - This might be a little in-the-weeds
  - Is it possible for podman to start up a backing container for the kubelet (ie. a pod for etcd, and for kube-dns), then hand that off?

## Current closest to this vision

OpenSUSE Kubic looks pretty good

## Notes that could facilitate this

- [Kuboid Components: SSH](rwnzt-avjyy-mb8yk-1j6hj-akh48)

## TODO: move this somewhere closer to the Ops-in-a-Box / Hivebug pages

- [A neat idea for a USB hub](0kfpj-gn9ba-6nbas-a5nzy-76d60)
  - a model for a drive setup manager
