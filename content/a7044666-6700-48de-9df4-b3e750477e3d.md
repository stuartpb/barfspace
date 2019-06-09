# 2018-09-11

- `yay -S signal` - opting to remove make dependencies after installation (I'm thinking I'd probably rather have them met by npm, at least the nvm dependency that isn't in the official repos)

oh, checking out nvm's package.json, it's not really specially made to be installed via npm, it's better to just do its hacky git suggestion, in which case I guess the AUR version of the package is fine

okay you know what, heck, now that it's installed, let's `yay -Syu yarn nvm`

choosing to cleanbuild [I]nstalled packages

I don't particularly need nvm by default so I'm not going to add it to my .bashrc

## GNOME

Enabled https://extensions.gnome.org/extension/1276/night-light-slider/ and tweaked the nightlightness (less at first, then later as it got later)

### Tweaks

Enabling keyboard control on the window switcher

Changed default application theme to be Adwaita-dark

## GPaste

Reduced maximum history items to display to 15 in gpaste so the dang extension menu would fit on screen (shouldn't there be a way for it to avoid being bigger than that?)
