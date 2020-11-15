# 2018-09-05: How to Move On (Without Actually Moving)

I have an old 500GB 2.5-inch hard drive that I used some years ago to run Windows 8 on my desktop (because the drive was on sale for cheaper than any desktop drive or something like that).

Today, I'd like to have a clean installation of Windows 10 that I can boot from an UEFI machine, so I'm going to take that Windows 8 installation and see if I can juggle some drive characteristics and the Windows 10 install media and get that BIOS/MBR Windows 8 installation upgraded to an EFI/GPT Windows 10 installation (it's cool, I have multiple legitimate Windows 8 keys).

Before I do any of this, because I don't actually want to lose any data from my old Windows 8 installation (though I'm also not such a fool that I intend to *actually upgrade* the Windows 8 installation - I will, of course, try as hard as I can to start the Windows 10 installation from scratch), I have imaged the entire drive, so that, in the worst-case scenario where I completely botch everything, I can still revert to the way things were. (See the stushiba changelog for 2018-09-03.)

With that out of the way...

## converting the drive from MBR to GPT

I looked into it, and Windows can really only work off of a GPT if the drive it's installing to is already formatted as GPT going in, so the first change I'm making to the disk is to convert that Master Boot Record it had from back in the Win8 days to a GUID Partition Table. Looking at [the ArchWiki documentation on this](https://wiki.archlinux.org/index.php/Gdisk#Convert_between_MBR_and_GPT), I run this command (from stushiba, the machine where the disk is currently physically mounted, and where I did the initial imaging a couple days ago):

`sudo sgdisk -g /dev/sdb`

The operation has completed successfully. (`sudo blkid /dev/sdb` shows `PTTYPE="gpt"`)

With this out of the way, I'm going to reboot the system and see if the Windows installation media can put Windows 10 on that drive (or if it complains about seeing a different drive that already has Windows 10 on it, meaning that I would need to continue with the original plan to move the disk over to stuzzy first).

## oh wait yeah

I'm going to need the product key to install this: while I have two Windows 8 keys, I can't remember which one I used to install stutendo (I'd guess it's the older one, but I can't remember for certain). I reboot back into stutendo (I was able to boot the Win10 installation media, but only after moving the flash drive from my USB hub to a direct-to-case port), then run NirSoft ProduKey to recover the key used to install Windows here.

The key ProduKey displays doesn't match *any* of my Windows 8 keys, so I'm just going to hop back to the install media, try the newer Windows 8's key, and cross my fingers and hope everything goes fine.

### a brief aside

I remember having some trouble with this installation a while back, and after leafing through my Windows 8 install media, I remembered what it was: Microsoft was trying to sell Windows 8.1 as a paid upgrade IIRC (or at least one you needed a separate key for), and I'd tried to install Windows 8.1 directly to this partition, and I think I had to jump through a bunch of hoops (including using a special fixed key for installing Windows 8.1 that I had written by had) to get it to work (and I might have ultimately just had to make a fresh Windows 8 install that I then upgraded to 8.1 using that key, I don't remember).

## installing Win10

Okay, so, when the prompt for the key came up, I entered the newer Win8 key, and after a few seconds it advanced to the EULA without complaint, so I guess that works. (Low-key, what I think the installer is coded to do is, if a user inputs a valid Win8 key, it goes out and uses that to provision a brand-new Win10 key, hence what I saw from the NirSoft thing where my Win10 key wasn't either of the Win8 keys.)

Once that was past, I deleted both of the existing partitions on the 500GB disk in the installer, then selected the item for "Drive 1: Unallocated space"

## argh

After it was taking a while to load files, I went up to go to the bathroom, and when I came back the system had powered down, and wouldn't come back on the new installation.

I can't find the new installation as a UEFI boot option, so that's something I'll try fixing later, but for now (because Microsoft's "boot repair" can be really invasive and clobbery), I'm going to try booting into the install media, clicking the "Repair" option, and clicking the "Use another operating system" thing.

This presents me with two choices: both are listed as "Windows 10", one "On volume 13" and one "On volume 6". It doesn't distinguish which of these is which, and going into a command window and running `list volume` didn't bring back a numbering that would suggest a connection to these numbers, so because I have an appointment in a few minutes, I'm going to try "On volume 13" and see if that boots me into stutendo (which is what I want right now - I'll come back and retry with Volume 6 later).

