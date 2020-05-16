# trying out pocket-wm

logging in as `chip` via the login screen from the first time ever, choosing "Pocket WM" instead of the default (awesome)

oof. okay, so alt-tab is actually alt-tab, no ctrl+tab remap like the awesome version

pocket-home doesn't refocus open apps

## TODO bluetooth recap

bluetooth headphones turned off because I still haven't put the thing that connects and uses them.

or maybe I need to add the bluez thing to enable bluetooth and Sinks and Media and things, which I meant to but haven't yet

## going back

hmm... if I'm using loginctl again (lightdm now shows up as having a session? hmm), I'd have to keep sudo.

let me see if `dm-tool switch-to-greeter` at least works

oh crap, no, the same thing happened. so that's the root of that issue, and it's not solved yet

## hard reset again

this time I'm going into terminal and doing `sudo pkill -u chip`

works again, and this time it's not hiding my user on the first screen.

I log in as myself and decide to check out XFCE

XFCE mounts the USB drive, or at least presents it on the desktop.

I double-tap it, then select PCMan File Manager when prompted to choose my preferred File Manager

oh fuck, how do I get out of this

## gahh, xfce is no go

there's no menu button. I can't right-click the desktop.

okay, if I hit "Open folder in terminal" in PCManFM from double-clicking the USB drive, then alt+tab to actually shift the text input focus (or did I alt+f4 pcmanfm or something)...

okay, `sudo pkill -u stuart`, and we're back to login, hooray

now this time I'm gonna just go into awesome, which is honestly mostly fine

heck, in pcmanfm, if you open /usr/share/applications you've basically opened the Launcher menu

TODO: Edit the desktop resolution of xfce?

## brief sojourn into firefox

it's too small to see the config UI to make the UI smaller to compensate...

## anyway

Hmm, there's a "Log Out" entry...

That had an error popunder that says "Could not get owner of name 'org.xfce.SessionManager': no such name"

Got to the popunder by hitting Home to bring up pocket-home, then terminal, then xkill

browsing /usr/share/applications/ in Leafpad shows there's `xfce-session-settings` and `xfce4-session-logout` - that's probably what it was

Opening it: ahh, it has "OnlyShowIn=XFCE", but of course reading /usr/share/applications ignores that

oh, okay, apparently the duplicate entry... there's also a `chip-session-logout` that calls `chip-exit`

it *also* has OnlyShowIn=XFCE, and the chip-exit binary has the same bare behavior as `chip-exit --help`

oh, okay, by `leafpad /usr/bin/chip-exit` we see that it's a PyGTK script that attempts to recreate xfce4's bare `xfce4-session-logout`, but the "logout" button just does `xfce4-session-logout -l`

you know, there's a much simpler way to log out I'm just realizing here: `pkill awesome`

it's still no session switch, though, and that's something I kind of want

## anyway: SSH setup

after `pkill awesome` just confused the system and I had to restart and try it as `pkill -TERM -u chip`, I'm back into awesome at stuart

doing `sudo apt-get install ssh` because apparently it's not installed by default?

ran `ssh-keygen`, no passphrase, and uploaded it via `curl -F 'f:1=@.ssh/id_rsa.pub' ix.io` (approximately: I technically used `f:1=<-` with `< ~/.ssh/id_rsa.pub` but same deal)

bringing it to my desktop with `curl ix.io/2maW >>~/.ssh/authorized_keys`

added it to GitHub


