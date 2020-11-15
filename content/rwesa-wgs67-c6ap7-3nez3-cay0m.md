# first snag

from [pmbootstrap init on stuzzy](0qx01-0psny-939g9-50kz9-qdj84), here's where I start to realize this isn't going to be as simple as I thought:

## okay

So I'm going through the `patch.bat` file from the XDA post and figuring out what the MTK commands would be...

kicking off with `adb reboot bootloader` to get into fastboot

`fastboot oem unlock` and hitting the up key to confirm unlock

Now doing `fastboot reboot`

## setup, take 2

Going through the setup wizard - finding my wifi, etc

skipping Google setup

entering name, no lock pattern

Opening settings, going to system, About tablet, hitting Build number a bunch of times until Developer mode is unlocked

Backing out, enabling USB debugging

(the above is all stuff I did the first time around)

As soon as I enable it, since adb is stull plugged in and running I get a prompt to approve this machine

`adb root` still doesn't work - looks like I'm gonna have to figure out rooting it after all

Doing `adb reboot bootloader; fastboot boot CWM.img` fails

```
Sending 'boot.img' (12604 KB)                      OKAY [  0.493s]
Booting                                            FAILED (remote: 'invalid kernel address: not lie in memory')
fastboot: error: Command failed
```

(consults script) Ah, that's what TWRP is for

But the TWRP image included does nothing. I want a root shell

Newer images might work? downloading from https://dl.twrp.me/voyager/twrp-3.3.1-0-voyager.img.html

After waiting a while, the machine reboots, so I redo... and it still doesn't work. Seems like the TWRP Voyager builds are probably x86 too.

making notes for [my build and model numbers](xzchg-e0wee-42ahw-k69bg-k4z05)
