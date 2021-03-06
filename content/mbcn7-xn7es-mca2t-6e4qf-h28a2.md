# Samsung Chromebook: From the Top

Continuing from [having retired the previous installation](p2wzm-sh7c0-r98tm-jsza6-jjp0g)

Having restored the stock image using the recovery disk, I reenable [developer mode](https://mrchromebox.tech/#devmode) with Esc+Refresh+Power and Ctrl+D

I'm collecting [various resources](5vsag-kwevb-s19et-a5y9r-ztf05) about this machine (and Chromebook stuff in general), looking to remove the write-protect screw

Once I'm in on developer mode, I tried MrChromebox's bootloader helper script, but it doesn't work for ARM

Looking into the source a little more, this would seem to be due to it pulling a precompiled binary from MrChromebox's site for `flashrom` which is compiled for x64

I tried nabbing the one from the `flashrom.google` ALARM package, but (after doing `/lib/ld-2.27.so flashrom` to work around the user's home directory being mounted [noexec][], causing "permission denied" errors when trying to execute it directly even though it it had r+x permissions) this unsurprisingly dies to `error while loading shared libraries`.

[noexec]: https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md "tangentially related cros dev docs about noexec"

I'm now considering re-installing ALARM, just to get flashrom - I mean, I could go and recursively figure out how to get all the dependencies for it loaded onto the system, but at that point I might as well just use crouton, and I don't want to get too invested in this cros install.

But then I realize installing a new OS would mean I wouldn't have the gbb utility. And, now that I look at it, the gbb utility is just a legacy alias for `futility`, which seems to have all the flashrom features I'd need to set the gbb stuff?

## You know what?

The more I look into this, the more I realize that this machine was a real anomaly in the Chromebook development pipeline - it's [the only one](http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/custom-firmware) that uses this firmware configuration (this might be why, contrary to [what the Arch Wiki says](https://wiki.archlinux.org/index.php/Chrome_OS_devices/Custom_firmware#Get_flashrom_for_Chrome_OS), flashrom does *not* appear to be included in its shipping version of Chrome OS), and the hardware support all comes from proprietary blobs (hence all the trouble I had with non-accelerated graphics as stukilla).

I think I'm just going to keep it around as an "emergency Chromebook", maybe for kiosk use (or to use to flash recovery media for another Chromebook in a pinch) - unlike the Chromebook I repurposed for [stuzzy](gsmaa-6w3x5-mw9af-frvsb-j074b), it's not past its end-of-life support. (Also unlike stuzzy, opening this device up to remove its write-rotection is *really* messy, and would involve a lot of spudging that's liable to break the casing.)

Admittedly, there *is* a nice amount of documentation out there around how to rebuild the firmware, so if I ever *did* feel like hacking it into something else, it's probably a good candidate (a lot of later Chromebooks have no distinct documentation on the Chromium wiki), but that can wait for the day Google pulls support for it - until then, it's just a serviceable Chromebook with low color depth and only 2 gigs of RAM.

## Oh, actually...

Typing `sudo su`, I see that I *do* have access to `flashrom`...

You know what, though? I stand by the stuff I said above - keeping Chrome OS on this is the only way to ensure that I can have decent hardware support, and it *would* be a good idea to keep a House Chromebook for emergencies.

If I want to screw with an ARM Chromebook, I might look into messing with my Chromebook Flip, which I'm pretty sure I've already put into developer mode, and would have more interesting hardware to mess with (not to mention at least *some* kind of video support).

I've got a different scrap Chromebook I can experiment with as a Kubernetes node - one with 4 gigs of RAM and an x64 processor, which would dodge a lot of the issues that'd come up trying to make
