# my as-yet-unnamed octopi system

## name brainstorming

I'm thinking about something that could pair with "stuflair" - I thought of "sturic", but that looks weird and also Ric Flair seems like he might be kind of an asshole

stupode (Print On Demand Engine)?

## Updates

- 2019-06-14:
  - [*anime narrator voice* A foggy history...](bt7dt-y64cb-2k815-8hyd6-qmzre)
  - [An abortive attempt to resume said history from stuzzy](nzjm8-g478q-4a9bb-gxghd-rqnj9)
  - [Bootstrapping from scratch on stushiba](y0zxq-9b37m-8s88k-kzmda-45zat)
  - [Changes On the System Itself](9390a-kvcqv-0x80d-3emtt-mhd7m)
- 2019-06-16:
  - [Making Print Canceling Suck Less](hamp7-grwb9-4z9bc-481g2-wc30f)
  - the [bounding box](https://github.com/foosel/OctoPrint/issues/1551) was not set in Prusa's default image, this should probably be reported upstream
    - it's weird that this wasn't a suggestion in the notification, but disabling the check was
    - moreover, this is a weird feature to include at this point in the process - my slicer does bound checking for me
      - I guess I could be downloading gcode off the internet that was made for a bigger printer, like maybe a calibration procedure by mistake?
  - installing the Cancel Objects plugin before I start print a plate of [beads for my necklace](6te6f-hf613-ed9yr-8cpdb-ycd8e)
    - ah crap, it doesn't treat instances as objects
    - it's retracing the _entire bed_ before each layer of the first object. That seems like a behavior that could be improved.
      - (this is more of a PrusaSlicer issue, should probably move somewhere in that neighborhood)
- 2020-01-26:
  - Updating settings to list 5 extruders
    - The update instructions say not doing this can break stuff
  - Updating to 1.3.12
  - Updating plugins
  - Installing Prusa MMU2 Select Filament, Prusa ETA Override, Mesh Bed Level Visualizer plugins
    - that last one involves installing numpy [which takes forever](https://community.octoprint.org/t/bed-visualizer-v0-1-3-takes-a-fair-amount-of-time-to-install-btw/3238/6)
    - > Error!Could not install plugin, unknown error, please consult octoprint.log for details
    - whatever
    - probably [needs swap](https://github.com/jneilliii/OctoPrint-BedLevelVisualizer/issues/141#issuecomment-542227338)
    - Oof, the single-filament selector only works from OctoPrint-dispatched gcode, from the looks of it
- Sometime in February 2020: [installing numpy](86arg-75a86-pjaxk-01537-az3mc)
- 2020-03-09: updated OctoPrint to 1.4.0

## issue tracking

- [possible fix for serial failures](https://github.com/prusa3d/Prusa-Firmware/issues/1180)

## Feature brainstorming

- [plugin ideas](khs7f-7tx86-0qayd-vvq1d-s93cd)
- what if it ere flashed/installed in an A/B partition Chrome OS / Pixel-era Android way?

## See also

- [printacle](v62a9-2ccas-m5a21-pppj8-966e8)

## musing

what if the next i3 mark doesn't even include an LCD, it's entirely oriented for RPi and touchscreen? That or it'll use whatever the SL1 uses

IDK, that'd jack up the price by like 20 bucks unnecessarily - the whole point of these components in the base kit is that they're cheap

(UPDATE: the Mini uses a touchscreen/Wifi-oriented control board which is pretty much what I was thinking)

I think this is kind of like what I was thinking of https://www.klipper3d.org/Features.html

## heh

[the OctoPrint guys think this mod was a terrible idea](https://community.octoprint.org/t/status-of-octopi-octoprint-on-the-i3-mk3/6751)

[Prusa's OctoPi was also bad](https://community.octoprint.org/t/prusa-specific-octoprint-download-link-is-broken-i-such-available-tia/747/8)
