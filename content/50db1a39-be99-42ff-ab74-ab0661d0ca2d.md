# Bulk Storage for Studtop

had some weirdness on first connection (ie. programs saying no device when though it appeared in lsblk), probably a USB 3 thing: unplugging and reinserting fixed it

## migrating my old hard drive

after triple-dipple checking `lsblk` and `blkid`:

`sudo dd if=/dev/sde of=/dev/sdf bs=100M status=progress` gets me about 50MB/s, which isn't great but seems like it's kind of the most I can hope for?

reducing memory pressure (closing some Firefox tabs) seems to help, by extending space for the buffer...

looking at calculations, this will still take ten hours, what the fuck

after doing a `lsusb` and checking `lsusb -D /dev/bus/usb/004/00(4,8)` (the bus entries for my two front ports), both devices are showing up as `bcdUSB: 3.00`. what the fuck

see, I tried a larger block size, and it just made the thing slower?

I'm gonna try hitting ctrl+c and trying another block size now that I've got better memory pressure...

or... eh, fuck it, nah. knowing this PC, it's probably because the motherboard's USB 3.0 controller is garbage, and while I *could* fix this by plugging the disks into my dedicated USB 3.0 card in the back which I have for this explicit purpose...

... hmm ... okay, I guess, considering that this would take ten hours otherwise, this is worth trying

## trying the back ports

had the same kind of freaking problem with the new disk reading weird initially! worked after plugging it back in. ugh wtf

oh my god this only does 40MB/s, even with the 100MB/s block size, what the fuckkk

## plugging these back into the front

now that the disks have the same label/UUID I can check to ensure they're still which-is-which with `hwinfo --disk`

since I did a little over 1200 records at the 100M block size, I resume with `sudo dd if=/dev/sde of=/dev/sdf bs=50M status=progress seek=2400 skip=2400`

this is going slightly faster than the previous copy op? still pretty much topping out at 60 MBps tho

looking at some stack exchange comments it sounds like this is probably the speed to expect on (relatively) cheap drives like this:

- https://unix.stackexchange.com/questions/284797/slow-usb-3-write-speed
- https://superuser.com/questions/1053091/5400rpm-hdd-speeds-in-a-usb-3-0-connectivity-enclosure

## freeze

Progress got stuck at `264765440000 bytes (265 GB, 247 GiB) copied, 4594 s, 57.6 MB/s` - I think the bug (which might actually stem from the cable being wiggly and wonky) reemerged with the new drive

did a `sudo kill -9 <PID of dd>` to kill it, now I'm trying to figure out what skipahead to use (because I don't trust the late-stage reads and I don't feel like doing too much arithmetic / figuring out which figures are in which base). I'm gonna go with `6600`

`sudo dd if=/dev/sde of=/dev/sdf bs=50M status=progress seek=6600 skip=6600`

I realized, after double-checking the drive devices before running the new command, that the hard drive behind my computer had gotten unplugged (possibly around the time that the copy froze?), so I unplugged the drives, went back and fixed that, and then plugged these drives back in

Interestingly, all this device shuffling has changed their IDs significantly (though putting them back in the right order put their )

## aside about non-/dev/sdX paths

