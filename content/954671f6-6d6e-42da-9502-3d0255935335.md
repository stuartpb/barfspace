# 2018-08-22: Arch Linux on an x64 Chromebook

My mom's Acer C710 reached End of Support a couple months ago, so we went out and got her a new one, and I asked to keep the old one, so that I could have a Chromebook I could reflash to run Linux that *wasn't* a mess of unsupported proprietary chipsets like the old ARM Samsung Chromebook I'd tried to do this with before.

## Right after getting the Chromebook

Per the [upstream directions](https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/acer-c7-chromebook), I Powerwashed the machine into Developer Mode by holding Escape and F3 (Refresh) while pressing the power button, then pressing CTRL+D.

Once I was in Developer Mode, I selected "Enable debugging features", then struggled with confusion after booting into CrOS and hitting Ctrl+Alt+T to get a Terminal tab, typing `shell` and then `sudo crossystem dev_boot_usb=1` only to find that the password I'd set when enabling said debugging features wasn't accepted.

After powerwashing again (via the Chrome settings button for it) and setting that password again, I searched around and caught that the password is actually set **directly on the `root` account**, which you have to **log into via vt2 (Ctrl+Alt+F2)** to change the password for `chronos` for sudo at the shell.

Anyway, I logged into vt2, and at that point I'd already downloaded the [MrChromebox Firmware Utility Script](https://mrchromebox.tech/#fwscript), so I just ran it as root via something like `bash /home/chronos/user/Downloads/firmware-util.sh`.

I backed up the firmware to a flash drive I keep around for exactly this kind of hackery (0xdeadcab1e), flashed the lastest Arch Linux installation media to the flash drive I keep dedicated to this exact purpose (my "rescue penguin"), and rebooted by holding F3 (Refresh) and hitting the power button.

## Installing Arch Linux

(**Note that this is for historical purposes only:** the onboard flash memory all this was applied to was replaced with a full-size SSD on 2018-08-30, which was formatted from scratch.)

Running down the [Installation Guide](https://wiki.archlinux.org/index.php/Installation_guide):

`lsblk` to confirm the onboard flash is /dev/sda

firing up `parted`

doing `rm 1` through `rm 11` to remove all partitions that aren't the EFI system partition

realizing that moving a fat16 partition in parted [hasn't been possible for years](https://superuser.com/a/499804), *aaaaaargh*

I've still got an EFI partition just sitting here in the middle of my partition table looking like an idiot

## let's get ddangerous

going into `fdisk` and doing `n 1 2048 +32767 t 1 1 w` to create a new EFI System partition at the first available aligned sector (the default when there are no partitions), of the same size as the existing one (32768 sectors)

ran `dd conv=notrunc if=/dev/sda12 of=/dev/sda1 bs=1M` to copy the partition, then checked that the copy worked with `mount /dev/sda1 /mnt && ls /mnt && umount /mnt`

`fdisk` again, hitting `x` to get into Expert Mode

`n 1` to give the new partition the name `EFI-SYSTEM` just like the old one

not copying the old UUID because why bother

returning to basic mode with `r`

doing `d 12` to delete the old EFI-SYSTEM partition that was in a weird place

hitting `n` and just enter for the rest of the defaults to create an appropriate Linux partition out of the rest of the disk

momentarily questioning if all this partition mucking about is worth it if I'm just going to order a cheap SSD to replace the stock flash anyway

running `mkfs.ext4 /dev/sda2` (if I do end up buying a new SSD, I'll probably redo this with F2FS or btrfs, probably the latter because I'm obsessed with features like COW)

only at this point, realizing that pacstrap can't use the local package store, do I run `wifi-menu`

gonna pacstrap a dev environment with a (hopefully) nice wm as `pacstrap /mnt base base-devel budgie`

## rote following of the guide

running `genfstab -U /mnt >> /mnt/etc/fstab` and `arch-chroot /mnt` as perscribed in the guide

running `ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime` even though honestly I wish systems didn't have a concept of "local time" beyond the UI but whatever

running `hwclock --systohc` even though it's not clear why that's necessary

uncommenting `en_US.UTF-8 UTF-8` in `/etc/locale.gen` and running `locale-gen`

also making an `/etc/locale.conf` with `LANG=en_US.UTF-8` in it

`echo stukilla > /etc/hostname`

honestly, not doing the "add an entry for your hostname as 127.0.1.1 in /etc/hosts" thing, life is too friggin' short

## a little more setup for the GUI stuff

`pacman -S lightdm lightdm-gtk-greeter && systemctl enable lightdm`

## setting myself up

uncommenting the "allow all members of wheel to sudo without a password" line via `EDITOR=nano visudo`

`useradd -c "Stuart P. Bentley" -m -G wheel stuart && passwd stuart`

okay let's see if this thing boots
