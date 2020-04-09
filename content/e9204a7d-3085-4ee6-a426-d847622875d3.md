# Stushiba Boot Fuckup 2020

Looks like something has been leaking memory uncontrollably or something, but at least the OOM killer was working properly - I couldn't watch Hulu or scroll a lot of Twitter without the tab dying.

Frustrated, I decided to reboot, and before that, I'd run `yay -Syu`.

During installation, some stuff failed due to `/tmp` having no space left on device, so I decided to just abort (during the `go` installation) and do the reboot anyway.

Of course, this meant I was rebooting after the system had removed initcpios from /boot, but before the new ones were installed.

So now the only thing on my menu at boot in rEFInd was Windows.

Fuck.

## recovering

From Stuzzy, Had to torrent the new Arch install media, and download Etcher.

For some reason, the flash drive was being listed in `sudo lsusb`, but not `sudo lsblk`, so I did a `yay -Syu` and reboot on Stuzzy, which fixed it.

## After that

Running `sudo paccache --md5sums`, the only packages to show any issues were `linux` and `vlc`, so I did `sudo pacman -S linux vlc`

Afterward, `sudo paccheck --md5sum --list-broken` still shows them as broken

Apparently this is just working-as-intended: see https://bugs.archlinux.org/task/54111 and https://bbs.archlinux.org/viewtopic.php?id=248723

maybe at some point I'll fix the permission errors paccheck can uncover but whatever
