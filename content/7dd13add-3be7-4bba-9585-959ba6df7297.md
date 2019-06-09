# 2013-08-21 changelog additions

## LXDE

- `~/.config/lxsession/LXDE/desktop.conf`: `window_manager=openbox-lxde` changed to `window_manager=compiz ccp --indirect-rendering`
  - see https://wiki.archlinux.org/index.php/LXDE#Replacing_window_managers

## XFCE

 - Enabled compositing for xfwm, then disabled it because Compiz couldn't overtake it when compositing was enabled (some error)
