# Getting the Ceph storage up and running

Figure this might be getting in the way of Prometheus functioning?

I chicken out before running this plan that would select storage nodes indirectly:

```
kubectl annotate pod stuby.403.testtrack4.com st8s.testtrack4.com/storage-plane=rook-ceph
kubectl annotate pod stuphire.403.testtrack4.com st8s.testtrack4.com/storage-plane=rook-ceph
```

and decide to just select the nodes directly in the spec, at least for now.
