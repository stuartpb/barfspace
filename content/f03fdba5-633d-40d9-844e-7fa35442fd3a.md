# bootstrapping PrusaPrint from stushiba

Before I wipe and reflash this system, I'm saving the content I have (using sudo for the tar because I had issues reading priviliged files otherwise):

```
[stuart@stushiba ~]$ sudo tar cf /run/media/stuart/ateworld/archive/2019/octopi-old.tar /run/media/stuart/rootfs/
tar: Removing leading `/' from member names
tar: Removing leading `/' from hard link targets
tar: /run/media/stuart/rootfs/var/lib/haproxy/dev/log: socket ignored
```

I'm downloading the latest AppImage for Etcher because, you know, fuck it

downloaded Prusa's image from https://www.prusa3d.com/download-prusaprint

## okay, it's flashed

(putting 2 and 2 together with Etcher was so quick, the only comment I have is that it's weird that it didn't say "hey maybe we should only show SD cards here", I believe I remember it doing so in the past)

Continuing per https://manual.prusa3d.com/Guide/0.+Preparing+necessary+components/585?lang=en#s9670 to edit octopi-wpa-supplicant.txt

THOUGHT: they could say "unless you're on Windows 10 and Notepad knows how to handle LF line endings, so this doesn't appear to be one long line" in the line about using Notepad++

Filled out specs for my (2.4GHz) network as appropriate

Uncommented `country=US # United States` even though the Pi Zero W probably doesn't care, just because, you never know

Okay, this all looks good, ejecting the card, putting it in the Pi, and powering on

Didn't bother changing the user password with an octopi-password.txt: I'm just going to reconfigure sudo to "if you're connecting it's safe to say we can assume you're authenticated" passwordless mode, then make this account ssh-in-only.

or maybe I just make it some local password thing... dang, did I have a note for this in my Accounts? I need to make NilPass have a notes store.

Anyway, SSH works (I had to `ssh-keygen -R 192.168.0.83` to deal with the SSSH key regenerating), and I'm not planning on exposing to the internet, so I'll just go ahead and continue on in describing my operations with this device in
