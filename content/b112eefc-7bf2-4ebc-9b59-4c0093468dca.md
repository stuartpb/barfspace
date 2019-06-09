# 2018-09-23: changing chips

I've decided to move sturling to the storage I removed from stuzzy so I can use this M.2 stick for another project.

I've plugged both enclosures into stuzzy, and am working from there.

Since it looks like GParted can't just migrate the entire GPT over, I'm going to shrink the root Linux partition to as small as possible, then `dd` all the space I can over to the new drive, then (after confirming the new device works) wipe the old disk and start installing the new system I intend to use it for.

Having resized the partition to its smallest in GParted, I'm trying `sudo dd if=/dev/sdc of=/dev/sdb bs=8192 count=1954827 conv=sync status=progress`

## QEMU

While this goes, I'm going to try setting up QEMU on stuzzy to boot from these drives without having to actually power down.

Oh, apparently I've already got it installed. Wait, what? `pacman -Qi qemu` says it's required by gnome-boxes, which another `-Qi` tells me I explicitly installed August 30. I guess it got installed as part of the `gnome` base? `pacman -Qg gnome` tells me, oh snap, it was, nice.

Okay, opening up Boxes.

It doesn't seem to have a way to not start with a file or existing VM, so I'm going ahead and telling it to set up a new machine with https://d3g5gsiof5omrk.cloudfront.net/nixos/18.03/nixos-18.03.133245.d16a7abceb7/nixos-graphical-18.03.133245.d16a7abceb7-x86_64-linux.iso

### Well, that was a huge mistake

