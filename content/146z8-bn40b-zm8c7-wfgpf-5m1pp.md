# 2017-12-05

I'm getting a wide and exciting variety of kernel panics on boot, sometimes it doesn't print anything, others it shows systemd crashing

THANK GOD I KEEP THESE PETLOGS because now I get that it's probably something wrong with that module I built

I'm going to restart, adding `modprobe.blacklist=8812au,8812au(0)` to the kernel command line in refind (the latter is what's printing in the "modules linked in" output)

## even with the modprobe blacklist

nope, still getting the same kinds of errors: Authentication Manager failing to run, blinking cursor and no output after the DRM reset...

following https://wiki.archlinux.org/index.php/General_troubleshooting#Boot_problems

UGH, even booting my recovery media had problems so... I don't know, I'm just going to try to boot into Windows.

okay, even booting WINDOWS had errors, so maybe it's some kind of, like, register corruption, and I just have to completely do a cold start again

trying again, booting with the modprobe blacklist... and it's the flashing cursor with no info again

let's try going cold and trying windows again, just, eugh, whatever

okay looking at https://www.kernel.org/doc/Documentation/admin-guide/kernel-parameters.txt it looks like the option is `module_blacklist`, not sure how that differs from the modprobe one but it'd make sense because I think this bad module might be baked in?

okay I'm going to try rebooting again and this time I'm going to do `module_blacklist=8812au,8812au(0)`

... I got a blinking cursor again. not sure if it's an error, but I've got fresh install media in place, so I'm just gonna reboot with that

## chrooting with the install media

plugged in the ethernet cable

dns isn't resolving no matter how much I run dhcpcd so I might as well just drop this into /etc/resolv.conf:

```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

I think if I do that in the install environment it'll get layered into the chroot

ok, running `pacman -Syu` now

ran into a few key issues, running `pacman-key --refresh-keys`

the pacman update looks like it worked OK but I want to refresh my AUR packages

packer chokes when doing AUR stuff as root, and apacman has been removed from the AUR, so... `su stuart` I guess

it looks like there is yet again some drama with the driver maintainer: https://aur.archlinux.org/packages/rtl8812au-dkms-git/

it's taking forever compiling lesstif, so doing `pacman -S openmotif` per https://www.archlinux.org/todo/replace-lesstif-with-openmotif/

## rebooting

UUUUUUGH

> Failed to start Load Kernel Modules.

> Failed to mount /boot.

screw this, I'll try again after kernel 4.15 hits honestly just because I want https://www.phoronix.com/scan.php?page=news_item&px=Linux-4.15-Non-Desktop-Quirk
