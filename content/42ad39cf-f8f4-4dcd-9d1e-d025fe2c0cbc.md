# 2018-08-23

(**Note that this is for historical purposes only:** the onboard flash memory all this was applied to was replaced with a full-size SSD on 2018-08-30, which was formatted from scratch.)

Well whaddaya know, copying the leftover EFI-SYSTEM partition from Chrome OS doesn't count as establishing a bootloader for the new OS

Looking at https://wiki.archlinux.org/index.php/EFISTUB, I'm going to try adding a boot entry for Arch directly:

`efibootmgr --disk /dev/sda --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode "root=$(blkid -o export /dev/sda2 | grep '^PARTUUID=') rw initrd=\\initramfs-linux.img" --verbose`

Rebooted, and... still nothing (even after retrying, having originally typed `--part 2` thinking it was supposed to refer to the OS partition). Booting back into rescue media showed that the new boot entry didn't appear to persist, so I'm going to try the process for creating a boot entry directly from UEFI Shell.

Trying to create the entry from UEFI Shell v2 made it clear that the issue was that the EFI partition didn't contain the EFISTUB data, since I'd never mounted it as `/boot`.

Guhhh... looking at what *is* in `/boot`, `initramfs-linux-fallback.img` is 28M. That's too big for the 16M partition I (re)used from the ChromeOS configuration. I'm... pretty much going to have to try this all over again.

## from the top

Going into `fdisk /dev/sda`, deleting the existing partitions, creating a new EFI System partition at 2048 ending at `+256MiB` (the minimum for some drive types as described on [the Arch Wiki](https://wiki.archlinux.org/index.php/EFI_system_partition) - the Wiki recommends dedicating a full 512MiB "to avoid potential problems with some UEFI implementations", but I just don't feel like reserving so much of this limited disk space on such an esoteric concern), and a Linux filesystem partition for the rest. (also giving them the labels of "EFI-SYSTEM" and "onboard-flash")

Formatting the partitions (ESP as FAT32), mounting them (the ESP into `/mnt/boot`), doing `wifi-menu`, and running `pacstrap /mnt base base-devel budgie-desktop lightdm lightdm-gtk-greeter`

Redoing all the stuff above from "rote following of the guide" down (skipping the `pacman -S` for lightdm obviously) and rebooting... yup, still not working. Booting back into the rescue media and going to try rerunning the `efibootmgr` command above.

Ugh, my ESP appears to have nothing in it, and there's no entry for `/boot` in `/etc/fstab`. It looks like I didn't mount /boot, even though I'm almost certain I did. (I might have typo'd it as `mount /dev/sda1 /boot` instead of `mount /dev/sda1 /mnt/boot`, as that's what happens every time I try to do this in recovery.) I'm going to try moving the contents of /boot into that partition and regenerating the fstab, seeing if that works.

## aaaaargh

Okay, I moved everything around, and was finally able to boot from `vmlinuz-linux` using the UEFI Shell on the rescue media, but now I've got a crash on startup around `mei_me 0000:00:16.0: initialization failed.` I don't have time to deal with this right now
