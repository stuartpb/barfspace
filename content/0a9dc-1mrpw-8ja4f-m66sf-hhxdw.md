# Background on /etc/fstab for k3os

This is k3os's default fstab, for some reason:

```
/dev/cdrom	/media/cdrom	iso9660	noauto,ro 0 0
/dev/usbdisk	/media/usb	vfat	noauto,ro 0 0
```

I guess this is [the default in Alpine](https://git.alpinelinux.org/aports/tree/main/alpine-baselayout/APKBUILD#n201)?

Not sure where `/dev/usbdisk` is suppoed to come from; the closest reference I could find was [this tutorial](https://www.axllent.org/docs/view/udev-and-external-devices/) (also linked in [planning](p1x7s-5g41m-4tamz-wjwg0-zxvg8) and [execution](tq85y-f91px-45art-wd1rz-mgfrq) of studtop's udisks thing) where the author writes a custom udev rule to mount to that location

Anyway, writing udev rules to make up device handles for pre-specified mount points (with a presumed vfat filesystem!) is very dumb imo, so I'm cool just overwriting the stock `/etc/fstab` altogether, nothing of value would be lost
