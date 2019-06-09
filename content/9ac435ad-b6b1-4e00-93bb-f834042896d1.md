# 2018-08-24

(**Note that this is for historical purposes only:** the onboard flash memory all this was applied to was replaced with a full-size SSD on 2018-08-30, which was formatted from scratch.)

It's becoming clear that trying to boot directly via EFISTUB is more trouble than it's worth (if it's even possible with this firmware at all), so I'm just going to chump out and install a bootloader.

Reading the wiki, it seems like the simplest way to do this will be to use [systemd-boot](https://wiki.archlinux.org/index.php/Systemd-boot), so that's what I'm doing: booting back into rescue media, applying the mounts, `arch-chroot`ing into `/mnt`, and running `bootctl --path=/boot install`.

Hmm, for some reason the only option that appears now is "Reboot Into Firmware Interface".
