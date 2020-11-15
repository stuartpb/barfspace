# 2018-09-03: and we're back

I was able to reboot back into stushiba with no issues (though I did press the Boot Menu button when the system powered on to select rEFInd instead of seeing if it would work by default). After trying to clone this repository into my projects, I realized that I hadn't actually added my stushiba key to my GitHub account, so I went ahead and did that.

Once I had this repo cloned, the next thing I wanted was Atom (having become enamored with it on stuzzy), so I went ahead and installed that (plus ctags after seeing it as an optdepend, though I installed it explicitly and not `--asdeps`, considering how much orphan cleanup I ought to be looking into).

The thing I want to do now is update my AUR packages (particularly Google Chrome), and for that, I want to update my AUR helper (since `packer` is so long in the tooth that it now conflicts with an upstream package name, as noted above).

I've been using `yay` on stuzzy, but I'm going to mix things up and try `pakku` on stushiba. First (because I do want to experiment with it as an explicit dependency), I install `nim` via `sudo pacman -S nim`, then, once that's installed, I run `packer -S pakku`, then, in true Oedipal form, `pakku -R packer`. (The patricide part of Oedipus, not the other one.)

I run `pakku -Syu`, but it still comes back with a few packages I don't remember installing (like `webkitgtk2`) - and mentions a lot of non-AUR packages that are *definitely* orphaned dependencies - so instead I just do `pakku -S google-chrome` for now.

## thoughts on pakku

Definitely prompts more by default than I remember `yay` doing - I guess pakku is probably more in the tradition of AUR helpers like `packer`, while `yay` is probably more in the vein of `yaourt`. (I don't actually know how `yaourt` ever was, I never bothered with it)

## one of those problems that solve themselves

Okay, so, I opened up Google Chrome, and it said it couldn't sign me in (because I changed my email address a while back and that throws Google's reauth attempts), and prompted me to sign in again, and I tried, and it wouldn't let me change my emaill address (I could highlight it but typing it did nothing), and so I looked up how to pop a DevTools instance on a page that's part of the UI, and so I found [this page](https://www.chromium.org/developers/how-tos/inspecting-ash), but still wasn't able to inspect anything (as the comment on that page suggests), but at that point I'd relaunched the browser, and when I tried to sign-in again it just straight up opened the sign-in page in a new tab, and that worked fine? I'm not sure what that was about, I was pretty sure I was running the same version (68) before and after I relaunched, but I guess it's possible that I didn't? Ugh, anyway, *GRAND PLAN TIME*

## imaging stuzate

To see if I can get the drive cache size, I do `sudo pacman -S hdparm` first, then `sudo hdparm -I /dev/sdb` (having checked that the drive is sdb via `lsblk`). This tells me the model number, which I'm able to Google has a 32MB cache, so that'll be the block size I use.

Running `sudo dd if=/dev/sdb of=/run/media/stuart/ateworld/images/stuzate.img bs=32M conv=sync status=progress` tells me that ateworld is a read-only filesystem, which leads me to realize after Googling that I've [yet to install](https://unix.stackexchange.com/questions/355268/unable-to-mount-drive-as-read-write) the `ntfs-3g` package.

I go and do that, then (after checking that `mount -o remout,rw` is not supported here) go into Files and hit the Unmount button for the drive, then click the drive again to remount, then rerun the `dd` command above.

It's going at about 50 megs a second, so if this performance holds out, the image should be done in about three hours - in any case, it's late, so I'm just going to cut a commit here and go to sleep, and hope the image is ready by the time I wake up.

## OH WAIT

Go into GNOME settings and turn off Automatic Suspend, after the system briefly powered down right around the 200 GiB mark into the `dd` (causing me to freak out a little at the prospect that the `dd` might encounter errors and die, though it kept on chugging, to my relief)

It says it's set to blank the screen after 5 minutes, but I haven't seen anything like that.

### Atom

Going into Scope Blacklist in Autocomplete Plus settings, just like I did on stuzzy on 2018-08-31, and setting it to `.gfm,.text,.string` so Atom won't suggest words in prose contexts.

Really, `.text,.string` should be enough (plain text files have the scope `text plain null-grammar`), but Atom appears to use `source` for basically everything, even when it shouldn't (the class for Markdown is `source gfm` when it should be `text markdown gfm`).
