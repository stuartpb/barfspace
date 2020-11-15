# game boy emulation adventure log

put my USB flash drive in and there's no filesystem entry for it?

I mean, I could just `sudo mount /dev/sda1 /mnt`, but surely there's a better way, right?

uh, [the official documentation](http://chip.jfpossibilities.com/docs/chip.html#usb-storage-devices) suggests manually adding an entry for each USB flash drive to `/etc/fstab`, so, uh, apparently not I guess

they also suggest making a `/drives`, which I thik is extra stupid when `/media` is right there

some day, when I want the space, I could probably set up a udev rule
