# Initial Stubernetes setup: preparing for Ceph, rolling out Helm Operator

## deep breaths

I still haven't planned out ceph properly, with entries in stubernetes-system

writing the chart to install the Ceph Operator now... looks like I'm not really going to tweak much on the operator. Added the resource records suggested at the end of [the docs](https://rook.io/docs/rook/v1.3/helm-operator.html)

looks like it really doesn't want you trying to specify nodes with a mechanism other than explicitly listing them on the cluster definition, unless they're provisioning blocks via PVC? Whatever, we can go the "explicitly naming nodes in the cluster definition" route for now. Maybe at some point I WILL go the local-pv-exposing-blocks route (and see if that might give me "portability"), but meh, for now this is good enough for me

before I start... what the heck, right now while we've only got the one node, let's plug both USB drives into it (I'm plugging them into a USB 3 hub, next to the WD My Passport which is plugged in directly). I'll let Ceph figure out the striping, but I think this'll let us have stuff where it's replicated to "3 OSDs" (since each device is a separate OSD).

I basically make sure all devices are prepped with `wipefs -a /dev/sd*` (I run it once for sda, sdb, and sdc).

## aside

https://rook.io/docs/rook/v1.3/ceph-storage.html is a nice overview from the docs

https://rook.io/docs/rook/v1.3/ceph-examples.html is misleading, from what I can tell about what things "require nodes". none of these examples feature osd-level failure domains

oh, you know what's also misleading? [the cluster CRD docs](https://rook.io/docs/rook/v1.3/ceph-cluster-crd.html#placement-configuration-settings)

> NOTE: Placement of OSD pods is controlled using the Storage Class Device Set, not the general placement configuration.

This is only true when provisioning nodes from PVCs: [nodes actually are filtered by placement](https://github.com/rook/rook/blob/6085ff32237226827fa846f59d9acbe39d795374/pkg/operator/ceph/cluster/osd/osd.go#L355)

The part about "If you use `labelSelector` for `osd` pods" confused me for a bit, too: they're talking about setting pod affinity based on the app label. This whole part of the docs sucks and could really stand improvement!

## labelling the node and getting started

anyway, gonna go ahead and add labels to the studrang node via `kubectl edit node studrang.nodes.403.stuartpb.com`

```yaml
    st8s.stuartpb.com/zone: "403"
    st8s.stuartpb.com/storage-plane: rook-ceph
```

and so that's what I'm going for when I spin up the cluster

## oh no

checking `kubectl get pods -n stubernetes-system`, the helm operator has been in a crash loop. The only thing showing up in the logs: `standard_init_linux.go:211: exec user process caused "exec format error"`

looks like this is generally caused by a thing not being multi-architecture? https://github.com/pypa/manylinux/issues/410

adding "helm flux operator" to this error I eventually land at https://github.com/fluxcd/flux/issues/1761 or rather https://github.com/fluxcd/helm-operator/issues/147

so now I'm looking at https://github.com/raspbernetes/multi-arch-images and hmm

on one hand, I feel like this can happen for any component, and so I should untaint studtop now? on the other hand...

I'll cross that bridge when I'm absolutely forced to. I roll out a new version of the stubernetes-core that points at raspbernetes' image with `helm upgrade -n stubernetes-system stubernetes-core .`
