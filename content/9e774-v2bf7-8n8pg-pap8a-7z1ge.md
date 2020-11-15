# 2018-09-05: erasing the vestigial stuzzy

Continuing from the end of the "two quick changes" section in the 2018-09-05 changelog for stuquart:

Before I take this flash disk (the original storage for stuzzy, the one I set up for a day as a tentative "stukilla mk 2") out of the drive bay it's been sitting in to place, I want to clobber the data that was previously on it by repurposing the drive to some other ends.

I'd like to completely reset this drive (not just clearing data, but reverting its performance to factory-new), so I look at https://wiki.archlinux.org/index.php/Solid_state_drive/Memory_cell_clearing, and it's got some interesting suggestions, but it notes that the drive shouldn't be wiped over USB. I was initially going to try to reset the drive from stuzzy (see the beginning of [stuzzy changelog 2018-09-05](rhm0a-y39ja-0s9vq-ygbmn-j8684)), but after reading this, I put it off until I could connect the chip to a motherboard directly.

I've still got stuzzy opened up from installing stuquart the second time, so before I put the drive back in, I'm going to boot back into sturling and do the thing for resetting a flash chip.

I run `pacman -Syu hdparm` to update the system and install `hdparm`.

After checking that this is the right drive via `lsblk`, I run the commands from https://wiki.archlinux.org/index.php/Solid_state_drive/Memory_cell_clearing (doing an enhanced wipe, even though they look like they're probably the same thing), though I used a different password than their example.

At this point, I pulled the flash chip out, put the stuzzy SSD back in, and put the base's cover back on; I took the hard drive for stuquart, put it back in the USB enclosure, and resumed trying to boot from *that* on stuzzy's chassis. (See "after some reboots", the section after this diversion in stuquart's 2018-09-05 setup log.)
