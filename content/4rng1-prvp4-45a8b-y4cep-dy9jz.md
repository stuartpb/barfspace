# 2018-08-30

I ordered some upgrades for this machine, and installed them today. I added another 2 GB of RAM (4 GB isn't much, but it's enough to be functional: 2 GB is just *miserable*), and replaced the 16 GB flash chip with a full-size 120GB SSD.

While I *could* copy the mess I made of the onboard flash to the new SSD, I decided I'd rather take it from the top one more time and see if I can do everything right from the outset.

## here we go

Running `lsblk` confirms that `/dev/sda` is a 111.8G disk.

I realize here that one key difference between the old flash and this new SSD, something I will have to do that I didn't do before, is that I will have to explicitly write a GPT to this disk.

Just to head off later issues (I'm still reading the docs off a different computer), I run `wifi-menu` and connect to my network.

## setting up the disk

I pop open `cgdisk /dev/sda` and set up a new partition, starting at 2048 and going on for 550MiB (the recommended space), formatting it as `ef00` (EFI System) and giving it the partition name `EFI-SYSTEM` (just like before).

I create a second partition in the remaining space with type 8300 (Linux filesystem), and label it "stuzzy_root".

I write the table and quit.

I run `mkfs.fat -F32 /dev/sda1` and `mkfs.ext4 /dev/sda2` to format the new partitions.

## mounting and installing

I run `mount /dev/sda2 /mnt`, `mkdir /mnt/boot`, and `mount /dev/sda1 /mnt/boot` to set up the mounts.

I pacstrap all the packages I'd wished I'd had when I was trying to install the system before:

`pacstrap /mnt base base-devel intel-ucode elinks lightdm lightdm-gtk-greeter gnome xorg-server networkmanager`

Once that is completed, I run `genfstab -U /mnt >> /mnt/etc/fstab` and `arch-chroot /mnt`.

## boilerplate in the chroot

`ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime` and `hwclock --systohc`

running `sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen` followed by `locale-gen`, then `echo 'LANG=en_US.UTF-8' > /etc/locale.conf`

running `echo stuzzy > /etc/hostname` and skipping the "add entries to /etc/hosts" step as before

## new initramfs

Another thing I didn't do with the previous installation, but wanted to do here, was use the `systemd` hook in the initramfs instead of `udev` (getting stuff like resumption from hibernation for free).

I `nano /etc/mkinitcpio.conf` and replace `udev` with `systemd`, leaving my hooks array as `HOOKS=(base systemd autodetect modconf block filesystems keyboard fsck)`.

I then rebuild the initramfs with `mkinitcpio -p linux`.

## installing the bootloader

I install the systemd-boot bootloader with `bootctl --path=/boot install`. I then create a bootloader entry using a variation on the same command I used before:

```bash
cat > /boot/loader/entries/$(cat /etc/machine-id)-arch-local-default.conf << EOF
title Arch Linux
machine-id $(cat /etc/machine-id)
efi /vmlinuz-linux
options initrd=/intel-ucode.img
options initrd=/initramfs-linux.img
options root=$(blkid -o export /dev/sda2 | grep '^PARTUUID=')
EOF
```

## enabling services

`systemctl enable lightdm NetworkManager`

## adding my user

`EDITOR=nano visudo` to uncomment the line enabling wheel members to sudo without a password

`useradd -c "Stuart P. Bentley" -m -G wheel stuart && passwd stuart`

## one last convenience I forgot to install before logging off

`pacman -S bash-completion`

## here goes nothing

I `exit` the chroot and `poweroff`.

Once the system is off, I remove the install media and press the Power button.

## OMG it works

I see the opening boot stuff, then land in LightDM, with GNOME as the default environment. I enter my password.

## (extremely hacker voice) I'm in

I connect to my wi-fi network via the menu at the upper-right of the screen, and I'm now in position to start updating this log from the device itself.

## installing some stuff

`sudo pacman -S git guake` - I change Guake's accellerator to F1 (from F12)

Since my next move is going to be to install Google Chrome, I want an AUR helper: it looks like my best option these days is `yay`, so I install it with:

`cd $(mktemp -d) && bash <(curl https://meta.sh/aur) -si yay`

My move now is to thrash my way through `yay google-chrome`

I've got Google Chrome installed, and am currently using it to edit this file. I need some more fonts to install, because this monospace font is an ugly serif.

I went into GNOME Settings and enable Night Light (for consistency with my other devices), as well as bumping the touchpad speed up a bunch and enabling Tap to Click. I'm still not wild about how the touchpad feels, but I can work on that.

Added Chrome to favorites on the dock, removed Web and Evolution

Changed Time Format to AM/PM in GNOME Settings

Getting some fonts: `sudo pacman -S ttf-croscore ttf-roboto noto-fonts ttf-ubuntu-font-family noto-fonts-cjk opendesktop-fonts noto-fonts-emoji noto-fonts-extra`

## initializing a new keypair for this device

`ssh-keygen -t rsa -b 4096` with all defaults to create a new pubkey for this device, added it to https://github.com/stuartpb/pubkeys and https://github.com/stuartpb.keys
