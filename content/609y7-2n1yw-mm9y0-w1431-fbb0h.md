## to try

- cinnamon. what's the perf like? better/same as budgie?
- gnome and/or kde/plasma - it looks like I've got the space so I might as well risk it

## todo

- remove password protection circa gnome keyring
- keep plugging away at that upstream kernel stuff
- rewrite the mess that is the current documentation for doing this, link to Google upstream docs
- try non-verified firmware bootstrap chaining
- crack open and remove read-only ring
- flash nv-uboot if it's safe
- maybe also try that second one, with the framebuffer etc?
- add emulators and other computer game crap like that I go for every time I set up a Linux system even though this one is supposed to be a dedicated machine for hacking

## quest status

### Bettering Petlogs

- codify what a petlog is and write an explainer of why you should do it every time you install linux (tldr, you're going to be writing a pleading forum post at some point, and having what you did to "cause" your problem is going to go a long way toward making every Linux forum's assholes slightly more shut the hell up)
  - ooh! even better, I should just collect all my petlogs into one repo with a README that has that thing, since I'm not REALLY getting all that much out of Gist for this

is there a way I could use vim or whatever to spawn an editor for this file where, every time I save it, it does a git commit and git push (and optionally prompts me for a commit message and otherwise just pushes it with something like whatever default commit message Gist uses)?

maybe even just a bash script with nano and inotify or something

### Making the Touchpad Work Normally

