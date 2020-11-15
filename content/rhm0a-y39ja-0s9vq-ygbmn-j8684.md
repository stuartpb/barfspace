# 2018-09-05

After running `sudo pacman -Syu`, I install `f2fs-tools` and `hdparm`, planning to use them to wipe and repurpose the stock 16GB onboard storage flash chip that I originally experimented with setting stuzzy up on for about a week (from 2018-08-22 to 2018-08-30).

However, it became clear after reading a little further that I'd be better off doing this on another system, once where I could slot the chip directly into a SATA bay rather than working through a USB enclosure.

## extreme crossover

From here, I:

- attempted to rebooted into stuquart via USB enclosure using stuzzy as a chassis, as part of that system's setup;
- pulled the SSD out of stuzzy and attempted to boot, then reinstall, stuquart like that;
- swapped the stuquart drive with the aforementioned 16GB flash chip, then rebooted the stuzzy chassis into sturling to erase it;
- put the stuzzy SSD back in the chassis (and put the cover back on), then tried to boot back into stuquart via USB again (eventually succeeding).

To follow what happened next while stuzzy was powered down, jump to the "booting stuquart off stuzzy" section in stuquart's first changelog (2018-09-05, like this one).

For the continuation of the task described at the beginning of this log, see the 2018-09-05 changelog for sturling.

Only much, much later, after stuquart had been reinstalled *twice*, did I finally boot back into stuzzy itself.

## much, much later

I drag a 256x256 PNG I have lying around on a flash drive and copy it to my home directory as `.face`.

## GNOME system monitor

Googling for ways to display the system load in the GNOME shell (having waited several minutes for Google Chrome to load with no indication as to why this'd be an issue), I land on https://extensions.gnome.org/extension/120/system-monitor/, which gets me to install the GNOME Shell integration Chrome extension, and `sudo pacman -S chrome-gnome-shell`.

I make a bunch of changes to the configuration, mostly hiding text and the icon, shortening graphs to be 30 wide, showing the tooltip, and changing the alpha of Cache in the memory graph to 25% (since Cache doesn't really count as memory usage, and shouldn't be the brightest color. I never understood why that was the default.)

To see if I can get fan data, I run `sudo pacman -S lm_sensors`, then (per [the wiki page](https://wiki.archlinux.org/index.php/lm_sensors)) `sudo sensors-detect`. The thing for fan sensors still says "Please install lm-sensors", so it looks like that didn't do anything.