It appears that gnome-boxes, when you give it the name of an image to download, will download it into **RAM** - this caused everything on the system to halt and die (since I still haven't set up swap on stuzzy), including the `dd` I was running earlier.

However, it still got far enough to copy all the partitions (since I'd shrunk the root), so (after rebooting, as gnome-shell had decided to take ownership of basically all the RAM on the system) I went ahead and tried to open it in GParted, which didn't work.

## Recovering the now-corrupt GPT

Here's the entire process (including repeated help invocations, because I'm dumb and lazy) I used to fix the GPT after moving the content:

```
[stuart@stuzzy ~]$ sudo gdisk /dev/sdb
GPT fdisk (gdisk) version 1.0.4

Warning! Disk size is smaller than the main header indicates! Loading
secondary header from the last sector of the disk! You should use 'v' to
verify disk integrity, and perhaps options on the experts' menu to repair
the disk.
Warning! Main and backup partition tables differ! Use the 'c' and 'e' options
on the recovery & transformation menu to examine the two tables.

Warning! One or more CRCs don't match. You should repair the disk!
Main header: OK
Backup header: OK
Main partition table: OK
Backup partition table: ERROR

Partition table scan:
  MBR: protective
  BSD: not present
  APM: not present
  GPT: damaged

****************************************************************************
Caution: Found protective or hybrid MBR and corrupt GPT. Using GPT, but disk
verification and recovery are STRONGLY recommended.
****************************************************************************

Command (? for help): v

Caution: The CRC for the backup partition table is invalid. This table may
be corrupt. This program will automatically create a new backup partition
table when you save your partitions.

Problem: main GPT header's backup LBA pointer (62533295) doesn't
match the backup GPT header's current LBA pointer (31277231).
The 'e' option on the experts' menu may fix this problem.

Problem: main GPT header's last usable LBA pointer (62533262) doesn't
match the backup GPT header's last usable LBA pointer (31277198)
The 'e' option on the experts' menu can probably fix this problem.

Problem: main header's disk GUID (537F37D1-BFCD-DA49-A444-1D37E430384C) doesn't
match the backup GPT header's disk GUID (314F0DC1-7BDB-45FE-B6FF-A7D6F4506D3F)
You should use the 'b' or 'd' option on the recovery & transformation menu to
select one or the other header.

Problem: Disk is too small to hold all the data!
(Disk size is 31277232 sectors, needs to be 62533296 sectors.)
The 'e' option on the experts' menu may fix this problem.

Problem: GPT claims the disk is larger than it is! (Claimed last usable
sector is 62533262, but backup header is at
62533295 and disk size is 31277232 sectors.
The 'e' option on the experts' menu will probably fix this problem

Partition(s) in the protective MBR are too big for the disk! Creating a
fresh protective or hybrid MBR is recommended.

Identified 7 problems!

Command (? for help): ?
b	back up GPT data to a file
c	change a partition's name
d	delete a partition
i	show detailed information on a partition
l	list known partition types
n	add a new partition
o	create a new empty GUID partition table (GPT)
p	print the partition table
q	quit without saving changes
r	recovery and transformation options (experts only)
s	sort partitions
t	change a partition's type code
v	verify disk
w	write table to disk and exit
x	extra functionality (experts only)
?	print this menu

Command (? for help): x

Expert command (? for help): ?
a	set attributes
c	change partition GUID
d	display the sector alignment value
e	relocate backup data structures to the end of the disk
f	randomize disk and partition unique GUIDs
g	change disk GUID
h	recompute CHS values in protective/hybrid MBR
i	show detailed information on a partition
j	move the main partition table
l	set the sector alignment value
m	return to main menu
n	create a new protective MBR
o	print protective MBR data
p	print the partition table
q	quit without saving changes
r	recovery and transformation options (experts only)
s	resize partition table
t	transpose two partition table entries
u	replicate partition table on new device
v	verify disk
w	write table to disk and exit
z	zap (destroy) GPT data structures and exit
?	print this menu

Expert command (? for help): e
Relocating backup data structures to the end of the disk

Expert command (? for help): v

Caution: The CRC for the backup partition table is invalid. This table may
be corrupt. This program will automatically create a new backup partition
table when you save your partitions.

Problem: main header's disk GUID (537F37D1-BFCD-DA49-A444-1D37E430384C) doesn't
match the backup GPT header's disk GUID (314F0DC1-7BDB-45FE-B6FF-A7D6F4506D3F)
You should use the 'b' or 'd' option on the recovery & transformation menu to
select one or the other header.

Identified 2 problems!

Expert command (? for help): ?
a	set attributes
c	change partition GUID
d	display the sector alignment value
e	relocate backup data structures to the end of the disk
f	randomize disk and partition unique GUIDs
g	change disk GUID
h	recompute CHS values in protective/hybrid MBR
i	show detailed information on a partition
j	move the main partition table
l	set the sector alignment value
m	return to main menu
n	create a new protective MBR
o	print protective MBR data
p	print the partition table
q	quit without saving changes
r	recovery and transformation options (experts only)
s	resize partition table
t	transpose two partition table entries
u	replicate partition table on new device
v	verify disk
w	write table to disk and exit
z	zap (destroy) GPT data structures and exit
?	print this menu

Expert command (? for help): r

Recovery/transformation command (? for help): ?
b	use backup GPT header (rebuilding main)
c	load backup partition table from disk (rebuilding main)
d	use main GPT header (rebuilding backup)
e	load main partition table from disk (rebuilding backup)
f	load MBR and build fresh GPT from it
g	convert GPT into MBR and exit
h	make hybrid MBR
i	show detailed information on a partition
l	load partition data from a backup file
m	return to main menu
o	print protective MBR data
p	print the partition table
q	quit without saving changes
t	transform BSD disklabel partition
v	verify disk
w	write table to disk and exit
x	extra functionality (experts only)
?	print this menu

Recovery/transformation command (? for help): p
Disk /dev/sdb: 31277232 sectors, 14.9 GiB
Model: SSD U100 16G    
Sector size (logical/physical): 512/512 bytes
Disk identifier (GUID): 537F37D1-BFCD-DA49-A444-1D37E430384C
Partition table holds up to 128 entries
Main partition table begins at sector 2 and ends at sector 33
First usable sector is 34, last usable sector is 31277198
Partitions will be aligned on 2-sector boundaries
Total free space is 16355471 sectors (7.8 GiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1              34            2047   1007.0 KiB  EF02  BIOSBOOT
   2            2048         1128447   550.0 MiB   EF00  ESYSPART
   3         1128448        14921727   6.6 GiB     8300  STURLING

Recovery/transformation command (? for help): d

Recovery/transformation command (? for help): v

Caution: The CRC for the backup partition table is invalid. This table may
be corrupt. This program will automatically create a new backup partition
table when you save your partitions.

Identified 1 problems!

Recovery/transformation command (? for help): ?
b	use backup GPT header (rebuilding main)
c	load backup partition table from disk (rebuilding main)
d	use main GPT header (rebuilding backup)
e	load main partition table from disk (rebuilding backup)
f	load MBR and build fresh GPT from it
g	convert GPT into MBR and exit
h	make hybrid MBR
i	show detailed information on a partition
l	load partition data from a backup file
m	return to main menu
o	print protective MBR data
p	print the partition table
q	quit without saving changes
t	transform BSD disklabel partition
v	verify disk
w	write table to disk and exit
x	extra functionality (experts only)
?	print this menu

Recovery/transformation command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): y
OK; writing new GUID partition table (GPT) to /dev/sdb.
The operation has completed successfully.
```

## re-inflating

Now that the GPT is OK, I go back into GParted and expand the partition on the new sturling disk.

On the old one... I don't know, I'm going to see what NixOS wants to do. Whatever I do from here, it'll be documented in the changelog for stuzzy, not sturling.

## NOPE, GUESS AGAIN

Turns out the M.2 key is too small to fit into the motherboard I was going to slot it into, so hey! I'm going back and migrating sturling back to the chip I started with, *making everything I did here completely pointless*.
