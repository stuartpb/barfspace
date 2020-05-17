# Planning for Storage

https://rancher.com/docs/k3s/latest/en/storage/ suggests Longhorn might make distributed storage simple enough

## older idea: try to make local-path-provisioner work nice

https://github.com/rancher/local-path-provisioner/blob/master/README.md probably explains how to back that; how can I use an SD card as the backing storage device?

## even older

Looking at https://medium.com/@metahertz/single-node-k3os-rook-ceph-howto-a50652f7133d for inspiration (though tbh that's way too complicated)

reminder here to check stushiba 2020-03-06 tabalanches

## hardware setup

Add an /etc/fstab to mount the flash drive (IIRC this was in at least one K3os tutorial I saw)

## cluster setup

Submit a pull request to https://github.com/rancher/local-path-provisioner to allow it to only respond to a custom storage class (a la the Traefik chart's custom ingress class option)

Or, rather, I'm realizing that it needs a storage class anyway - the `nodePathMap` should be:

- defined in the StorageClass
- based on selectors, not node names
- defaulting to not provisioning on a node

still looking at these examples: https://github.com/rancher/local-path-provisioner/tree/master/examples

## actually, honestly

At this point I'm thinking I'll just go ahead and install Longhorn, which also gets me redundancy and potentially backups and all other kinds of coordination

would probably still have to tweak /etc/fstab? I'll see what the Longhorn dashboard looks like
