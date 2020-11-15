# PK Fire

A minimal image that can be served over PK Flash (maybe using some stuff persisted to the EFI root) to start Firecracker MicroVMs from (logical/physical/whatever, doesn't have to care) volumes

this can connect and provision according to the Kubernetes Cluster API

it can also mount logical volumes for persisting its own state, and maybe saving images to (though, imo, images should be modeled as Logical Volumes on the node's )

## An important note here about Logical Volumes

We should make a note in the CubiePet Manual / warning window (showing a Cubie going "???" at a computer with the bulk drive inserted) that they will not be able to read this data on outside systems (well, maybe if it's an LV, but, like, not if it's RAID-5/6, y'know?)

## Total side thought

Is it possible to "redownload half" if losing a striped RAID0? ie. I feel it might be possible to spread disks

## When you wouldn't need/want to use PK Fire

- When you're booting the bare-metal directly into a specific distro configuration
  - and don't care about letting the hardware go cold
  - PK Flash can probably boot stubs that hand off like that
