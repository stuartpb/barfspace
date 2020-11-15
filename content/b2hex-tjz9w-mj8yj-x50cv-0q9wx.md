# Switching to GDM and seeing if Wayland fixes anything

```
[stuart@stushiba ~]$ sudo systemctl enable gdm
Failed to enable unit: File /etc/systemd/system/display-manager.service already exists and is a symlink to /usr/lib/systemd/system/lightdm.service.
[stuart@stushiba ~]$ sudo systemctl enable gdm --force
Removed /etc/systemd/system/display-manager.service.
Created symlink /etc/systemd/system/display-manager.service → /usr/lib/systemd/system/gdm.service.
```

https://wiki.archlinux.org/index.php/LightDM#Wayland_session_not_working_with_duplicate_GNOME_entries_in_greeter

running a `pacman -Syu` (followed with a `yay -Syu` for good measure) and restarting

## oh, right, this crap

the login screen came up on my Vive, not my desktop.

Fixed by hopping into tty2 and running, on the advice of the Arch Linux Forums:

```
sudo cp ~/.config/monitors.xml ~gdm/config/monitors.xml
sudo chowm gdm:gdm ~gdm/config/monitors.xml
sudo systemctl restart gdm
```

Still not seeing Wayland

This is weird though:

```
[stuart@stushiba ~]$ loginctl
SESSION  UID USER   SEAT  TTY
      2 1000 stuart seat0 tty2
      4 1000 stuart seat0 tty3
     c1  120 gdm    seat0 tty1
     c3  120 gdm    seat0 tty1

4 sessions listed.
[stuart@stushiba ~]$ loginctl show-session 2 -p Type
Type=tty
[stuart@stushiba ~]$ loginctl show-session 4 -p Type
Type=x11
[stuart@stushiba ~]$ loginctl show-session c1 -p Type
Type=wayland
[stuart@stushiba ~]$ loginctl show-session c3 -p Type
Type=x11
```

Gonna try restarting and see what happens then

## BOOM

running `echo $WAYLAND_DISPLAY` echoes `wayland-0` now

installing obs-gnome-screencast from AUR so I can do screencasts from this
