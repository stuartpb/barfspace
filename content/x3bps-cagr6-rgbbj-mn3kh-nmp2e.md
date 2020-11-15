# PocketChip Game Boy Emulation

- https://web.archive.org/web/20180919051341/https://bbs.nextthing.co/t/mednafen-emulator-configuration-gbc-gba-snes-nes/5027

starting with `sudo apt-get install mednafen higan libsdl2-dev` (not gonna install visualboyadvance because lol come on it's over a decade old)

having installation problems (ie. `Unable to fetch some archives, maybe run apt-get update or try with --fix-missing`)

a raw `sudo apt-get update` does nothing

https://unix.stackexchange.com/questions/2544/how-to-work-around-release-file-expired-problem-on-a-local-mirror

`sudo apt-get -o Acquire::Check-Valid-Until=false update`

(I had to `su stuart` because I remember my own password but not what I changed the chip password to)

while I'm at it, let's also go ahead and install `mame mame-extra mame-tools`

## exiting the su

setting the mednafen conf (which did have a different name) to use SDL for graphics

anyway, I'm trying Higan now

since all our games are in 7zip archives I'm gonna go ahead and (back in as me) install `p7zip`

back as chip user: `mkdir Emulation`

## okay so

Higan, as you might expect, is unusably slow with the SDL driver. Back to mednafen

Editing the config, Busting out the ASCII chart to go ahead and remap the `command.0` through `command.9` state keys from the number keys to QWERTYUIOP, and the slot-selectors to H and J

I've changed the scale to `aspect_int` which makes it single-pixel tiny for GBC games. Meh

This is a solid argument for having a taller screen on a PocketCHIP-inspired device imo: should have at least as much vertical resolution as 2x a game boy
