# stusberry initial setup 2020-08-27

following https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4

I briefly considered doing the partitioning on LVM, but ultimately decided that, as this is an installation I intend to use for [TCB](c15a0-8ksbr-ce9j6-6c71x-zc58v), I should save the and go for the least-controversial options I can stand, minimizing my chances of running into problems that wouldn't be covered by the support community. (I'm still using Arch and not any of [Raspberry Pi's suggested OSes](https://www.raspberrypi.org/downloads/), though, because I don't want to suffer like that.)

opening a terminal in Downloads

## finding the device

running `blkid` to find the microsd

```
/dev/sde1: UUID="0123-4567" BLOCK_SIZE="512" TYPE="exfat"
```

lol (yes, that was the real "UUID" of the shipping card, blame Silicon Power)

lsblk confirms it's sde

## picking the architecture

getting ahead of the game a bit before dropping into root by `wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz`

I could have gone with archv7 as the tutorial describes being necessary for incorporating Raspberry's hacks, but it sounds like I won't need those; to whatever extent I may, it sounds like I can probably load Raspbian or whatever onto [stuleo](jfvbc-w0k7v-mcbb0-ye4wj-3mj69) and/or [The Stunicorn Ring](g5ktz-kzv3a-r0arf-cqmdm-f0x0k)

Again, I'll pick the more-supported option, but only to the extent that I'm not inflicting upstream color on myself.

## anyway partitioning

synthesizing this against https://wiki.archlinux.org/index.php/Partitioning

I `sudo -i` and dive into a root shell

`cd /home/$SUDO_USER/Downloads`, for later

I start partitioning with `fdisk /dev/sde`

doing `g` because I want a GPT, not an MBR

`n` enter (1) enter (first sector 2048) `+200M`

`t` then 1 to set it to an ESP

`n` enter enter enter to fill the rest with the Linux partition

`w` out

herp derp, that didn't work because the device's starting partition was mounted, duh. `umount /dev/sde1` and we do it all over again.

## formatting

`mkfs.vfat /dev/sde1 -F32 -n ESP`

oh, wait, I'm gonna want to make mountpoints, damn it

let's go ahead and `cd $(mktemp -d)`

`mkdir boot && mkdir root`

`mkfs.ext4 /dev/sde2` - no label, society has progressed beyond the need for labels

## mounting and copying

`mount /dev/sde1 boot && mount /dev/sde2 root`

I almost decided to chump out and install [the 32-bit version](http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-4-latest.tar.gz) instead, but then I realized that would rather defeat the purpose of installing this for a Pi with *double* the 4GiB limit

`bsdtar -xpf /home/$SUDO_USER/Downloads/ArchLinuxARM-rpi-aarch64-latest.tar.gz -C root && sync`

`mv root/boot/* && sync`
