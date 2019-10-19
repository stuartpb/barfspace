# What the hell is wrong with TF2

reported to [Arch Forum](https://bbs.archlinux.org/viewtopic.php?pid=1868809) and [Valve GitHub](https://github.com/ValveSoftware/Source-1-Games/issues/2861)

## loose notes from Google Keep

(this describes a `pacman -Syu` I did, as well as the stuff described in the above links)

closing the process from ptty2 did not work

restarting gnome-shell reported running into an issue with the X server

sudo systemctl restart display-manager

yay -Syu choked on gentium

reinstalled all-repo-fonts which fixed this

retrying TF2 after everything had been restarted, froze again

tried again with -novid -safe and it froze the whole screen again once the music started - it got to the point where it displayed the background, but that's all

trying to bring the display manager back at this point crashed on login

rerunning -Syu

holding back ttf-google-fonts-git because I'd have to go back and check if I still need to patch it (UPDATE: I checked, the patches were merged, I updated it successfully)

## more thoughts

I have a *suspicion* that this is being caused by KDE Connect (under the reasoning that this seems to be a rare scenario, which is probably attributable to something weird on my system). I'm thinking about uninstalling it and, if I want to try it on my system, taking the [Arch Wiki's advice](https://wiki.archlinux.org/index.php/KDE#KDE_Connect) and installing `gnome-shell-extension-gsconnect` later if I want KDE COnnect.
