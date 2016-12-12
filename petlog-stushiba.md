# From installation media

closely following https://wiki.archlinux.org/index.php/Beginners%27_guide

## as root outside chroot (essentially, from memory)

- `blkid`
- parted: add 512mb fat32 partition followed by 513MB-100% ext4 partition
- mkfs.fat for ESP, mkfs.ext for root (with label 'stushiba')
- label ESP 'ESP'
- dhcpcd messing around due to wifi stick not being in kernel
- `cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak`
- `pacman -S reflector`
- `reflector --verbose -c US -f 200 --sort score -p https --save /etc/pacman.d/mirrorlist`
- `mount /dev/sdc2 /mnt; mkdir -p /mnt/boot; mount /dev/sdc1 /mnt/boot`
- pacstrap a bunch of stuff:
  - base, base-devel
  - git
  - gnome
  - weston
  - chromium
  - firefox
  - mpv
  - deluge
  - refind-efi
- choose xf86-input-libinput when prompted since it looks like that's the future
- everything else is defaults

## in chroot (from `sudo cat /root/.bash_history`)

- uncomment `en_US.UTF-8` in /etc/locale.gen
- `echo 'LANG=en_US.UTF-8' >/etc/locale.conf`
- tzselect (thinking it would do something I didn't already know)
- `hwclock --systohc --utc`
- `ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`
- `refind-install`
- install inkscape, nodejs, npm (could have done as part of pacstrap but w/e)
- set hostname to 'stushiba' in /etc/hostname and /etc/hosts
- install iw, wpa_supplicant, and dialog in hopes that I'll be able to use my wifi
- `passwd`
- `EDITOR=nano visudo`, uncomment the first wheel line
- `useradd -c "Stuart P. Bentley" -m -G wheel stuart`
- `passwd stuart`
- `exit`

reboot after leaving chroot

## rebooting

try starting arch, get a bunch of errors, remember there's a thing to do, cut system power and retry

reboot, F12, select rEFInd, jam edit keys until seeing the option for editing launch options

add `iommu=pt` to kernel opts because for some reason everything USB fails without it

## after booting and logging in

### hilarious comedy of errors

- `curl aur.sh`
- oh wait I have no dhcp
- crap what's the thing to start dhcpcd with systemctl
- `sudo pacman -S bash-completion`
- derp, can't reach remotes to install without an ip
- `sudo systemctl start dhcpcd.service`
- `curl aur.sh`
- hmm still doesn't seem to be working
- `if link`
- derp
- `ip link`
- `sudo systemctl start dhcpcd@enp3s0.service`
- what it says there was a problem
- `sudo systemctl status dhcpcd@enp3s0.service`
- wait I never enabled dhcp that's not a thing
- derp
- `curl aur.sh`
- works now, I guess that first `systemctl start dhcpcd.service` must have finished
- ¯\\\_(ツ)_/¯

### painful attempts to install packer

I forgot `<(curl aur.sh)` is a thing and that the install flag to makepkg is `-i` and not `-u`
and that bash won't pass scripts flags when piped and basically kept pieing myself in the face

the real punchline comes about half an hour later

- `mkdir aur`
- `cd aur`
- `curl aur.sh | bash -su packer`
- `pacman -S jshon expac`
- `sudo install pacman -S jshon expac`
- `curl aur.sh | bash -su packer`
- `packer -S rtl8812au-dkms-git`
- `ls`
- `man makepkg`
- `curl aur.sh | bash -i packer`
- `curl aur.sh | bash -is packer`
- `curl aur.sh | bash -ifs packer`
- `rm -rf packer`
- `curl aur.sh | bash -ifs packer`
- `sudo packer -S rtl8812au-dkms-git`
- packer is not installed
- `sudo curl aur.sh | bash -ifs packer`
- `rm -rf packer`
- `sudo curl aur.sh | bash -ifs packer`
- `sudo packer -S rtl8812au-dkms-git`
- packer is still not installed
- `man pacman`
- `ls packer`
- `sudo pacman -S packer/packer-20150808-1-any.pkg.tar.xz`
- `sudo pacman -U packer/packer-20150808-1-any.pkg.tar.xz`
- `sudo packer -S rtl8812au-dkms-git`
- error involving `--asroot` not being an option to `makepkg`
- `man makepkg`
- `sudo packer -S rtl8812au-dkms-git`
- not seeing a problem in the pkgbuild or anything
- still won't work
- furious googling
- https://bbs.archlinux.org/viewtopic.php?id=191793
- reading the guy being a dick about `sudo`
- reads more
- oh wait

### packer is finally installed and I know how to use it

still dont know how to dkms tho

- `packer -S rtl8812au-dkms-git`
- barf about not having the kernel headers
- frantic searching and headscratching trying to remember what the name of the package with the Linux headers is
- `pacman -S linux-headers`
- `sudo pacman -S linux-headers`
- installing the headers triggers DKMS and builds the wifi driver

## and now we're caught up: opening https://gist.github.com on my Chromebook

at this point I remember that I should be writing this down (always log tweaks you make to a pet box, especially if you're
breaking the package database with compiled kernel modules):

- write section one from memory `pacman -Qq | less` for what I might have pacstrapped, and `head /etc/pacman.d/mirrorlist` for the reflector command
- write the second part from the output of `cat /root/.bash_history` like I said
- `less ~/.bash_history`

contents of `/home/stuart/.bash_history`:

```
#!/bin/bash
d=${BUILDDIR:-$PWD}
for p in ${@##-*}; do cd "$d"; curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$p.tar.gz" |tar xz; cd "$p"; makepkg ${@##[^\-]*}; done
#!/bin/bash
d=${BUILDDIR:-$PWD}
for p in ${@##-*}; do cd "$d"; curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$p.tar.gz" |tar xz; cd "$p"; makepkg ${@##[^\-]*}; done
#!/bin/bash
d=${BUILDDIR:-$PWD}
for p in ${@##-*}; do cd "$d"; curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$p.tar.gz" |tar xz; cd "$p"; makepkg ${@##[^\-]*}; done
#!/bin/bash
d=${BUILDDIR:-$PWD}
for p in ${@##-*}; do cd "$d"; curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$p.tar.gz" |tar xz; cd "$p"; makepkg ${@##[^\-]*}; done
#!/bin/bash
d=${BUILDDIR:-$PWD}
for p in ${@##-*}; do cd "$d"; curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$p.tar.gz" |tar xz; cd "$p"; makepkg ${@##[^\-]*}; done
```

- using arrow keys, write the last part from the terminal's live command history buffer

## changes after creating build log

- yet to see if wifi module actually works
- https://wiki.archlinux.org/index.php/General_recommendations
- decide not to do any of https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup in favor of just seeing if the bios has something
- remember display managers are a thing
- install and enable lightdm
- discover deepin and figure what the heck, install deepin and deepin-extra too
- Add iommu=pt to boot configs in /boot/refind_linux.conf
- /boot/EFI/refind/refind.conf:
  - change `scanfor` to be the Mac default (incorporating BIOS boot options)

### reboot

- "Incorrect password" every time at lightdm
- Nothing anybody is saying online helps
- open another teminal and change password to "lol"
- try again
- works
- note to self that I should file a bug about this
- enabled and started the NetworkManager.service
- uninstalled chromium, installed google-chrome (dat netflix)
- installed a bunch of WM/DEs, text editors, and goofs:
  - scite
  - scribes
  - tea
  - gobby
  - mate, mate-extra
  - lesstif
  - windowmaker
  - notion
  - i3-wm
  - xfce4
  - xfce4-goodies
  - bsd-games
  - fortune-mod
  - cowsay
  - ponysay
  - sl
- `sudo pacman -S $(pacman -Ssq adobe pro-fonts)`
- installed some driver stuff:
  - mesa-vdpau
  - libva-vdpau-driver
- installed obs-studio

## updated 2016-12-11

booted back into Linux because Steam on Windows is being horrible (1-byte-per-second disk write times) and Windows Update is hung and I think I just need to let that disk cool off a bit and I should check out what's new Linux-side.

I haven't touched this since probably September (going by my Tabalanches), so I ran a BIG HONKING STINKING HUGE 500+ PACKAGE `packer -Syu`, it required some geoclue magic and the ttf-dejavu force that's listed on the Arch frontpage right now.

got everything updated and installed some stuff (that new package that makes steam native runtime work correctly, *finally* installed `bash-completion`), rebooted.

wifi adapter kernel module is somehow broken again roflofloflasdgf;;;;;, went over and grabbed my ethernet cable and plugged in

searching for what's up (googling "rtl8812 arch")... not really sure but I think I might pivot on over to https://aur.archlinux.org/packages/rtl8812au_rtl8821au-dkms-git/ which looks a lot more actively maintained

No amount of `packer -S rtl8812au-dkms-git` has resurrected the old driver so I'm moving on over to gnab's

when I update/remove it it keeps saying there are no instances of it in the dkms tree which is weird:

```
:: Running pre-transaction hooks...
(1/1) Remove DKMS modules
==> dkms remove rtl8812au/r62.be75251 -k 4.8.13-1-ARCH
:: Processing package changes...
Error! There are no instances of module: rtl8812au
r62.be75251 located in the DKMS tree.
error: command failed to execute correctly
(1/1) removing rtl8812au-dkms-git                  [######################] 100%
```

probably because it removes it first, idk

moving to rtl8812au_rtl8821au-dkms-git fixed it so whatever