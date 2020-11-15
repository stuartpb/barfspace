# 2018-09-01: setting up sturling

Okay, so, my plan here is to format the disk as GPT (which it already is, because it came out of a Chromebook), and set up GRUB on both a BIOS boot partition and an EFI system partition, so the system can be booted from either one.

## partitioning

Doing `sudo cgdisk /dev/sdc` from stuzzy.

Deleting all the partitions that are on here from the Chromebook it came from (having imaged the entire disk yesterday, per stuzzy's changelog).

Creating a new BIOS boot partition, at the default first sector of 34, entering "+1M" as the size, with `ef02` as the type, and "BIOSBOOT" as the label.

Following it with a new partition from 2082 (I guess that was the next available) and making it 550M (per ArchWiki advice), with a type of `ef00` and a label of "ESYSPART".

Creating a partition from the next available sector (1128482) and sizing it to fill (making it 29.3 GiB), giving it the default 8300 Linux filesystem type and the label "STURLING".

After writing, it says we need to reboot, as the partitions were in use and the kernel wouldn't listen to changes or something like that. `sudo partprobe /dev/sdc` showed the same thing.

I review `lsblk` and saw that, somewhere in my shuffling of USB connections, the "OEM" partition of the drive apparently got mounted by GNOME. I sun `sudo umount /run/media/stuart/OEM` (and another `sudo umount` for another partition that got mounted), then rerun `sudo partprobe /dev/sdc`.

It succeeds; everything's on track.

Before I run `sudo mkfs.fat -F32 /dev/sdc2` to set up the ESP, I decide that I might revisit the partition structure tomorrow, so that the ESP starts at position 2048 (shrinking the BIOS boot partition slightly), and moving the rest of the partitions into alignment. I've got other stuff I'd like to do tonight, though, so I'm just going to leave off here.
