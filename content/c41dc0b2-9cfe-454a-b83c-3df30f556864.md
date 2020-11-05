# Backup

Of course, it's hoped that ceph-would be able to handle a drive failure - but you never know when Ceph might go haywire (or, hell, you never know when it'll just be easier to blow everything away and remake).

[Velero](https://velero.io/) seems like a pretty good way to handle backups: it's PVC-oriented

## hardware-wise

I'm thinking this'd be one more disk (maybe even a fancy expensive one like 4TB!), attached to a new semi-dedicated worker called `wpi-ark` (a nod to Velero's old name), where the disk is mounted as a host path (or however Velero's docs stuff suggests).
