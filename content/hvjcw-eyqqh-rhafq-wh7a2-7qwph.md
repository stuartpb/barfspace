# GitStick / Pocket-Syncing Remote Own-Cloud Cache

Wild idea: could an ESP8266 run a CouchDB server, or something else that could sync static built files by hash (or, like, even maybe a Git content tree) to SD card (and maybe even do Markdown rendering out to files live-on-chip too, as insane as that would be)

Oh man, the idea of a "one-dollar pocket Git server" or otherwise mesh storage auto-syncing device (ie. it would automatically pull from local servers once plugged in at home, as long as it's plugged in, and then hosts them and ) is so enticing

You could call it the GitStick! And it could have a "sticky" foldout, covering up a Micro-USB/USB/C port, so you could stick it to your laptop lid and keep a low-profile cable connection to the underlying storage / power connection (with maybe a switch to enable/disable the server to convserve power)

as I think about this, I realize you wouldn't even need a battery...

and then it's like "wait, and then it just works when you have it plugged into a computer? so it's basically just a flash drive with a Git server stuck on, and even that's just for syncing"

And now that I think about it, this'd be an AMAZING use for a FlashAir: a storage device that host-independently stays synced to Git remotes (it could also git gc if it's hard-syncing and deleting deleted refs and stuff)

How hard is it to set up a key that can only use the git shell (also maybe only as readonly), and maybe has only access to a subdirectory of the machine? I think that's considered "pretty easy"

but so then you'd generate a new keypair for each machine you'd be running SSH/HTTP/Git protocol for this git server on, where the private key really just lives on the FlashAir

or it connects to an IPFS instance or SSB or CouchDB or Syncthing or whatever - point is, it syncs the content reliably enough that you can be sure you have your data from whenever it was last plugged in to the same network as a running device that had that data (kind of like BitTorrent - I'd be cool if this needed a fixed tracker to arrange the connection between devices, like SRDP or whatever that thing WebRTC uses is - I think I'm thinking of STUN?)

this beats a cronjob because you can set it to just start up whenever you're laptop's plugged in at home and powering it, if your laptop does that while the system sleeps (and I think this is where the "USB power" aspect comes in, though I guess that's solvable with a USB SD card reader)

one of the key points of this is that I want it to primarily focus on tracking *each node's live state* (at whatever level it's tracking, Git, filesystem, documents, whatever), so it's like a caching layer (hence the idea for a rendering pipeline)

Is there no way to strip Linux down enough to get to run on an ESP32? (TODO: branch this to the ESP32 / Espressif pages) I guess it's kind of moot since no way in hell will V8 fit in RAM - I don't know if the tinier implementations can run as ELF files

## anyway

the use case for this is to host the repo beyond [The Shadow Curtain](wm7ba-3ycgc-wn8h2-pjnsv-xny45), and maybe even have it easily browsable from a remote machine

## revisiting this idea

After looking more at [Encryption tools](05rhg-9te1j-f2aah-jk2z5-qk8y6), I think a CryFS repo + Syncthing makes a lot of sense

also: [Gitolite](cw5f4-gxafp-e0ayc-70sgf-8yj8x)?
