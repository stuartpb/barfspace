# Getting Going with Raspberry Pi OS

Okay, so, I was going to get going with Arch Linux ARM first, but after getting the Hybrid MBR working (had to use a `0c` partition type for the "ESP", which I now realize wasn't an ESP at all), the LED started flashing 7 times, which [the diagnostic page](https://www.raspberrypi.org/documentation/configuration/led_blink_warnings.md) tells me means "Kernel image not found".

I didn't realize going into this that the 8GB Pi4 was only released in May, with the 64-bit version of the OS launching in a beta that was not linked in [the announcement post](https://www.raspberrypi.org/blog/latest-raspberry-pi-os-update-may-2020/), and only posted [in a forum announcement](https://www.raspberrypi.org/forums/viewtopic.php?t=275370) (the next search result on Google).

I don't see any announcements about newer builds, but going one level up to [the index page for release images](https://downloads.raspberrypi.org/raspios_arm64/images/) shows the initial anouncement build and a more recent build, from just about a week ago on August 20.

Anyway, I should probably get to know Raspios (the new short name for the OS if they're going to phase out "Raspbian") - I can probably set up some kind of chainloading mechanism to run Arch off of one of the rings, as I described earlier.

## flash, first boot

I flash https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2020-08-24/2020-08-20-raspios-buster-arm64.zip via Etcher

I pretty much just go through the first boot wizard as you'd expect

I set the hostname to "stuberry" in the Pi Configuration thing and reboot

## first good boot

I open up Chromium and search for "elecrow screen driver" to see what it's gonna take to get the touch screen working.

Before I get going with any of this, though, I try to usermod the pi user - only to realize, yeah, I can't usermod a user I'm logged in as. I disable the autologin in preferences, and I also remove the asterisk from `root`'s line in `/etc/shadow` for a minute.

I switch to tty1 with ctrl+alt+f1 and reboot (since it still wants to auto-login). On rebooting, I go back to tty1 and log in as root, then:

```
usermod -l stuart -m -d /home/stuart pi`
groupmod -n stuart pi
```

I go back and put the asterisk back on root's line in /etc/shadow, then exit and log in as stuart: everything's good. awesome.

I install xinput-calibrator, and it thinks it has no screens to calibrate, so I look at the script the wiki tells me to run and:

```
sudo mkdir -p /etc/X11/xorg.conf.d
sudo nano /etc/X11/xorg.conf.d/99-calibration.conf
```

actually, scrub that, I have a better idea?

but first, I `sudo nano /etc/sudoers.d/010_pi-nopasswd` to change the username to mine

now, `sudo apt-get install xserver-xorg-input-evdev` and reboot...

still not working, still no calibratable devices found

okay, I think I see it: appending this to /boot/config.txt

```
# Enable touchscreen
dtoverlay=ads7846,cs=1,penirq=25,penirq_pull=2,speed=50000,keep_vref_on=0,swapxy=0,pmax=255,xohms=150,xmin=200,xmax=3900,ymin=200,ymax=3900
```

rebooting: yes, this works! needs to be calibrated, though, so I go through that whole process...

and nothing. searching for "xorg touchscreen not calibrating" turns up [this](https://www.reddit.com/r/debian/comments/8dhywg/xorg_ignores_touchscreen_calibration/dxncfyl/?utm_source=reddit&utm_medium=web2x&context=3) Reddit comment, which notes that touchscreens are handled in modern Debian by libinput instead of evdev (I go ahead and uninstall the driver I installed earlier). searching "libinput calibration" points me to [this ArchWiki talk page comment](https://wiki.archlinux.org/index.php/Talk:Calibrating_Touchscreen#Wrapper_around_xinput_calibrator), which wraps

Fails due to bc not being installed. `sudo apt-get install bc` and *now* it works. I save its output to /etc/X11/xorg.conf.d/99-calibration.conf
