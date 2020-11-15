# Making print canceling from OctoPrint suck less

OctoPrint's default gcode of "eh fuck it don't move or anything" is such a pain in the ass.

I didn't have time to document OctoPrint's default gcode to cancel a print, but suffice to say it sucks.

after reading [this forum post](https://forum.prusaprinters.org/forum/original-prusa-i3-mk3s-mk3-software-archive/octoprint-after-print-job-is-cancelled-gcode-script/) and still being dissatisfied with the suggested script, here's my current iteration

<!-- this is some bullshit to avoid choking GitHub Pages' Liquid tag processing in Jekyll: {% raw %} -->

```gcode
;disable all heaters
{% snippet 'disable_hotends' %}
{% snippet 'disable_bed' %}

M106 S0 ; disable fan

G91 ; set to Relative position
G1 E-1 F300 ; retract filament a bit before lifting nozzle
G0 Z15 ; move z axis up 15mm
G90 ; set to Absolute position
G1 Y225 F5000 ; move part out for inspection
G1 X0 F5000 ; move nozzle out of the way
M84 ; disable motors
```

I found this post on Reddit, though, and I'd have to look it up (I remember finding it in the firmware a while back), but [this](https://www.reddit.com/r/MPSelectMiniOwners/comments/7wussl/octoprint_cancel_bed_travel/du5vfjk/) seems more like the firmware's stop function:

```gcode
;disable all heaters
{% snippet 'disable_hotends' %}
{% snippet 'disable_bed' %}

M106 S0 ; disable fan

G91; Relative Mode
G0 Z10 ; raise extruder
G90; Absolute Mode
G1 X0 Y200 F3000 ; move part out for service

M84 ; disable motors
```

(confession, my code had "disable motors" at the top, too, before I started writing this and realized "hey wait, aren't we immediately engaging them?")

## bottom line

there should be a gcode in the firmware to trigger builtin snippets like this (and other gcode scripts like the pause/resume behavior), and there should be a way to signal the Raspberry Pi from the LCD to do stuff like cancel a print, because not being able to stop my printer because I can't reach my phone is some bullshit (and the whole reason I want this gcode is because stopping should be more than just halting everything)

## firmware links

https://github.com/prusa3d/Prusa-Firmware/blob/MK3/Firmware/ultralcd.cpp is the file with the cancel logic in it (search `X_CANCEL_POS`) - it's not just one thing, if you check canceling from SD, you'll note that it continues moving the head a sec after cancelling, see this file

There's also the stuff where, you know, if it's just heating, it doesn't move anything. You'd have to do some real guts-work to implement this stuff in OctoPrint. Ugh

## also, UI

What'd be *real* neat would be if the Pi could hijack the LCD and/or add its own menu dynamically (so Cancel Object could become a controllable function)

<!-- {%endraw%} -->
