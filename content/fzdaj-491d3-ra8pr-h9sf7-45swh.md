# 2018-08-31

I want to screw with some partitions, so `sudo pacman -S gparted` (and also `ntfs-3g` and `gpart`, as I need the former to interact with the device I will be saving images to, and the latter just sounds useful).

Imaged my first Chromebook's storage to my archival / backup drive (because, hey, neat artifact) via `sudo dd if=/dev/sdc conv=sync bs=8MiB status=progress | gzip -c > /run/media/stuart/ateworld/images/c720p.img.gz`; it took 4400 seconds. Maybe I should have done `sudo fdisk -l /dev/sdc > /run/media/stuart/ateworld/images/c720p_fdisk.info` first:

```
Disk /dev/sdc: 29.8 GiB, 32017047552 bytes, 62533296 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 33553920 bytes
```

D'oh. Well, anyway, it's done now.

## Bootstrapping a new sturling

`sudo pacman -S arch-install-scripts`

From here, I'm going to fork off to a changelog for this new sturling installation

## Tabalanche

A minor point I didn't note on 2018-08-30 was that, while I mostly avoided making any changes to the live system, I did open a few tabs for relevant documentation (mostly around touchpad weirdness) that I'd want to have in the final system, so I exported them to a Gist, and then imported them in the new installation.

I guess this section is mostly just here to plug the versatility of Tabalanche and stroke my ego

## dev stuff

I'm installing nodejs and atom with `sudo pacman -S atom nodejs` (nodejs would otherwise be installed as a dependency, and I want to install it explicitly)

I went back and forth on whether I'd want to install npm implicitly: I ultimately decided I'd let it install as a dep, since there are potentially better ways to install npm that some explicit package in the future (like, I don't know, nvm) might conflict with

also doing `sudo pacman -S --asdeps ctags` because I saw it's an optional dependency and it sounds neat

### Atom

Added `.gfm` to Scope Blacklist in Autocomplete Plus settings

## GNOME Settings

Turning off automatic suspend when the machine is plugged in

`sudo pacman -S gnome-tweaks`

In Tweaks, I changed the default monospace font to be Noto Sans Mono Regular (which I hope won't use any freaking ligatures)

under Keyboard & Mouse, I set the Acceleration Profile from "Default" to "Adaptive" - even though every doc source I came across implied the default should be Adaptive for touchpads, it definitely felt like the default was Flat. (I might drop the overall touchpad speed back down to the original, now that I don't have to compensate for a lack of acceleration.)

I also turned off "Middle Click Paste", which I never intend to use.

Turning on Date on the top bar

gnome-tweaks doesn't have everything I need to address all the issues I have, so I'm falling back to `sudo pacman -S dconf-editor`, the regedit of GNOME
