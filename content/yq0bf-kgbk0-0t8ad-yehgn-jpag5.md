# 2016-11-27: installing arch linux on a chromebook

## uuuuuuugh

followed the pretty straightforward instructions to put the alarm image on an sd card from chrome

tried to follow the instructions again to wipe chromium etc but, oops, no cgpt within Arch

installed cgpt on sd card via `pacman -s cgpt` (which is an alias for `vboot-utils` somehow?), lucky break

changed sdcard hostname so I'd know when I'm experimenting on that and not the locally-installed system

installed mesa-libgl because the other 4 (imx-gpu-viv) are for some kind of special chip that's irrelevant, and it's kind of annoying that I was asked, actually

installed the xf86-input-libinput instead of the evdev one

installed the regular libx264 because 10bit is mostly an encoding advantage and doesn't have hardware support

went with noto fonts for ttf-font satisfaction because hey why not that's chromey (obvs I'd rather do them all but it only prompted for one)

install git, metasploit, chromium, awesome, notion, budgie-desktop, lightdm

bunch of other stuff that's probably in paclog

bashed my head against the wall for a while because I didn't consult notes or wiki about having to install a greeter for lightdm, and didn't think to check the lightdm log file to figure this out

uncommented the en us utf8 locale line in /etc/localegen.conf (because apparently alarm does everything else but not THAT) then ran localegen

uninstalled xf86-input-evdev and -synaptics which got inadvertently installed while trying to make lightdm work

## running

installed guake, changed the hotkey to F1 because lol chromebooks have no f12

logging out and running `sudo usermod -l stuart -m -d /home/stuart alarm && groupmod -n stuart alarm` because why keep a dormant user around, especially when I've already started to customize this one

changing password to something new, too (this broke the gnome keyring so now that's something I need to fix)

created a conf file to make the touchpad finger-friendlier, but still not wild about it (see todo in [plan.md](609y7-2n1yw-mm9y0-w1431-fbb0h))
