# Setting up my disks for Studtop

## pre-plan

gonna use the UUID `26758745-8ec9-4d5f-9f79-9e2339ad253d` as the type for identifying the volumes we want to be automounted under this plan (Steakhouse)

this is inspired by a convention I think freedesktop posted and I have linked somewhere? where disks to be mounted as `/home` have a special type, stuff like that

so this'd be the "mount this disk as a shared `/media` path by it's filesystem UUID". maybe another type could be "by partition UUID", and another could

I know I have a page for this, having multiple partition types versus using GPT bits? and how one thing that does feel appropriate for having different filesystem types is "auotmount as ext4" and such - you know, the filesystem type, as that's normally expressed using the type GUID

but yeah, when you get right down to it, isn't "mount this automatically" versus "do an authenticated etcd lookup" kind of fundamentally two different types of partition, with different guarantees of availability? so, like, forget bits, these are different partition types at least, if not different systems entirely.

(right around here is when I realize I should maybe start looking for a simpler name for this current simple one-udev-rule model than "steakhouse")

### more into the weeds

and, you know, you could always make some kind of merged type where these distinctions *are* in bits (like, if you're just trying to make this a general classification for handoff to an extended tool), if it, like, somehow came to that (and, like, maybe at that point *that's* steakhouse)

though, really, isn't it pretty safe to automount the partition read-only to read its info? or would that be a problem if the device is, like, a tape drive

maybe this could actually just manage entries in fstab. kind of like systemd's mount management like that (and, like, an alternate driver would actually hand it off to systemd's mount management)

it's worth noting here that this design has never assumed systemd, because k3os doesn't have it, and I respect that

## partitioning

wiped the disk to GPT via Gparted

bailed on that because I couldn't find custom UUIDs for partition type as an option

using `cgdisk` to create the partition with that GUID and all default options otherwise

Doing the same with the MicroSD card I got as well

now running `mkfs.ext4` for `/dev/sde1`

it says that the old ntfs partition is there... hopefully I'm not going by the old partition table, the data just happens to be in the same place...

