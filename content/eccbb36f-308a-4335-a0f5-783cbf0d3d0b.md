# Problems in the Wayland world

So, I switched to Linux in part because of a problem I'd been having with Windows where, when I'd turn my monitor off, the system would helpfully turn my Vive on.

That started happening now, so I loked up and found that this command would turn off my monitor via DPMS:

```
dbus-send --session --dest=org.gnome.ScreenSaver --type=method_call /org/gnome/ScreenSaver org.gnome.ScreenSaver.SetActive boolean:true
```

Running this command caused problems.

It took me to something like a lock screen, but with no clear facility to unlock? (edit: the unlock mechanism appears to be "drag the entire scrren up", with no UI explanation)

I couldn't change VT via ctrl+alt+f2 so I had to SSH in and run `sudo loginctl unlock-sessions` (also edit: apparently vt2 is the UI terminal when gdm runs: should have tried 3 or higher)

when it came back, Firefox had crashed
