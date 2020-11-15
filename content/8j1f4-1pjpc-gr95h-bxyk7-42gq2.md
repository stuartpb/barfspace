# 2017-11-29

## adventures in kernel fuckery

popped sdcard back in and ran the kernel update stuff

booted and it seems to work but yeah a bunch of stuff is broken

tried to get some desktop environments installed but didn't have much luck

touchpad was broken after doing lightdm -> ldxe, then after rolling back the kernel it seemed fine so it looks like the kernel probably breaks touchpads right now

## uuuuuuuuuuuuuuuugh

got into another bloody mess after booting into the onboard os because of my attempt to fix the touchpad. Stupid https://wiki.archlinux.org/index.php/Libinput#Common_options doesn't explain that you're supposed to precede the "options" it lists with `Option` (oh yeah let's just assume that I love writing xorg conf files and have the syntax memorized instead of actively trying to figure out how to never use them again), and besides that it's wrong because it's `clickfinger` not `fingers` jfc

anyway that stupid typo made it so the ENTIRE LOGIN MANAGER COULD NOT START so that was fun trying to diagnose based on log files I was seeing no indication of opening and forum threads that render like ass in Lynx/w3m

ok so then I edited the file so that it has that now, but now guess what? IT DOES NOTHING AND I STILL HAVE CLICKS TRIGGERING PASTE IF I PUSH THE WRONG PART OF THE PAD FML

fixing the sound per the instructions on https://archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook, switched the selected card from PulseAudio (instructions didn't mention that bit), arrowed right by like fifty screens until I found these items, which I unmuted (and a few I skipped, marked with [Off]):

- Left Speaker Mixer LINEA
- Left Speaker Mixer LINEB
- Left Speaker Mixer Left DAC
- Left Speaker Mixer MIC1 [Off]
- Left Speaker Mixer MIC2 [Off]
- Left Speaker Mixer Right DAC

a whole bunch more skipping:

- Right Speaker Mixer LINEA
- Right Speaker Mixer LINEB
- Right Speaker Mixer Left DAC
- Right Speaker Mixer MIC1 [Off]
- Right Speaker Mixer MIC2 [Off]
- Right Speaker Mixer Right DAC

AFAICT from testing only one of these (any of them) per speaker needs to be enabled for sound to come out? not sure how it all adds up but whatever

this will probably have to be repeated for headphones

didn't have to do the part where I change the master volume, I think desktop environments take care of that

logged out of budgie because it was driving me nuts and I wanted to try a compositing wm. tried to boot sway and it wouldn't go (kicked back to lightdm). booted to LXDE, and, well, this is interesting:

lxde is way faster - none of the lag I was seeing with Budgie. However, none of the input stuff I set - tap-to-click, natural scrolling - is active, *except* the one I set via Xorg conf (multitouch-only buttons). It's almost as if Budgie wasn't using Xorg at all, but some kind of slower software compositor. Like, this is what I'd expect in some kind of scenario where it's running Weston and Wayland doesn't have a hardware GL implementation. But Budgie apparently has no Wayland support, so that couldn't be it. But I feel like it's probably something like that.

youtube isn't buttery smooth - a little stuttering, tearing - but it's not unwatchable, unlike budgie.

oh yeah, also, this is weird: had to log into github again, and other stuff that suggests cookies in LXDE are handled in a separate sandbox from Budgie (probably GNOME keyring related).

also, Budgie didn't pester me about the keyring at all, not sure if that's just because I didn't do anything that would have triggered it or if it's because the problem magically fixed itself

D'OH, I hit the power button trying to restert the X server with ctrl+alt+backspace. well, upshot is that now I have the fully-reloaded version of my touchpad configuration loaded up. for posterity, `cat /etc/X11/xorg.conf.d/30-touchpad.conf`:

```
Section "InputClass"
  Identifier "libinput touchpad catchall"
  MatchIsTouchpad "on"
  MatchDevicePath "/dev/input/event*"
  Option "Tapping"
  Option "NaturalScrolling"
  Option "ClickMethod" "clickfinger"
  Driver "libinput"
EndSection
```

note the bool options being set to `true` by not specifying a parameter because otherwise I'd have to pick which one word from out of the twelve ways that xorg.conf supports spelling boolean values I want to screw with

`ssh-keygen -t rsa -b 4096` so this machine has its own GH credentials

`passwd -l root`, I feel like I've got things under control enough that I can do all my work from my own account

installed wireshark a while ago, added stuart to wireshark group (per https://wiki.archlinux.org/index.php/Wireshark) via `gpasswd -a stuart wireshark` (I remember having trouble when I tried to do this originally, maybe needed to reboot to reload group info or something)

`sudo chfn -f "Stuart P. Bentley" stuart` because full name data is apparently restricted for some dumb reason

downloaded my github profile image as ~/.face

changed LXDE clock to use `%-I:%M %p` as time format