By-path is probably the most consistent way to do this, like if you just labeled? but it's weird to me that there isn't a logical-path-by-hardware-serial-number component, you know? I kind of want to be able to say "for this, use whatever device is plugged in to the third port of this specific USB hub I painted yellow with some nail polish", or "this specific disk with this specific hardware" (which is, like, maybe good if you're operating a system where one disk is always classified as Source, and the other is always Destination?)

Wouldn't that be outrageous, if an object's ID being even slightly higher, due to a buggy-ass driver, ended up having a noticable performance impact? that would suck

anyway

## waiting: thoughts for when this is done

I'm not sure there's an easy way to compare the two drives? maybe I could do an fsck? I just realized that this disk is NTFS, so it's not as straightforward as ext4

## interrupting the copy again

I feel like dialing this back to a lower block size.

```
1348+0 records in
1347+0 records out
70621593600 bytes (71 GB, 66 GiB) copied, 1302.65 s, 54.2 MB/s
```

so I'll take 1340 and add it to 6600 (7940), then multiply that by 5 (39700)

`sudo dd if=/dev/sde of=/dev/sdf bs=10M status=progress seek=39700 skip=39700`

I'm not seeing significantly better, but also I'm putting the system under a lot more memory pressure by running Steam

## stopping again

I'm hearing some clicking from my WD My Passport, so I"m gonna give the disk a break for a bit.

Hitting ctrl+c...

hmm, it's still stuck at `552473722880 bytes (552 GB, 515 GiB) copied, 16108 s, 34.3 MB/s`

Okay, it did eventually stop, but no final block size output. Well, let's see, we got at least 500 GB, and the starting point was just short of 400...

`sudo dd if=/dev/sde of=/dev/sdf bs=100M status=progress seek=9001 skip=9001`

Well, it's a little better. Closer to 50 MB/S than 60

## the next morning

Copy finished. Didn't grab a copy of the final stats, because I was too eager to see the output of `sudo pv /dev/sde | sudo cmp /dev/sdf`

but I foolishly ran `cmp -l` instead so it ate up the whole backbuffer after finding that there was, in fact, a zero region a few gigabytes in (though the zeroes were all in the second column, not the third?)

whenever I run into trouble, I take the figure given by cmp, re-run dd on some number that's close to but less than that, ctrl+c after a bit, and rerun `sudo pv /dev/sde | sudo cmp /dev/sdf -i` with the last 5 digits of the number it failed at replaced with 0 (should probably make that 8 or more but whatever, we already know the before-region)

## latest snag

making the `dd` number: chop off 8 digits and make the next one a zero, then add...

in `-i 96870300000` a failure at `148968973985` having read 228GiB...

wait a second, I haven't been changing the pipe in... does it seek the pipe? it must

okay but restarting the cmp at `148900000000` does nothing? you'd expect it to fail out within a few gb, right? because that's so close to the failure point? so I really d k

I'm honestly starting to wonder if the old drive isn't just occasionally spitting out zeroes in readback

anyway my new cmp strategy is, when the cmp fails, to re-run the cmp with the byte position a few GB ahead of where it said the failure was, then run it again. it seems like that's probably going to give me the more accurate results

okay the one started at 148900000000 just failed at "byte 96939273985" so we can confirm that you definitely need to add the original offset

gonna restart at 245000000000, expecting it to complain at `byte 839273985` which should be less than a gigabyte? but it doesn't

unless, oh wait, fuck me is it not seeking the pv? like it's just reading in and discarding bytes until it gets to the skip point? and that's why it's taking so long to fail? fuck fuck fuck

right okay `sudo tail -c +245000000000 /dev/sde | pv | sudo cmp /dev/sdf -i 245000000000:1` fails right around where you'd expect

okay, I've built this monstrosity:

```bash
(start=245000000000; sudo tail -c +$start /dev/sde | pv -s $(( $(lsblk -brdno SIZE /dev/sde) - start )) | sudo cmp /dev/sdf -i $start:1)
```

(note the use of a subshell so the start assignment doesn't potentially leak to subequent invocations)

now that that fails quick I'm gonna `sudo dd if=/dev/sde of=/dev/sdf bs=100M status=progress seek=2400 skip=2400` for a while and try again

also I think I get why the zeroes were in column three now: stdin is being treated as the *second* argument to cmp. okay

this new `dd` is running consistently at near 100 mbps (like 98)?? no idea why it's so much faster now lol. faster read speeds closer to the center of the disk due to the seekahead?

okay I let it copy 100 GB (955 records in + out), let's try checking again. (almost considered just redoing the dd, since it's copying as fast as it read, but nah)

rerunning the check command, uh, it still fails just as quick? W.T.F

rerunning `sudo dd if=/dev/sde of=/dev/sdf bs=100M status=progress seek=2000 skip=2000` - gonna wait til it's done at least 50 GiB because that should be at least 400 records (ie. covering the space before the last `dd`)

okay, 512 (or 511) records processed, let's try the cmp again

okay, looks like that fixed it. honestly if I run into another problem I'm probably going to just move the `dd` to bytes the next time I want to work with this, since that's already where the stats I'm seeing are - I could kind of eyeball it before, but, well, that's how I got these holes

another failure at `150091476481`

adding that to the original offset confirms:

`(start=395000000000; sudo tail -c +$start /dev/sde | pv -s $(( $(lsblk -brdno SIZE /dev/sde) - start )) | sudo cmp /dev/sdf -i $start:1)` fails quickly

running `(start=395000000000; sudo dd if=/dev/sde of=/dev/sdf bs=100M status=progress iflag=skip_bytes oflag=seek_bytes seek=$start skip=$start)` for a few minutes

## getting into the groove

calling it after about ten minutes:

```
614+0 records in
613+0 records out
64277708800 bytes (64 GB, 60 GiB) copied, 693.65 s, 92.7 MB/s
```

now rerunning the cmp line. if this fails after about ten minutes we've got a problem

## about ten minutes later

```
/dev/sdf - differ: byte 71805952513, line 295646843
66.9GiB 0:14:32 [78.5MiB/s]
```

fuck

starting the dd again at 466e9, gonna let it run for about 50 gb before retrying the cmp

```
608+0 records in
607+0 records out
63648563200 bytes (64 GB, 59 GiB) copied, 683.946 s, 93.1 MB/s
```

fml it's still failing at right about the point where I stopped the copy. at least I can bump the start point up to 500e9 now. the compare should fail at about 30 gigs in (does at byte 30343464961)

just as a sanity check because it feels like I've been doing this dance forever, the cmp can read at least a full gigabyte at 600e9, so this really should be a small hole that will be filled if I run dd from 500e9 for another 100 GB

```
1054+0 records in
1053+0 records out
110415052800 bytes (110 GB, 103 GiB) copied, 1204.74 s, 91.7 MB/s
```

okay, restarting the compare from 500e9 again. if I have to come back and restart the copy again I s2g

```
/dev/sdf - differ: byte 111811811329
104GiB 0:22:57 [77.4MiB/s]
```

AYFKMWTSRN

I'm gonna go ahead and start the cmp at 610e9, then walk away for a while. Then I'm gonna start the dd again at 600, abort it about halfway to wherever the cmp from 610e9 came from, and if that shit DOESN'T cause some kind of data corruption at the point I stopped the dd then I'll just have to accept that I have pissed off the Devil and he wants me to suffer

(610 cmp stops after a few gb) oh right lol. starting cmp at 620e9

## wait a second

... oh SON OF A BITCH. I need to add `conv=notrunc`. this whole time I've been zeroing the target disk. goddamnit

wait, no, `conv=notrunc` is supposed to have [no effect on disks](https://stackoverflow.com/q/20526198/34799)

## later

oh okay, the 620e9 cmp failed too

```
/dev/sdf - differ: byte 65652832257
61.1GiB 0:11:06 [93.9MiB/s]
```

but, like, this is supposed to be the point: seek out the parts with bad blocks, then re-copy them

...fuck it I should have just done `cmp -l` to a file and redone the dd based on that

## ugh fuck thisssss

should have just consulted https://wiki.archlinux.org/index.php/Disk_cloning

`yay -S fsarchiver deepin-clone ddrescue`

## deepin-clone

Hitting Alt+F2 to start `deepin-clone`

This is... yeesh. Okay, looks like it's partition-based? And doesn't appear to ask for root?

## a dumb idea

What I want is a utility that can *minimally update a cloned disk based on changes from another disk*.

Yes, that requires reading the whole disk, but a) there are probably heuristics that can identify which parts were modified as they're written or something, and b) reading is still faster - and less destructive, on write-limited flash media - than writing.

## ddrescue

This is what I should have been using all along.

I could use ddrescue to accomplish that thing I just described by [generating a mapfile](http://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html#Generate-mode) to try to recover the parts that didn't get synced, but... nah. can't trust that the sections were zeroed, etc

## actually starting

after a healthy amount of safety calls and checks (or, honestly, an unhealthy, almost compulsive amount):

`sudo ddrescue -f /dev/sde /dev/sdf boatoar-copy.log`

oh my god it estimates the whole thing is just gonna take like six hours, it's running at close to 120MBps, that's *faster* than the raw `dd` I was trying, how did I make such a huge mistake by not starting with this



