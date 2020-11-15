# 2018-09-02: the rescue

## chrooted from sturling

(see the relevant changelog for today on sturling)

First off, since I no longer need my wi-fi adapter, the first thing I do is run `pacman -R rtl8812au-dkms-git`.

With that out of the way, I run `pacman -Syu`, and choose to replace everything that's been replaced since I was last able to do this.

I really need to remove packer, I'm just realizing now that the reason it's been telling me it was "newer than community" has been that it was comparing the AUR helper to packer.io

The replacements fail due to a few dependencies that would be broken:

- attica-qt4 goes up the chain to `lightdm-kde-greeter`
- Some video codec packages go up to vlc
- One last package is pinned by libxfont which nothing seems to need anymore

I start to resolve the issue with `pacman -R libxfont`, but `lightdm-kde-greeter` appears to have been dropped by the official repositories (and not to the AUR, either). I wasn't using it anyway, so I'm just going to go ahead and `pacman -R lightdm-kde-greeter` to solve the problem for now (maybe this was just a weird glitch, and the package will come back at some later date when I feel like trying out the KDE greeter for LightDM).

I also remove `kdelibs` and `kdebase-runtime`, since apparently pacman can't just figure out "remove any unused dependencies that would conflict with this thing" on its own. (These sound like things other KDE stuff would need: did I remove the rest of KDE at some point and this was just what was left? I don't have any record of doing that, but then, I'm not sure I would have kept such a precise record a couple years ago.)

Since the `[y/N]` conflict replacement is at the end of a *long* line of `[Y/n]` prompts, I'm running `pacman -S --asdeps attica` on its own so I can breeze through these prompts by holding down Enter

I run `pacman -S vlc` to shake things up, but "Updating the vlc plugin cache" fails due to the needed GLIBC versions being missing. I'll re-run it once I update the system.

Since I now have nothing that'd need it, I run `pacman -R ffmpeg2.8` (the video codec dep blocker).

*Now* I can run `pacman -Syu` normally.

After waiting for everything to download and everything, I get a few signature errors, so I run `pacman-key --refresh`, then retry.

Now, I run into [this issue](https://www.archlinux.org/news/js52-5273-2-upgrade-requires-intervention/), so I remove the offending file and retry...

and *now* it works.

## now upgrading 1040 packages, hold on to your butts

A bunch of the core filesystem files are installed as pacnew, so I'll have to go through and merge those at some point.

Upgrading fontconfig had a bunch of "failed to write cache" issues that are probably fine

Upgrading jack mentioned a new "realtime-privileges" package that sounds interesting and was apparently introduced [just a little over a month ago](https://www.archlinux.org/packages/community/any/realtime-privileges/)

I have a directory permissions differ error for samba, `var/lib/samba/private` is 755 where it should be 700

I also have some permissions mismatches with ceph, `/etc/ceph`, `/var/lib/ceph` and `/var/log/ceph` are all 755 where they should be 750

a couple pacnew files for pacman, no surprise there

the "vde2" package mentions something about config files that I could understand, if I remembered what vde2 was. (A virtualization thing?)

also a pacnew for libvirt. the update tells me

```
>>> You may need to run 'rm -rf ~/.libvirt'
```

so that's something to keep in mind

libvirt also tells me I can install qemu-block-gluster for qemu glusterfs support, which is something I could conceivably experiment with

i3-wm and libmagick6 have some pacnews

lib32-fontconfig has the same cache issues as the native one, not surprising

**oh derp** upgrading linux tells me "/boot appears to be a separate partition but is not mounted", which is true, meaning it's probably not going to rebuild the kernel until I remount and redo, the *main thing I wanted to happen*, derp

another directory permissions issue on NetworkManager, which also mentions there's a new alternative to wpa_supplicant called iwd that I might want to look into

obs-studio has luajit as a dependency for scripting support. Does that mean as a dep for JIT support, or for Lua support in general?

apparently there's an "opencv-samples" package now for opencv samples

refind-efi has a lot of messages on installation that make me think I ought to reinstall that after mounting /boot, too

## everything up to date

I `exit` the chroot, mount boot appropriately, and re-enter the chroot, then `pacman -S linux refind-efi`.

The linux update appears to work - the rEFInd update doesn't seem to do anything.

I review [the Wiki article](https://wiki.archlinux.org/index.php/REFInd) and, oh yeah, that's right, rEFInd uses the `refind-install` command to install. I run a raw `refind-install` just to see how things go. I *almost* run `refind-install --use-default /dev/sdc1`, but then I stop myself, as I honestly don't remember if that breaks Windows booting, and I don't want to have to go through that whole mess again (especially since I don't remember how I resolved it last time).

Anyway, at this point I'm feeling confident enough to exit sturling and see if I can boot back into stushiba.
