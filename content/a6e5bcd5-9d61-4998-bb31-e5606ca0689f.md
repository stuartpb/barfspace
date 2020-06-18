# PK Flash

This could be the small-node Podman-using Arges IPX server that controls other system boots

so this is itself an ISO or some EFI... some thing that can be easily booted as an image that can be distributed, and configured by some kind of low-level persistent tree (can this be a logical volume?)

## A related thought (Arges scope?)

The system should be capable of recognizing relocated disks across nodes, and even arranging it

It's possible to have the boot disk be a Logical Volume, right? Maybe we have the Logical Volume part come after a minimal EFI partition (or, hey, can we deploy two, so we can even upgrade/swap that component smoothly?)

This means that it would make sense to have Logical Volumes be the top level, with optional RAID and/or LUKS levels underneath that for secret/broad storage

This could even be used (with PK Thunder) to set up and present boxes in the cluster that run an image providing a service without knowing about Kubernetes at all (ie. the Quadration Runner, which wants the absolute smallest image possible)
