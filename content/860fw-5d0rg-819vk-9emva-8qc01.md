# 2017-12-29: Stuixel, my new Pixel 2 XL

ok so basically with this new phone I've already started getting pretty wild with it right out of the gate, so I figure I should probably start keeping a petlog of everything I'm doing to it, since it is effectively a pet Linux box in my pocket

## unboxed

I unboxed the phone and all a couple days ago, thinking "oh I'm just going to root this with the stuff in the box, nbd". popped my old micro-SIM in and whoaaa derp, the cable it comes with is USB-C on both ends, and I don't have a freaking MacBook or Chromebook Pixel or Pixelbook or whatever the fuck would make that a reasonable option to adb/fastboot with it

anyway I knew I was just going to blow the whole installation away when I unlocked the bootloader for Magisk and everything so I blew through the initial setup going "skip" as much as I could (even skipping the WiFi setup). After that, I enabled developer mode, OEM unlocking, and USB debugging, per steps 1 and 2 [here](https://android.gadgethacks.com/how-to/unlock-bootloader-your-pixel-2-pixel-2-xl-0180707/)

let it sit on my desk for a few days as I hustled around trying to find an appropriate cable, it was soul-wretching and I don't really want to talk about it

## unlocking stuff

after finally being able to borrow a USB A - USB C cable (freaking Amazon sent me the wrong one and the Micro B - C adapters I bought didn't do data) and authorizing my computer for USB debugging on the phone, from my adb console:

```
adb reboot bootloader
fastboot flashing unlock
```

I'd read about the Pixel 2 XL needing `fastboot flashing unlock_critical` as well, but that sounded risky and I wasn't sure I wanted to do it, so I skipped it this time and started going through setup on the phone normally. However, after giving it a little more thought (and realizing that even `fastboot flashing unlock` necessitates the little "this phone is rooted oh no" warning at startup that you can't remove), I decided to go back and wipe the phone again by unlocking that, too:

```
adb reboot bootloader
fastboot flashing unlock_critical
```

## actual live setup

I plugged in the cable that transfers your data from one phone to another to my old phone, and I picked whatever the "transfer stuff" option was instead of "have a fresh start"; however, when the prompt came to actually pick *what I wanted to transfer from my old phone*, I decided I actually *did* want a fresh start (lots of stuff on my old phone was irrelevant stuff I never had the heart to remove), and figured "eh, whatever, I'll probably be able to transfer this stuff later when I decide I want it".

(Later I looked this up and found out, nope, there's no way to bring this UI back after setup! smdh oh well)

## installing Magisk

Anyway, I wanted to install Magisk, and I didn't install any custom recovery or bootloader or anything, so after finishing all this setup stuff, downloading Magisk Manager, and re-enabling developer mode and USB debugging, I downloaded the stock image from https://developers.google.com/android/images for my phone and extracted the `boot.img`, transferred that over to the phone via MTP, ran whatever Magisk thing patches `boot.img` and transferred it back to my desktop via MTP as well, then went back into my adb console that I hadn't yet closed and ran:

```
adb reboot bootloader
fastboot flash boot C:\Users\Stuart\Downloads\patched_boot.img
fastboot reboot
```

## setting up ssh

okay so I knew I wanted a Git client and also knew I'd want ConnectBot for SSH, so I installed MGit and the latter via F-Droid and went through a whole bunch of different kerfluffles trying to make an identity in one and import it cleanly into the other (including an arduous `chown` of key files produced in Amaze to MGit's user, which somehow *still* had permission denied, uuuuugh). since afaict there's no way to use Amaze as a file picker in Oreo any more (ie. no way to escape sdcard) and ConnectBot doesn't let you change nicknames after importing and I kind of like ConnectBot's entropy feeder thing, I decided to go with CB producing a 4096-bit RSA key, then had MGit produce its *own* key (naming it `id_rsa`), then opening the files up in Amaze and overwriting the key contents with the keypair from ConnectBot.

anyway I pasted the key into my GitHub account's authorized keys, cloned petlogs (into the default location because fuck it), and here we are
