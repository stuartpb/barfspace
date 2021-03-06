# Expanding the PocketCHIP Login Horizons

Continuing from [devising the user outlay](kwy8k-vpnsm-c8a8y-550mm-htkwy)

Poking around configs to understand how this is designed to work...

`/usr/share/lightdm/lightdm.conf.d/01_debian.conf` notes that the greeter is managed by /etc/alternatives, a fun little Debian system, and that it has `greeter-hide-users` by default, which is actually not how I'd like to set my CHIP up? so I'll override that in the /etc config later

## aside thought about debian's alternatives

man, I actually like Arch's package-incompatibility model, the more I think about it. This "alternatives" hooey, in practice, just adds another layer of confusion. If your package is dependent on an ambiguous name, it's going to have to live in an incompatible package world, like packages that rely on `python` pointing to `python2` - because otherwise the most common alternative just always ossifies into a thing that's dangerous to change.

and, like, yeah, you can have two different images with different configurations - but you might be incorporating two different tools *into one image*. It'd be stupid to have to double-up containers in a pod just for this.

though of course Nix gets it right most here - but, like, it's kind of like... a distro is a framework for an image. We learned a while ago that frameworks that let components modify global behavior take their apps to hell a while ago

## anyway

the greeter in use is the GTK greeter. (How does Arch handle this again? I geel like I remember it supporting more than one installed simultaneously)

## another side discovery

`~/.pdsettings` (in `/etc/skel` as well) appears to be a PureData thing - is this for SunVox? What's this PureData thing anyway, it looks neat

## changes I'll want to make

I think I'd want to swap out "Write" for...

A "Log Out" (to log into my personal account) button would be useful, but more like I want...

Could it be just "Window list"? Honestly, that would rock for me: just a thing with a window list and a "type here to run a non-listed application"

I mean, I'd always want to start new text files by spawning them from pcmanfm anyway

## where the hell is pocket-wm even coming from?

`grep -r pocket-wm .` (from home) turns up nothing. not even `.*` (trying `.*/.*` recurses into .. with the expected hilarious results)

grepping `etc` only turns up the service unit for battery polling for pocket-wm

`usr`: the start script that's just `exec pocket-wm`, the `/usr/share/xsessions/pocket-wm.desktop` that calls it, `usr/share/doc/pocket-wm` metadata, and that's it

## another neat little side find

`/etc/plymouth/plymouthd.conf` lists `Theme=pkc-theme`

## another weird Debianism

`etc/lightdm/users.conf` lists `nobody`, `nobody4` and `noaccess` as hidden users. wtf is `nobody4`

the "shells that indicate a user can't login" you'd think would seal that. also, why doesn't it have something like "don't include users with null passwords that disable login"? does it do that automatically? if so, why the redundancy

looking back at that `01_debian.conf`, I notice that it has a thing to extend support into `/etc/X11/Xsession.d`

at this point I realize how much simpler this can be if I just browse the tree in pcmanfm instead of ls and less

anyway, browsing that turns up `50x11-common-determine-startup`, and I think we may have our answer in `/etc/alternatives`

(also, aside: debian has no separator between its number prefix and the script name, and the name is prefixed with the package responsible like `x11` here? it's weird and ugly and Module Tree's style is better)

uh, the `x-window-manager` here is... `/usr/bin/awesome`

## more grasping at straps

well, fuck it, it's a mystery. I'm gonna try turning off autologin and see if that does anything...

wait, there has to be a "lightdm last session" question somewhere or something like that

`/var/log/lightdm/lightdm.log` sent me down a dead end with `/var/lib/lightdm/data/chip` which was empty

it does indicate I should check `.xsession-errors`, which I'd been ignoring

hmm, that seems to be kicking off `/usr/share/pocketchip-onboard` for some reason...

grepping for `onboard` turns up a lot of stuff in `~/.config/awesome/rc.lua`...

oh fuck me, is it starting awesome to start the onboarder which hands off to `pocket-wm`? WHY EVEN BOTHER MAKING A NEW WM AT THAT POINT

okay, so it looks like the awesome onboarder hands off to `pocket-home`

oh, so yeah, it never even uses `pocket-wm`, it's just using this `pocket-home` app, and using awesome to implement the stuff like ctrl+tab for switching.

see, all this should be what's under `pocket-wm`, and then you'd just `require` it in

anyway, I'll probably make my own "wocket-home" at some point

until then... hmm
