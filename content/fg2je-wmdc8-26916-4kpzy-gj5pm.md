# Original setup

flashing RetroPie image from https://www.waveshare.com/wiki/GamePi15

adding wifi to /etc/wpa_supplicant per https://retropie.org.uk/docs/Wifi/#connecting-to-wifi-without-a-keyboard

changing /etc/hostname to studeku - coming up with this name was the longest part

## first bad run

Looks like I should have changed the name in /etc/hosts, too, it keeps complaining it can't find the host

after a few successful startups, this ran into a problem with the kernel module for the screen, it looks like?

## anyway, round 2

I'm using the 4.5.1 image on that page from the "PinkyPiX" project

changing hostname and hosts entry

Adding ROMs for:

- NES
- SNES
- GB, GBC
- gamegear (US games)
- mastersystem (BIOS and US games)

## what's next

- [Getting PICO-8 on studeku](tn055-7r8k5-878aa-wpnhr-ysbj4)
- fixing system issues described at [studeku problem core](4k7jg-7bcky-b8abx-s4ymr-ng0cb)
