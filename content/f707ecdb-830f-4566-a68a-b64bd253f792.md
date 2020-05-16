# Day 1

## A few necessary pieces

Printed faceplate and keyboard

printed stylus

## Initial updating

Ran http://misc.chip-community.xyz/scripts/update-jessie-sources.sh

Manually edited the sources list with vi to get rid of ntc's servers

got errors re: backports so I switched the http.debian.net references on those lines to archive.debian.org

adding `[check-until-valid=no]` (per https://unix.stackexchange.com/questions/508724/failed-to-fetch-jessie-backports-repository) does nothing? well, keeping them in for now...

trying `sudo apt -o Acquire::Check-Valid-Until=false update` and upgrading first, to see if that'll fix it (since I don't want to add it to my config)

still getting a warning about ["No public key available"](https://unix.stackexchange.com/questions/550780/no-public-key-available-for-the-following-key-ids-aa8e81b4331f7f50), but that's ignorable

upgrading looks mostly right. I notice a few `Warning: root device  does not exist` prompts around `update-initramfs` but I'm assuming that's normal

## reboot

okay, we got far enough that it's back to the home screen, good

going back into the terminal

downloading the latest pico-8 from https://www.lexaloffle.com/bbs/?tid=34009

selecting to clobber `[A]ll` when prompted

starts up okay

exiting to console, keyconfig

using `-` and 0 as O and X for P1, respectively

remapping P2 to axsz and K+M

space for pause for that true game boy feel

## later

Oh, the Fn key acts as Right Alt for use in games - that's what the default keymap was about. (I was thinking it'd be unusable)

okay, remapped P2 back to the corner keys

Also reversed the O and X keys to 8 and `-` (the default, but switched?) because most games seeem to assume Z and X, and some have directionality things based around that
