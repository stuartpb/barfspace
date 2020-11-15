# uuuugh

Context menu popped up in PrusaSlicer, and that stuck GNOME in a state where no clicks or keystrokes were recognized.

might have had something to do with having started PrusaSlicer alpha 4 concurrent with alpha2

hopped over to vt3, where I was already logged in after an earlier freeze (oh yeah, that's another thing, the swap situation is absolutely fucked)

Doing a `killall gnome-shell -3` or whatever didn't fix it

## various X commands to fuck with X

NOTE: all these following X commands were with `DISPLAY=:0` manually specified

Went through stuff with `wmctl` and `xdotool` trying to kill the popup (stuff like `xprop` couldn't grab mouse), but even closing all the PrusaSlicer windows did nothing

`xdotool key XF86Ungrab` did nothing

Trying `xfwm4 --replace` only made things worse (the session went to "Oh no!" mode)

## anyway

couldn't get the thing to work, so I ran `sudo pacman -Syu`, exited, hopped to gdm on vt1 and hit the reboot button

On startup, I decided to switch back to GNOME on Wayland, since my biggest issue with it (the desktop switching to my Vive when the screen is turned off) is no longer relevant (I don't turn my screen off as much, and I haven't plugged my Vive back in since I moved) - I'll see how the issues I were having before have fared as I go

## problem still happening

systemd-swap never dies during shutdown, had to hard-kill the machine.
