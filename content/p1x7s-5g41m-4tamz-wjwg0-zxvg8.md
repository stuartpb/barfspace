# A System for Disks

Clustor?

https://wiki.archlinux.org/index.php/Udev#Mounting_drives_in_rules

A lot of the stuff listed there assumes systemd, which isn't present in k3os

https://github.com/Ferk/udev-media-automount doesn't need it, though; that might be a good starting point?

Other resources:

- https://unix.stackexchange.com/questions/229987/udev-rule-to-match-any-usb-storage-device

via searching "openrc automount usb":

- https://unix.stackexchange.com/questions/78276/automount-usb-sticks-on-gentoo
- https://forums.gentoo.org/viewtopic-t-350769-highlight-udev.html
- https://wiki.gentoo.org/wiki/AutoFS (needs kernel support?!)
- https://wiki.gentoo.org/wiki/Mdev/Automount_USB

Other (diminishing returns):

- https://www.axllent.org/docs/view/auto-mounting-usb-storage/
- https://www.andreafortuna.org/2019/06/26/automount-usb-devices-on-linux-using-udev-and-systemd/
- https://unix.stackexchange.com/questions/44454/how-to-mount-removable-media-in-media-label-automatically-when-inserted-with

## The idea

I'm thinking that systems should only mount drives that were formatted with the *express* intention of being used in this system.

So maybe we only apply this stuff if the sidk is labeled `NODE_STORAGE` or `LONGHORN_DISK` or something like that

Of course, we don't care about the disk label being unique: everything in this system is identified by the UUID. All the more reason to screw with the label: make it unsuitable for misuse within a system that uses disks normally by label.

A disk might also have a `.disk.yaml` or something like that at the root of its FS that has the disk's properties. The core ones (like `ssd` et al) could also probably be sniffed by udev