After rebooting, it starts out with the "Just a moment..." spinner, so it looks like Volume 13 was actually the new installation, whoops. I'll have to do my appointment via a Chromebook while this install continues.

I log in with my Microsoft account at this point (IIRC).

It demanded I give the system a PIN (even though I don't want to) so, sigh, I use a 12-digit number I can hopefully change later

now it's trying to snake into my phone. I'll "Do it later".

it's bringing up the OneDrive stuff... ugh, I said the words "ok" in my appointment, and Cortana heard that to approve this step. Ugh, whatever.

Now it's asking me to "Make Cortana your personal assistant?" Oh HELL no.

On all these default-on switches that I'm pretty sure constitute GDPR violations, I'm turning off "Speech recognition" (separate from Cortana for some reason?), "Find my device", and "Ad ID". The rest have me to overwhelmed to consider (which is, of course, the entire point of deploying this dark pattern, fatiguing the user with guilt until they give in and stop bothering to toggle things, which is, again, why I'm pretty sure why the GDPR has provisions against it).

When Edge pops up, of course the first thing I do is type "Google Chrome"... and it disappears after installing the AMD Display driver for my desktop, then reading my Vive as a monitor it should move the Edge window to.

Ugh, I open up Display Settings by right-clicking the desktop and it *still* opens on the Vive. I use Win+arrow keys to Snap the window to the current monitor, then go down to the "Multiple displays" section and select "Show only on 2".

## installing Google Chrome

hahaha there's a big stupid ugly banner on Bing that shills Edge as "the better, stronger, smarter and more attractive browser that's already installed on your new PC, look we have Cortana, only an idiot would use something else", and, like, oh my god Microsoft do your analytics indicate that people actually fall for this

OH MY FUCKING GOD it is SO NEEDY when you ditch Edge, it KEEPS BEGGING you not to change the default browser like "No, wait, one last, just, please, pleeeease try Edge". After I've already installed Chrome. imagine if these people still had the monopoly they're so transparently insecure without, lol

Pinning Chrome to the taskbar and unpinning Edge, obviously

## more Windows shell changes

Right clicking the "Type here to search", going to "Cortana" and selecting "Hidden" to remove the search box

## setting the machine name

Since I was never prompted to name the machine in Setup, and I would like to do that, I'm hitting Win+Pause, clicking "Change settings" under "Computer name, domain, and workgroup settings", clicking the "Change..." button, and replacing the default "DESKTOP-22V5JKS" with "stuquart".

It tells me I'm going to need to restart to apply these changes, so I power down so I can test this drive booting on stuzzy (and recover/set up the UEFI boot stuff if I can't).

## pulling the drive

I take the drive bay out of my desktop's chassis, remove the mounting screws (this bay has convenience mounts, but only for full-size drives), wipe off the *copious* amount of dust, and, after dressing the drive in the ceremonial silicone garb that came with the drive enclosure, replace the old storage chip from stuzzy with the drive that currently has stuquart installed.

## booting stutendo

Powering the desktop system back up (and not touching anything) shows a Windows blue screen error, so I go back into BIOS and set it so that it uses rEFInd by default.

Trying to boot Windows from rEFInd indicates that the Windows boot has been messed up, just like before, so I try hitting F9 to "boot into a different Operating System": this reboots for a while, then presents me with a selection of "Windows 10" (with no listing of what volume it's on), and "Windows 10 On volume 4", which I'm assuming is stutendo. I click below, on "Change defaults or choose other options".

On the next screen, I click "Choose a default operating system", then "Windows 10 On volume 4". That kicks me back to the Options menu again, so I click "Choose other options", then "Troubleshoot" and "Advanced options", "See more recovery options", and "Startup Settings", which just tells me I can change startup settings from within Windows.

Since none of these appear to be a simple "Remove obsolete boot entries" option, I back out a few times and click "Continue" to "Exit and continue to Windows 10 (on volume 4)".

After a while, this does boot stutendo: I unlock it and reboot, to see what'll happen now.

As expected, it comes back up through rEFInd, which autoboots the Windows option after timeout, which comes back to the OS selection screen, which now defaults to stutendo (but waits an additional 30 seconds).

I'll want to fix all this, but it'll be logged within the changelog for stutendo from this point forward.

## booting stuquart off stuzzy

I set the drive up and plug it into a USB port on stuzzy, then power down stuzzy to see if I can boot into stuquart (or if I need to mess with the EFI boot stuff, which I'm afraid I might have to do, especially seeing as how the Windows installer appears to have installed for a configuration that assumed the ESP for stushiba/stutendo would be sufficient).

Yeah, unsurprisingly, the drive on its own can't boot. I reboot from the install media (the touchpad doesn't seem to be recognized, so I navigate everything via keyboard; that's not a good sign), then from the recovery options' Advanced options screen, I select "Startup Repair" to see what we can do. (Worst case scenario, I'll have to drop back in via sturling and reinstall systemd-boot, which I can handle.)

Oh ffs, "Startup Repair couldn't repair your PC". I'm gonna try pressing "Advanced options", throwing open a command prompt, and seeing what I can do.

siiiigh... I think I'm just going to stop everything, pull stuzzy's onboard disk out, then put this hard disk in and just see how Windows installs in that environment. It looks like this disk was set up to not have an ESP, and I don't want to bother messing with trying to add one myself manually (it's not like there's much to recover on the installation thus far).

Powering down and doing that thing I just described.

## oof

Okay, I've got the disk plugged into the machine's SATA bay (which is basically a free-floating chip), and it's... too big to put the bottom of the chassis back on, so I've just flipped it upside down and got the bare machinery sitting on it while I do this install. It feels *incredibly* precarious, so I'm hoping to be done with this part soon.

Tabbing through the installer and entering the same Windows 8 key I used before.

Deleting all the partitions created in the course of the previous installation, then selecting the great mass of unpartitioned space to install to (again).

This time, I'm going to *watch* the installation process, and see if it tells me I should be watching out for anything when it reboots.

On reboot, the system booted back into the installation media, so I removed that and rebooted again.

It looks like it's booting from the drive now..

## let's try this again

I breeze through all the Region / Keyboard setup stuff just like last time.

Since I'm not on a wired machine this time, I connect to my wi-fi in the Network step.

It sits and spins for a *while*, then there's a flash and the screen goes black (I guess it was pulling updates?), then it comes back and asks me if I want to set up for Personal or Organization use, just like last time, and I select "personal use" again.

I give it the credentials for my Windows account, and it makes me set a PIN again, so I set the same one as before.

This time, I just leave the phone number input blank and hit "Next", which also skips that screen.

To be honest, I was probably going to install OneDrive anyway (I mean, I let Chromebooks do Google Drive), so I go ahead and hit "Next" on that screen.

It's asking if I want Cortana again, even though this time it's not able to listen via the microphone (I'm guessing it's planning on finding a driver to enable that post-boot): once again, I choose "No".

This time, I disable "Speech recognition" and "Ad ID"; I'm gonna leave "Find my device" *on*, because I just realized that I actually *would* like to get a notification to my account if somebody steals / images this drive and boots from it somewhere (though the odds of someone doing that and not being savvy enough to avoid triggering that phone-home are, admittely, practically theoretical).

Also, I'm going to disable "Diagnostic data", since I'm interested in seeing if that stops the pointless "Hang on while we tell Microsoft about this problem..." prompts when a program crashes. I'm also going to turn off "Tailored experiences" in the hopes that it prevents the fucking "Install Candy Crush now" crap that Windows 10 populates the Start Menu with by default.

And now it's doing its setup-finalization stuff, saying "Leave everything to us" in this really creepy way.

And it's booted.

## two quick changes

Because I hate this dueling-timezones crap, I pop open regedit and add a QWORD at `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\RealTimeIsUniversal` with a value of 1, as described on https://wiki.archlinux.org/index.php/Time#UTC_in_Windows

I also rename the system again: this time (since stuzzy's keyboard doesn't have a "pause" key), I type "system properties" into the search bar, which opens the native Windows 10 settings "About this PC", where there's a button that says "Rename this PC". I cklick that, and rename the system by entering "stuquart" into that dialog box.

(lol, it synced the Microsoft Edge shortcut on the desktop to OneDrive, so now I've got a "Microsoft Edge" shortcut on the desktop that looks broken, and a second "Microsoft Edge - Copy" that looks like it's synced? Windows is such a mess)

Now I'm gonna shut the system down, pull the drive, and boot into sturling to try something real quick - I'll come back with this system in the USB enclosure (where I don't have to keep my motherboard exposed to run the drive) to take care of the other changes later (and maybe with a mouse plugged in).

(see sturling 2018-09-05 changelog for the interim activity using stuzzy as a chassis between this shutdown and the next section)

## after some reboots

Trying to boot from the USB enclosure: now it's bluescreening saying `INACCESSIBLE_BOOT_DEVICE` and eventually comes back booted into Automatic Repair, so I try pretty much everything I can think of there until I settle for "Reset this PC", which takes about an hour and boots back into stuzzy multiple times, but does eventually get the system to a bootable state (though it's got two entries for "Stuart Bentley" on the login screen, for some reason, and the touchpad still doesn't work).

## resuming

Okay, the hostname change and `RealTimeIsUniversal` are both still set, so all that's left is to install Google Chrome and replace Microsoft Edge, [ignoring all of Microsoft's pleas to the contrary](https://www.youtube.com/watch?v=etJ6RmMPGko).

In the middle of all this, I was trying to get by without using the touchpad, but it quickly became too distracting, so I started searching for a way to install it, and my searches eventually led to [this](https://coolstar.org/chromebook/downloads/drivers/crostouchpad.4.1-installer.exe) driver installer - I used all the tricks I could think of to get this installed using only the keyboard (eventually hopping over to another machine to fill out the wizard [here](https://coolstar.org/chromebook/windows-install.html), which doesn't have a tabindex on the "NEXT" button - incidentally, this is an Acer with a Celeron 847, meaning it's the C710 that comes up when you pick the first option on both screens), but was ultimately thwarted by the not-quite-a-UAC-prompt that Windows popped up to approve the driver installation - which I couldn't get to respond to keyboard input, in a deep and cutting irony. At this point, defeated, I went out and grabbed my little wireless USB keyboard+touchpad remote, and used that to click through the last prompt in the way of getting the touchpad working.

That put me in a right good mood to redo the other two changes I did the first time around: cutting Edge loose, and hiding Cortana's input field.

I also hide the People button on the taskbar (what is that even for?), and enable Night Light. It doesn't activate, because the system clock is off, due to Windows having set the system clock to local time, then not re-set it when booting back up expecting the time to be UTC. I cycle the "Automatically set time" option in Time/date settings, just like I did to fix this problem on stutendo. (I also set "Set time zone automatically", which probably will matter if/when I travel with this installation..)

OneDrive has popped open and is asking me to give it my email address and set it up... not right now.

Honestly, at this point, I just want to boot back into stuzzy and get back to the other stuff I wanted to do there. I can mess with Windows 10 some other time.

Ooh, one key thing I haven't done yet: sign into my Google account in Chrome so I can get Tabalanche installed and stash these tabs I've got open away.

Google Hangouts installs for the Nth time today, and this time Windows prompts me about how it's going to run in the background and everything: I don't use Hangouts any more, so I just go ahead and uninstall that (knowing full well that that's going to lead to it getting uninstalled from everything).
