# Flatpak on stushiba

I've got a Zoom call coming up, and I don't want to weave Zoom into the fabric of my system by installing the AUR package for it, so I'm gonna try Flatpak

`sudo pacman -S flatpak`

picking `xdg-desktop-portal-gtk` when asked for a provider for `xdg-desktop-portal-impl`

got a missing package failure so I'm running `sudo pacman -Syu`

okay, now I'm rerunning the flatpak install command.

this entails a re-mkinitcpio, which I'm not sure of why, but ok, restarting

ran `flatpak install flathub us.zoom.Zoom` to install Zoom
