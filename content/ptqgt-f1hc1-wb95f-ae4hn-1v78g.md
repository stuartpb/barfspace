# sturling creation procedure 2015-01-20

## from stushiba

following https://wiki.archlinux.org/index.php/installation_guide

- gparted format 64gb microsd card with 4096MiB FAT32 'saboot' partition, fill rest with f2fs 'saroot' partition
- sudo -i (in theory - in reality I messed up and did this late)
- mount new /dev/sde2 to /mnt, mkdir /mnt/boot, mount /dev/sde1 /mnt/boot
- pacstrap /mnt base base-devel gnome
  - I should have pacstrapped more than this, especially grub
- `genfstab -Up /mnt >> /mnt/etc/fstab`
- nano /mnt/etc/fstab, remove line(s) for host system's swap partition
- `exit`
- `sudo arch-chroot /mnt`
- `echo sturling > /etc/hostname`
- `ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`
- uncomment `en_US.utf8` and `en_US` in /etc/locale.gen
- `locale-gen`
- `echo LANG=your_locale > /etc/locale.conf`
  - this should maybe include a .utf8? to be fixed later
- edit /etc/mkinitcpio.conf to remove `autodetect` and move `usb` up
- `mkinitcpio -p linux`
- `passwd`
- `pacman -S grub` (d'oh)
- `pacman -S dosfstools mtools` (just in case)
- `grub-install --target=i386-pc --recheck --debug /dev/sde`
- `grub-mkconfig -o /boot/grub/grub.cfg`
- `exit`
- `sudo umount -R /mnt`
- `reboot`

## after reboot

- determine network isn't working with `ping 8.8.8.8`
- `dhcpcd`
- grab Chromebook and start reading https://wiki.archlinux.org/index.php/General_recommendations
- `systemctl enable gdm`
- read https://wiki.archlinux.org/index.php/Users_and_groups#User_management based on a note in a petlog for a previous pet system
- `useradd -mG wheel stuart`
- `chfn -f 'Stuart P. Bentley' stuart`
  - actually I did it in interactive mode, hitting enter for each blank field, but this works better
- `passwd stuart`
- `%wheel ALL=(ALL) ALL` line uncommented with `EDITOR=nano visudo`
- `reboot`
