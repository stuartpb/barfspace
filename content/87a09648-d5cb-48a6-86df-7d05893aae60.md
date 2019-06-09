# 2018-02-15: Windows 10 Desktop

I hadn't been keeping a petlog for my Wintendo box, but it looks like that was a mistake - I'm making one now, just so I can document the weird situation I'm currently in.

I had updated MSYS2 in the past, and back in July, I went through a weird "huh, apparently I never made an SSH key" phase and ended up generating a new key. (This probably had something to do with accessing the installation on my Raspberry Pi.)

Well, right now, I'm realizing why that happened: apparently, at some point, my home directory in MSYS2 moved from `C:\MinGW\msys\1.0\home\Stuart` to `C:\msys64\home\Stuart` (maybe if/when I switched from MSYS1 to MSYS2? the files in the former diretory have a modification date of 2014-08-06), and when *that* happened, the old home diretory's content (including the key) didn't carry over.

I'm taking the more recent keys and renaming them to `july2017_legacy`, and doing whatever I can to eradicate all traces of that brief key having ever existed, in favor of the longer-standing key (which is already up for my DigitalOcean credentials, for one). Once I'm confident I'm not locking myself out of anything (basically retracing my steps for the last half-year), I'll delete the keypair altogether.

I'm also copying the older key into the newer home directory location, as well as `C:\Users\Stuart\.ssh` (the location used by WSL Bash, Git Bash, and old GitHub Desktop, even though the `github_rsa` key is already in there - I'm thinking of deleting it).

Since I appear to have added the *newer* key to my GitHub credentials (and I think not seeing the older key made me think I'd never generated it), I'll go ahead and remove it, using the older key as a replacement.

Credit to this one-liner, which I used to figure out which key I had loaded into the Chrome Secure Shell app, which put me on track to realizing what had happened here (I'd generated that private key, been using it via Chrome SSH, and forgotten its location):

```js
nassh.getFileSystem(fs=>fs.root.getFile('/.ssh/id_rsa',{},fe=>fe.file(file=>{let fr = new FileReader(); fr.onloadend = e=>console.log(e.target.result); fr.readAsText(file)}),console.error))
```

(I am constantly thankful that this abysmally clunky Filesystem API never caught on outside of Chrome.)

From there, I copy-pasted the private key as a file called `key` in my MSYS2 home directory, then ran `ssh-keygen -yf key | ssh-keygen -E md5 -lf -` to get the key's fingerprint to compare it with the fingerprints of my other keys on GitHub (to ascertain that I hadn't, in fact, uploaded the old key).

Whew: this answers one of my long-standing confused questions, and has me more gung-ho to start populating https://github.com/stuartpb/pubkeys.
