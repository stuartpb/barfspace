# Laying groundwork for OpenEBS

https://docs.openebs.io/docs/next/prerequisites.html lists iSCSI as basically the only dependency

`transactional-update pkg install open-iscsi`

Looks like installing open-iscsi sets it up with a systemd socket activation, so we shouldn't need to enable it

https://docs.openebs.io/docs/next/ndm.html so, like, "no partition table" is the new "special partition identifier". I can dig it

reading [the installation docs](https://docs.openebs.io/docs/next/installation.html), oof this could be documented better

I feel like it'd be cool to insert LVM / RAID levels underneath this (cStor kind of puts them over? but no LVM pooling?)

https://openebs.io/blog/creating-manual-blockdevice/

## about to read the cStor user guide

ohh, is this why it doesn't seem to have a pool declaration? because you use actual annotation selectors to select disks? that would be dope

[oof, no, it's currently just an explicit list of disks](https://godoc.org/github.com/openebs/maya/pkg/apis/openebs.io/v1alpha1#BlockDeviceAttr)

ah well, that's enough for now.

- https://docs.openebs.io/docs/next/ugcstor.html#creating-cStor-storage-class
- https://docs.openebs.io/docs/next/ugcstor.html#cstor-storage-policies
  - oh, so you can use a *node* selector as a storage policy...
    - or rather I guess that's just for the pod that manages the storage class?
  - this Target Affinity Policy thing looks hairy
- there are all these artifacts about "upgrading" that seem to be relics from the project's pre-1.0 days
  - https://docs.openebs.io/docs/next/upgrade.html
  - more recent versions appear to be [helm-upgradable](https://github.com/openebs/openebs/blob/master/k8s/upgrades/README.md)
- the "scaling replicas" stuff is hair-raising

## hmm

so I guess I'll make the "work" pool operate in "mirrored" mode, since I'm getting two instances of the flash drive that I can spread across two machines

## using Jiva?

Jiva seems like the thing you use if your "volume" construct lives in userspace, but not enough that you could manage it like a LocalPV

just generally a master of none. And it doesn't go through ndm! we're really gonna lean on ndm here, I think it's the right way to go

like yeah, really I see no reason to go for Jiva except legacy apps. You either want enough features that you want cStor, or it's simple enough that you want a LocalPV Host Path

like, every second I read about Jira trying to understand if it has a legitimate purpose and starts talking about "the default storage pool in the container" I can feel myself getting that much dumber. The only reason you'd use this is fi you're migrating from Longhorn - like, they should pivot into making it a smooth drop-in replacement, if they're gonna keep it around, imo

## how I'm thinking I'll set up the hard drive

I'm thinking it'll be mounted like a block device pool, and then another app will be provisioned on top of it to add another storage abstraction layer (like the previously-suggested torrent manager)

## next steps

- [Retracing household-dns](82afk-fk2xc-rc954-gq524-me68y)
- [Actually installing OpenEBS](9jxgv-wgeyx-mra75-51wn3-gd604)
