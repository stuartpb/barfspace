# 2018-08-29

(**Note that this is for historical purposes only:** the onboard flash memory all this was applied to was replaced with a full-size SSD on 2018-08-30, which was formatted from scratch.)

Okay, now that I look at this a little more closely, apparently you're supposed to [configure](https://wiki.archlinux.org/index.php/systemd-boot#Configuration) systemd-boot after installing it, and the fact that I didn't do that is probably why this isn't working.

I'm editing `/boot/loader/loader.conf`, and for some reason, the last line of the file is `default 4561e26e9f224e4aa22ef630e03b93b9-*`. After doing an `fgrep -sr 4561e26 /`, it comes to light that this value comes from `/etc/machine-id`, a file I'd never encountered before, documented [in systemd's manual](https://www.freedesktop.org/software/systemd/man/machine-id.html). After reading [the spec](https://github.com/systemd/systemd/blob/master/doc/BOOT_LOADER_SPECIFICATION.md) and thinking about it for a while, I *eventually* understand why this naming convention is in place (so that multiple OS instances, with each having multiple boot options, can be installed to the ESP without conflicts). I would expect that there'd be something built into the distro to handle this as part of its base, but it sounds like the Arch boot process is so fragmented that everybody is basically just rolling their own at this point.

Before I mess with all this, I'm remembering that I ran into problems on 2018-8-23 with the Intel Management Engine module stuff, which might point to the need to include an initrd for Intel microcode as the Arch Wiki keeps imploring. I try to run `wifi-menu`, only for the system to tell me I need to install `dialog`. I exit the chroot and run `wifi-menu` from the outer shell (which has `dialog` and is fine), then `arch-chroot /mnt` again and run `pacman -S --asdeps dialog`.

Now that I'm online and have set up the system to not have me locked out on boot, I run a quick `pacman -Syu` to bring the system back up to date, then move on to get the microcode package with `pacman -S intel-ucode`.

Now that I've got all that, I create a config file by running the following multi-line command:

```bash
echo -n "title Arch Linux
machine-id $(cat /etc/machine-id)
efi /vmlinuz-linux
options initrd=/intel-ucode.img
options initrd=/initramfs-linux.img
options root=$(blkid -o export /dev/sda2 | grep '^PARTUUID=')
" > /boot/loader/entries/$(cat /etc/machine-id)-arch-local-default.conf
```

Having finished with all this, I exit the chroot and reboot. The loader appears to work properly, and I get the same problem I was experiencing before: Light Display Manager fails to start, and the `mei_me` module fails initialization.

To diagnose what's going wrong with lightdm, I boot back into the rescue media: I note that the `mei_me` issue is apparent in startup there, too, and is probably unrelated.

Looking at `/var/log/lightdm/lightdm.log`, it looks like it wasn't able to start an X server - I've probably got more packages I need to install. `wifi-menu` still doesn't work because `wpa_supplicant` isn't installed (d'oh), so I go back out of the chroot and redo `wifi-menu` there, re-chroot, `pacman -S wpa_supplicant`, and check that `wifi-menu` works now (it does).

[This thread](https://bbs.archlinux.org/viewtopic.php?id=235006) reveals that, for some reason that is beyond me, desktop environment packages like `budgie-desktop` don't include `xorg-server` as a dependency, which is apparently required by lightdm / the GTK greeter. (Don't ask me why neither of *those* packages list xorg-server as a dependency, either.)

On rebooting, everything *finally* works - just in time for me to order a replacement storage device for this machine and have to do all this over again.
