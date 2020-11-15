# adding a user account for myself

okay let's do this

opening the terminal

`sudo adduser stuart`

I'm not gonna say what my password is here, but that I'll wait to make sure I can remember it for a few days (and that I have a working password-hint-storage plan in place) before I go changing the chip password (todo: link to "ideas for the chip user")

entering "Stuart P. Bentley" for the name and making all other GECOS fields blank

looks like everythin's been made

let's see what happens if I logout...

hmm, I can't do that from console, and I don't feel like hacking awesome just yet

I can su in as myself... maybe later

## on logging out via console

[even the best stackexchange answers](https://askubuntu.com/q/180628/245043) sound like, ultimately, they'd just reboot LightDM

Hmm... maybe I can make a wrapper script that uses command line switching to autologin as chip based on a fixed config file (which I'd toggle off in "guest mode", so rebooting wouldn't autologin)

ah okay, here's some good stuff: goold old [arch wiki](https://wiki.archlinux.org/index.php/LightDM#Command_line_tool) (and `man lightdm`, to be fair) point me in the direction of `dm-tool`

aaaand `dm-tool switch-to-greeter` has broken the thing. woo, first functional failure

I hardkill by holding the Home button

## pulseaudio sojourn aside

after coming back, I take a moment to `sudo apt-get install pavucontrol`

oof, okay, pavucontrol is too big for this.

anyway, https://www.blog.willandnora.com/2017/09/02/pocketchip-bluez-5-23-a2dp-to-headset-for-audio/ (which I found via a Google for "pocketchip pavucontrol") reiterates a thing from the pocketchip wiki - I'm not sure why I'd need it now when I wouldn't before, but:

doing `pactl load-module module-switch-on-connect` and connecting through `bluetoothctl` made it work (and I imagine this'd probably also work for the headphone jack?)

found via https://wiki.archlinux.org/index.php/Bluetooth_headset#Setting_up_auto_connection

that makes it work. I'll have to add it to the config later.

anyway, doing EDITOR=nano sudo visudo to check if sudo access is group-based, and if it's by chip's groups

tcsh, they have a thing that says chip doesn't need a password to run apt-get. super secure there guyz

also: not putting this under sudoers.d where it'd be better factored? really?

and geez, looks like it doesn't even setgid?

TODO: note this in more detail, then remove it (kill whatever update service or whatever might have necessitated it)

anyway, looks like the group is "sudo" and not "wheel", sigh how pedestrian

`sudo usermod -aG stuart`

## diagnosing the bootloop

I switch over to my user via `su stuart`

then `cd` to go home

now `sudo cat /var/log/lightdm/lightdm.log.old lightdm-loop.log`

okay, now I can diagnose this log while still resetting the device.

it makes a repeated reference to x-1.log, but both that and its .old are empty

I feel like the bug is rooted in `/etc/lightdm/lightdm-gtk-greeter.conf` referencing a nonexisting `/usr/share/images/desktop-base/login-background.svg`

running `update-alternatives --config desktop-background` just says `error: there are no alternatives for desktop-background`, so, screw it, I'm just going to `sudo nano /etc/lightdm/lightdm-gtk-greeter.conf` and set it to `/etc/skel/.local/share/backgrounds/xfce/chip-desktop.png`

that'd be how I'd restructure the home directory to solve the `/home/chip` problem - add a step that just retranslates references to `/etc/skel`, a perfectly sensible symbol, to

you can have a `.deskelignore` (or some config value) to set files (or regexes/globpatterns) not to replace in, if you actuallywant to leave some static /etc/skel references (like a script that copies into `/etc/skel`)

though you could also avoid that with `/etc\/skel`, we don't want to force that

anyway, `/usr/share/images` just straight up doesn't exist, I'm not gonna bother with other stuff for now

done `sudo nano /etc/lightdm/lightdm-gtk-greeter.conf` and saved

doing `sudo mkdir /etc/lightdm/lightdm.conf.d` and `sudo nano /etc/lightdm/lightdm.conf.d/01_unhide-users.conf`

inserting per https://wiki.debian.org/LightDM

```
[Seat:*]
greeter-hide-users=false
```

doing `sync` then `sudo loginctl terminate-seat seat0`

boom shakalaka. looks like changing the BG worked (EDIT: NO IT DIDN'T - see next section)

## moving on

[trying pocketwm](7515x-h3cq6-f6acw-771bk-1g0ap)