- fix touchpad having a "right button" region (setting)
  - cinnamon's settings panel is no good for this, looks like it's gonna have to be a conf file
  - that'll work for now (done), but the other options via these GUIs don't make a conf file. how do they do their thing? is there a way I can hack `"ClickMethod" "fingers"` (https://wiki.archlinux.org/index.php/Libinput#Common_options) into whatever it is that they rather use?
  - see above notes about how this is apparently some kind of DE-specific thing, and if I want something that'll carry over to other ones, I'll need to pop it in Xorg, so whatever (though also it seems like I'd have to learn that approach ANYWAY since Budgie didn't take the changes in the xorg conf). Though it'd still be cool to have this somewhere in .config instead of /etc maybe
- make touchpad scrolling smooth like cros instead of a janky wheel-analogue like it is right now?
  - Actually I think the jankiness is just an artifact of lag from the non-compositing draw stuff
- do the touch sensitivity thing from the alarm wiki page
  - pretty sure that's actually a legacy thing from the synaptics input driver that's no longer relevant today

### Managing Wifi

- either enable netmanager or get a tray icon for netctl

I have network-manager-applet installed, as it's a prereq for Cinnamon (and I installed it for Budgie), but I'd rather have systemd take care of bringing up wifi automatically in cooperation with netctl &co, so I haven't activated networkmanager.service.

Right now, I'm in LXDE, and it has a really nice panel widget for network management, and the NetworkManager one just sits there dead next to it, noting that the service isn't running when clicked.

What I want is a way to make it so every DE can have a single applet for networking, and each one using the lightest-weight solution: so LXDE just uses what I've got here, others maybe use that netctl applet, and Cinnamon maybe gets over NetworkManager somehow (like we disable the applet in favor of that other one I described).

### The Power of Power

- **screw with some kind of systemd rule or whatever so that what just happened never happens again** - disable the power button altogether if that's what it takes, but ideally I'd have CrOS's behavior back: tapping the button starts a fade-and-zoom, holding it to completion logs me out (I think they technically ripped this off from OSX but I don't care, it's good)
- lid suspend? (don't think I actually want this generally speaking but it'd be nice to be ready for it)

see https://wiki.archlinux.org/index.php/Chrome_OS_devices#Ignore_using_logind for changing this stuff

I'm doing this now. Just ran a `sudo pacman -Syu` (with the appropriate workaround for that pain-in-the-ass certificates bug thing), then I tried installing `gnome-tweak-tool` and running that, but it ran into this error, probably due to some kind of kernel mismatch or something:

```
Traceback (most recent call last):
  File "/usr/bin/gnome-tweak-tool", line 79, in <module>
    from gtweak.app import GnomeTweakTool
  File "/usr/lib/python2.7/site-packages/gtweak/app.py", line 25, in <module>
    from gtweak.tweakmodel import TweakModel
  File "/usr/lib/python2.7/site-packages/gtweak/tweakmodel.py", line 23, in <module>
    from gtweak.utils import SchemaList, LogoutNotification, Notification
  File "/usr/lib/python2.7/site-packages/gtweak/utils.py", line 20, in <module>
    import tempfile
  File "/usr/lib/python2.7/tempfile.py", line 35, in <module>
    from random import Random as _Random
  File "/usr/lib/python2.7/random.py", line 885, in <module>
    _inst = Random()
  File "/usr/lib/python2.7/random.py", line 97, in __init__
    self.seed(x)
  File "/usr/lib/python2.7/random.py", line 113, in seed
    a = long(_hexlify(_urandom(2500)), 16)
OSError: [Errno 38] Function not implemented
```

so I'm just going to follow the "Ignore using logind" changes

Hmm, trying to restart it, it looks like there's no unit file? WTF?

## asked questions

### why is my video performance so bad?

- should I install xf86-video-armsoc-chromium? is there more graphics driver coverage I'm missing here?
  - i appear to already have this package, so that's not the problem
- should I maybe replace it with xf86-video-armsoc-git?
- what's up with mesa-vdpau being AUR only here?

Just noticed Guake was translucent over windows in Budgie, only translucent over desktop in LXDE. Score another point for the "Budgie was probably compositing in software" hypothesis.

### what's the deal with this audio situation?

- continue fixing audio for headphones maybe
  - write console-command-based instructions for fixing audio?
  - also maybe this should be fixed upstream like hey just maybe?

just like Managing Wifi, LXDE has a panel widget for volume, but it has a REALLY ugly icon, and right-clicking it and picking '"Volume Control" Settings' brings up alsamixer in LXTerminal, which is REALLY weird. Aren't there better solutions? At least an actual graphical mixer I could use instead of alsamixer? Maybe a dedicated tray icon app (ugh)?

### why is packer prompting me for a password to sudo something when `sudo -l` says I have NOPASSWD permissions?

this should get posted on stackoverflow, but essentially: it's probably because sudo is being evaluated in the context of `root`, and not the original user, and `root` isn't in `wheel`, and as such matches the `root ALL=(ALL) ALL` rule, which doesn't have nopasswd. not sure if this is worth fixing, I mean, probably? prompting root for their own password when they *already have root permissions* seems a little silly (is there a way to tell sudo "any user is allowed to sudo themselves without a password"?)

no, wait, that is, in fact, supposed to be the default behavior (see `man sudoers` section on User Authentication). so now, uh, I don't know? this feels like a bug: it reads SUDO_USER to determine that the original invoker is not root, but then it compares based on the rules that would apply for root (not the invoking user).

### what's the deal with this "aur" repository?

apparently this? https://github.com/archlinuxarm/PKGBUILDs/tree/master/aur

### why do Chromium xtension &c windows have Chromium icons instead of the extension etc's icon?

ie hangouts windows not having the hangouts icon in panel

also: what's it going to take to fix this?

also whenever hangouts notifies, the thing keeps flashing on my main chromium window until I reload whatever tab I had open, ugh this is just as bad as it is on Windows

### why does the budgie panel keep disappearing when I (accidentally) hit alt+F2?

most likely answer based on having used it for three days: because budgie is bad

see also:

- fix the dang gnome footprint icon not being the nine-squares icon in budgie
  - see https://github.com/budgie-desktop/budgie-desktop/issues/250
  - oughta post that in https://bbs.archlinux.org/viewtopic.php?id=209293
  - where's the panel/applets/budgie-menu/com.solus-project.budgie-menu.gschema.xml he mentioned patching installed to, is it world-writable / not package managed
  - also if this was fixed upstream why is it like this here
