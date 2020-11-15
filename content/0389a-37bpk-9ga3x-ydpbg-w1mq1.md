# screen and touchpad issues

## screen flickering

`pacman -S mesa-demos` so I could maybe run `glxinfo` and figure out what common factor is making my screan tear and all kinds of chip-is-failing artifacts?

## touchpad dumbness

looking for a simpler way I could put together the control module for NeckFX got me into EasyEDA, which uses space as pan. for whatever reason, GNOME doesn't have the same ability as, say, Chrome OS to detect and differentiate holding down the spacebar for panning, and typing a lot of spaces, and so it helpfully *disables the touchpad* while the key is held down.

I may or may not toggle this function off entirely, but I'm not sure the touchpad on this laptop is safe enough? might have to just toggle it on an as-needed basis

while I'm on the subject of papercuts from Chrome OS and/or Windows: this Linux touchpad behavior when clicking and especially *dragging* is a nightmare, because releasing often involves a lot of kickback, and you end up missing your target and dropping things in the wrong place

and I wish I could have scrollball-like cursor inertia

https://www.phoronix.com/forums/forum/linux-graphics-x-org-drivers/wayland-display-server/1002656-libinput-1-10-is-on-the-way-to-remove-touchpad-hysteresis complains about this stuff a bit too

# caps lock

heck, while we're on the subject of stuff in Tweaks, this deep little menu under Keyboard for "Caps Lock behavior" has so many cool possibilities, some maybe dovetailing well with the idea of having a compose key, or making caps lock Escape When Not Shifted (giving it Vim utility)?

[this](https://askubuntu.com/questions/677979/how-can-i-use-caps-lock-to-capitalize-semi-colon) is as far as I got

anyway, I feel like, if I'm gonna keep Actual Caps Lock, I should probably get some on-screen notifier for it, since this keyboard has no LED for it (I guess Chrome OS has a pop-up when Caps Lock is on, since it's shift+search on newer Chromebooks)

# and speaking of the keyboard

What's the deal with my function keys? Am I going to just have to ignore the icons forever? Is there nothing I can do with the "fn" key?