```
sudo mkfs.ext4 /dev/sdf1
mke2fs 1.45.6 (20-Mar-2020)
/dev/sdf1 contains `Targa image data - RLE 3083 x 3597 x 15 +2055 +2569 - right' data
```

huh weird. anyway I'm not gonna bother imaging this, just blowing that away as well

## after plugging them in and sshing

```
studtop [~]$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop1          7:1    0  56.5M  1 loop /usr
loop2          7:2    0 223.3M  0 loop /usr/src
sda            8:0    1  59.1G  0 disk
└─sda1         8:1    1    59G  0 part
sdb            8:16   0   1.8T  0 disk
└─sdb1         8:17   0   1.8T  0 part
mmcblk0      179:0    0  14.7G  0 disk
├─mmcblk0p1  179:1    0    47M  0 part
└─mmcblk0p2  179:2    0  14.6G  0 part /var/lib/kubelet/pods/236b69c1-b195-4c29-9417-4c89e2d2d18d/volume-subpaths/config/dashboard/1
mmcblk0boot0 179:8    0     4M  1 disk
mmcblk0boot1 179:16   0     4M  1 disk
mmcblk1      179:24   0 115.9G  0 disk
└─mmcblk1p1  179:25   0 115.9G  0 part
```

so `mmcblk0` is the onboard storage (don't ask me what the deal is with that mount point, I don't know).

`sda` is the 64 gig USB stick I've got in there for the "play" partition I guess

`sdb` is the hard disk

`mmcblk1` is the SD card I formatted

```
studtop [~]$ udevadm info -q all /dev/mmcblk1p1
P: /devices/pci0000:00/80860F16:00/mmc_host/mmc1/mmc1:59b4/block/mmcblk1/mmcblk1p1
N: mmcblk1p1
S: disk/by-id/mmc-SPCC_0x184901b2-part1
S: disk/by-partuuid/95bc601c-61da-49b6-b438-9a22d8c568ce
S: disk/by-path/platform-80860F16:00-part1
S: disk/by-uuid/08bce92f-3c51-42eb-a236-ef832dc78e6c
E: DEVLINKS=/dev/disk/by-id/mmc-SPCC_0x184901b2-part1 /dev/disk/by-partuuid/95bc601c-61da-49b6-b438-9a22d8c568ce /dev/disk/by-path/platform-80860F16:00-part1 /dev/disk/by-uuid/08bce92f-3c51-42eb-a236-ef832dc78e6c
E: DEVNAME=/dev/mmcblk1p1
E: DEVPATH=/devices/pci0000:00/80860F16:00/mmc_host/mmc1/mmc1:59b4/block/mmcblk1/mmcblk1p1
E: DEVTYPE=partition
E: ID_FS_TYPE=ext4
E: ID_FS_USAGE=filesystem
E: ID_FS_UUID=08bce92f-3c51-42eb-a236-ef832dc78e6c
E: ID_FS_UUID_ENC=08bce92f-3c51-42eb-a236-ef832dc78e6c
E: ID_FS_VERSION=1.0
E: ID_NAME=SPCC
E: ID_PART_ENTRY_DISK=179:24
E: ID_PART_ENTRY_NUMBER=1
E: ID_PART_ENTRY_OFFSET=2048
E: ID_PART_ENTRY_SCHEME=gpt
E: ID_PART_ENTRY_SIZE=242933727
E: ID_PART_ENTRY_TYPE=26758745-8ec9-4d5f-9f79-9e2339ad253d
E: ID_PART_ENTRY_UUID=95bc601c-61da-49b6-b438-9a22d8c568ce
E: ID_PART_TABLE_TYPE=gpt
E: ID_PART_TABLE_UUID=bae03513-8d70-4d0f-a355-241189fdfdff
E: ID_PATH=platform-80860F16:00
E: ID_PATH_TAG=platform-80860F16_00
E: ID_SERIAL=0x184901b2
E: MAJOR=179
E: MINOR=25
E: PARTN=1
E: SUBSYSTEM=block
E: USEC_INITIALIZED=518777521159
```

ok so `ID_PART_ENTRY_TYPE` is the UUID I want to sniff for

```
studtop [~]$ udevadm info -q all /dev/sdb1
P: /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.3/2-1.3:1.0/host1/target1:0:0/1:0:0:0/block/sdb/sdb1
N: sdb1
S: disk/by-id/usb-WD_My_Passport_0748_575844314537324E43583737-0:0-part1
S: disk/by-partuuid/66cb18c8-e871-46c2-aa48-4e3808669f4d
S: disk/by-path/pci-0000:00:14.0-usb-0:1.3:1.0-scsi-0:0:0:0-part1
S: disk/by-uuid/72de5890-78de-4120-a885-6eac7dc11a7b
E: DEVLINKS=/dev/disk/by-id/usb-WD_My_Passport_0748_575844314537324E43583737-0:0-part1 /dev/disk/by-partuuid/66cb18c8-e871-46c2-aa48-4e3808669f4d /dev/disk/by-path/pci-0000:00:14.0-usb-0:1.3:1.0-scsi-0:0:0:0-part1 /dev/disk/by-uuid/72de5890-78de-4120-a885-6eac7dc11a7b
E: DEVNAME=/dev/sdb1
E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.3/2-1.3:1.0/host1/target1:0:0/1:0:0:0/block/sdb/sdb1
E: DEVTYPE=partition
E: DM_MULTIPATH_DEVICE_PATH=0
E: ID_BUS=usb
E: ID_FS_TYPE=ext4
E: ID_FS_USAGE=filesystem
E: ID_FS_UUID=72de5890-78de-4120-a885-6eac7dc11a7b
E: ID_FS_UUID_ENC=72de5890-78de-4120-a885-6eac7dc11a7b
E: ID_FS_VERSION=1.0
E: ID_INSTANCE=0:0
E: ID_MODEL=My_Passport_0748
E: ID_MODEL_ENC=My\x20Passport\x200748
E: ID_MODEL_ID=0748
E: ID_PART_ENTRY_DISK=8:16
E: ID_PART_ENTRY_NUMBER=1
E: ID_PART_ENTRY_OFFSET=2048
E: ID_PART_ENTRY_SCHEME=gpt
E: ID_PART_ENTRY_SIZE=3906961375
E: ID_PART_ENTRY_TYPE=26758745-8ec9-4d5f-9f79-9e2339ad253d
E: ID_PART_ENTRY_UUID=66cb18c8-e871-46c2-aa48-4e3808669f4d
E: ID_PART_TABLE_TYPE=gpt
E: ID_PART_TABLE_UUID=54070bc1-750f-4a9e-a126-698bcf4e4f64
E: ID_PATH=pci-0000:00:14.0-usb-0:1.3:1.0-scsi-0:0:0:0
E: ID_PATH_TAG=pci-0000_00_14_0-usb-0_1_3_1_0-scsi-0_0_0_0
E: ID_REVISION=1019
E: ID_SERIAL=WD_My_Passport_0748_575844314537324E43583737-0:0
E: ID_SERIAL_SHORT=575844314537324E43583737
E: ID_TYPE=disk
E: ID_USB_DRIVER=usb-storage
E: ID_USB_INTERFACES=:080650:
E: ID_USB_INTERFACE_NUM=00
E: ID_VENDOR=WD
E: ID_VENDOR_ENC=WD\x20\x20\x20\x20\x20\x20
E: ID_VENDOR_ID=1058
E: MAJOR=8
E: MINOR=17
E: PARTN=1
E: SUBSYSTEM=block
E: USEC_INITIALIZED=518089446847
```

I'm interested in the contrast between the two constructions of their `by-id` paths (`ID_MODEL` and `ID_SERIAL_SHORT` together as `ID_SERIAL` for the USB, `ID_NAME` and `ID_SERIAL` for the mmc), but that's not my focus right now

I am kind of thinking of that `/var/lib/kubelet`

```
studtop [~]$ sudo ls -a /var/lib/kubelet/
.  ..  cpu_manager_state  device-plugins  obsoleted-longhorn-plugins  plugins  plugins_registry  pod-resources	pods
```

OwO what's this?

```
studtop [~]$ sudo ls -a /var/lib/kubelet/obsoleted-longhorn-plugins
.  ..  driver.longhorn.io  io.rancher.longhorn
studtop [~]$ sudo ls -a /var/lib/kubelet/obsoleted-longhorn-plugins/*
ls: cannot access '/var/lib/kubelet/obsoleted-longhorn-plugins/*': No such file or directory
studtop [~]$ sudo -i
studtop [~]# ls -a /var/lib/kubelet/obsoleted-longhorn-plugins/*
/var/lib/kubelet/obsoleted-longhorn-plugins/driver.longhorn.io:
.  ..  csi.sock

/var/lib/kubelet/obsoleted-longhorn-plugins/io.rancher.longhorn:
.  ..  csi.sock
```

hmmmmmm

## side note on that pod mount

```
studtop [~]# kubectl get pod 236b69c1-b195-4c29-9417-4c89e2d2d18d
Error from server (NotFound): pods "236b69c1-b195-4c29-9417-4c89e2d2d18d" not found
```

so idk. I'm guessing this was an updater pod that mounted the onboard storage to update the root recently? not sure what that "dashboard" bit is

## quick reminder to myself

the design of k3os means that any modification or extensions to the base OS layout (ie. outside the cluster control plane) need to be defined as an overlay in the configuration YAML

also, I'm planning on just having everything in one YAML file, since I'm not packaging anything yet

## let's get down to business

following from https://opensource.com/article/18/11/udev (was actually kind of taking cues from it already)

moving my config with `# mv /var/lib/rancher/k3os/config.d/20_k3s-args.yaml /var/lib/rancher/k3os/config.yaml` so I can manage it as the "system definition" (I mentioned this earlier)

still having cold feet: documenting [more caveats](858ad-tjyqk-m89nd-d9jmb-h194w)

## designing the rule

some precedents I'm finding:

- https://www.axllent.org/docs/view/auto-mounting-usb-storage/

some thing in (old?) Ceph:

- looks like this was pulled out? https://github.com/ceph/ceph/pull/22343
  - https://github.com/ceph/ceph/blob/77f40ed408bcfb694d289fd6be2d91d322b74247/udev/60-ceph-by-parttypeuuid.rules
  - https://github.com/ceph/ceph/blob/77f40ed408bcfb694d289fd6be2d91d322b74247/udev/95-ceph-osd.rules

debating if I want to double-fork, just in case the mount runs long:

- http://thelinuxjedi.blogspot.com/2014/02/why-use-double-fork-to-daemonize.html
- https://stackoverflow.com/questions/881388/what-is-the-reason-for-performing-a-double-fork-when-creating-a-daemon

## anyway

- http://www.reactivated.net/writing_udev_rules.html
- https://linux.die.net/man/7/udev

```yaml
write_files:
- path: /etc/udev/rules.d/20_uud3.rules
  content:
    ACTION=="add", SUBSYSTEM=="block",
      ENV{ID_PART_ENTRY_TYPE}=="26758745-8ec9-4d5f-9f79-9e2339ad253d",
      RUN+="/bin/mount -p /dev/%k /media/%E{ID_FS_UUID}"

    ACTION=="remove", SUBSYSTEM=="block",
      ENV{ID_PART_ENTRY_TYPE}=="26758745-8ec9-4d5f-9f79-9e2339ad253d",
      RUN+="/bin/umount -l /media/%E{ID_FS_UUID}", RUN+="/bin/rmdir /media/%E{ID_FS_UUID}"
```

fingers crossed, let's reboot

okay, I picked 20 out of my ass, that's no good. all those paths I saw earlier, and the importing of information from blkid, comes in at `/usr/lib/udev/rules.d/60-persistent-storage.rules`

```
# probe filesystem metadata of disks
KERNEL!="sr*", IMPORT{builtin}="blkid"
```

changing to `81-uud3.rules` kind of inspired by the number picked in https://hackaday.com/2009/09/18/how-to-write-udev-rules/

rebooted... still not appearing, aaargh

## realization

Hmm, after doing a `udevadm monitor`, unplugging a disk, and plugging it back in again, the system won't respond to ctrl+c and I can't SSH in

Hmm... is it hitting an infinite loop? opening the lid, the terminal seems fine. hitting power and bringing the system back

Trying the command: looks like `mount -p` doesn't work. I had noticed this in the man page earlier, but I caught the `mount -p` thnig somewhere and thought it was just undocumented or something

Honestly, I could fix this with a call to `mkdir -p` first, I mean we do call `rmdir` in the cleanup, but... eh, we'll go with `-o X-mount.mkdir` for now

testing the command, that works

## oh yeah, a thing I'm raelizing

it's nbd that this is outside of `/run` because the whole root filesystem is a tmpfs layer

## all together now

checking the file... hmm, the trailing space isn't appearing. maybe it's time to revert to the plain folding style, which I'd ditched because I wanted to indent lines

```yaml
write_files:
- path: /etc/udev/rules.d/81-uud3.rules
  content: >
    ACTION=="add", SUBSYSTEM=="block",
    ENV{ID_PART_ENTRY_TYPE}=="26758745-8ec9-4d5f-9f79-9e2339ad253d",
    RUN+="/bin/mount -o X-mount.mkdir /dev/%k /media/%E{ID_FS_UUID}"

    ACTION=="remove", SUBSYSTEM=="block",
    ENV{ID_PART_ENTRY_TYPE}=="26758745-8ec9-4d5f-9f79-9e2339ad253d",
    RUN+="/bin/umount -l /media/%E{ID_FS_UUID}", RUN+="/bin/rmdir /media/%E{ID_FS_UUID}"
```

## coming back to Longhorn

trying to make a tunnel connection fails.

Checking the kubernetes dashboard, we have some issues...

starting with our `cluster-dns` not working, yeowch.

## to be continued

[fixing cluster-dns](72k8s-766nw-x8a4k-1d4c0-55134)
