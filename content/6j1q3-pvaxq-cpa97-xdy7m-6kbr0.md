# PK Thunder

A similar system to Longhorn that schedules Logical Volumes to nodes, and maybe also handles provisioning system disks.

So I guess this would go through udev rules to make sure the system knows of any disks on the node, so I think that means it'd have to be lower-level than a privileged container?

See, if we go with the Kubic (and I would hope Talos) model, we can have our "persistent data" be split into btrfs subvolumes, and then, like, mount /var/lib/containers into either kind of system, but not Kubic's root to Talos or other things that are implementation-specific

so I guess if you were running this over PK Flash to a system running a microkernel directly that doesn't run through PK Fire, you'd probably IPX-boot a momentary PK Fire to provision the initial storage, and then you just can't change storage on that node compatibly wuthout shutting the node down

In terms of microkernels
