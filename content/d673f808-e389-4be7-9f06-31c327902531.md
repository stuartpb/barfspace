# stuzzy todo

- https://wiki.archlinux.org/index.php/Yubikey

## QEMU

want to look into booting sturling/stuquart via VM

## GNOME issues

- make it so gsudo doesn't prompt me for my password, just like sudo?
  - might need to switch to pkexec: https://unix.stackexchange.com/questions/174214/is-there-a-graphical-sudo-kdesudo-gksudo-su-to-root-tool-that-works-pas/174249
- upstream touchpad patch in gtk+
- what is the deal with these ligatures in monospaced text? it's happening in Google Chrome, and it sucks.
- Someone needs to tell GNOME "Disable until Tomorrow" for a program that goes from sunrise until sunset (Night Light) should use a definition of "tomorrow" that isn't based around 12:00 AM :facepalm:
- Could have the decency to bring a window I'm trying to drag a file into to the front after a second, like maybe rearrange the windows a little or just make it so it's not too tough to refocus on the original window if you need to drag back to the original (ie. if the whole original window was within the bounding box of the target, move the window to the edge nearest where the cursor entered, off by like half the icon size or whatever), and returning to the original returns focus immediately so you don't end up in the "oh I've made a mess of these" state

## Atom tweaks

- Is there an option to always Reveal in Tree View whenever you switch to a buffer for a file that's within your project? Should this be a package? Is there already one?

## fixing kernel errors on startup

`journalctl -kp err` shows two separate issues right now:

### cros_ec_lpcs

`cros_ec_lpcs cros_ec_lpcs.0: EC ID not detected`

Googling the message indicates this is coming from https://github.com/torvalds/linux/blob/master/drivers/platform/chrome/cros_ec_lpc.c#L261

Looking at what this module is by the comment at the top of the file: hey, is that why I've been feeling like this keyboard kinda sucks? I've been assuming it's just because the keys are cheap and wobbly/sticky.

Anyway, this might just be a feature that's never going to work due to the firmware - should I blacklist this module?

### mei_me

```
mei_me 0000:00:16.0: wait hw ready failed
mei_me 0000:00:16.0: hw_start failed ret = -62
mei_me 0000:00:16.0: wait hw ready failed
mei_me 0000:00:16.0: hw_start failed ret = -62
mei_me 0000:00:16.0: wait hw ready failed
mei_me 0000:00:16.0: hw_start failed ret = -62
mei_me 0000:00:16.0: reset: reached maximal consecutive resets: disabling the device
mei_me 0000:00:16.0: reset failed ret = -19
mei_me 0000:00:16.0: link layer initialization failed.
mei_me 0000:00:16.0: init hw failure.
mei_me 0000:00:16.0: initialization failed.
```

https://www.google.com/search?q=%22mei_me+0000+00+16.0+reset+reached+maximal+consecutive+resets+disabling+the+device%22 indicates that this is a sort of weirdly-common (and most likely harmless) issue, with lots of unrelated issues including it in their log output without anyone commenting or noticing.

This is the closest thing I could find to anybody even remotely caring about this error: https://www.spinics.net/lists/linux-8086/msg00845.html
