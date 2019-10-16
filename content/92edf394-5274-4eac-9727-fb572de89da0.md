# Understanding the First Layer

There are two places a 3D print can fail:

- The first layer.
- Somewhere else. *(less common)*

If your plastic doesn't stick to the bed, it's not going to stay put, and if it's not going to stay put, it's not going to print.

(this is one I was thinking would illustrate well, with a cool little Fonzie filament staying put, whereas a Doug filament is like "I'm outta heeeeere")

Sometimes, the first-layer issue won't become apparent until the second layer - *you should still abort the print*

## How will I know if my first layer is too high/low?

https://www.reddit.com/r/prusa3d/comments/bmqlw3/first_layer_infill_shy_of_perimeter/ illustrates such a defect on a Prusa, where even a too-high extruder will still print a workable model

## Bed leveling / first layer adjustment on an old-school printer

Generally you'll twist some wheels

You'll have to do this again and again, and every time you press on the springs you'll have to do it again...

and even if it's level, you still need to adjust it to get it appropriately close.

## Prusa stuff

On Prusa printers since the MK2(?), this is known as the "live Z", and it is handled electronically by the user's manual setting.

[this was Prusa's secret cryptex message](https://www.youtube.com/watch?time_continue=200&v=EaJL1B80fEI)

### How to Place your PINDA

can't be lower than the tip of your nozzle (because that needs to be just about touching the build plate, and it can't get there if your PINDA is touching the plate), but should be close. The distance between it and the tip of your nozzle is going to be the value you set in Live Z to bring your nozzle's offset to 0 relative to where the PINDA detects the build plate to be

You want it to be low, so that you've got as much room to adjust your nozzle height in as possible. if your PINDA's too high, your nozzle will crash into the build plate - this is why the XYZ calibration wizard has the "put a piece of paper under the nozzle and power down the system if it catches" phase. It's to catch that scenario.

Always make sure that your PINDA hasn't moved in any situation where something nasty's happened to your extruder. If a crsh causes it to get moved up and out of position, merely homing the axes could cause your extruder to dent and gouge your build plate! (Unlike that gradual-shift test with the paper from that early setup, it won't expect that it should be aniticipating this as a scenario, and will only crash and ask you to power cycle the printer once the head has crashed and the damage has been done.)

### Why and How The Wizard Works

how much rotation of the knob does it take to see things, where should you be looking for what changed (ie. how long does it take for a live z change to demonstrate itself), etc

## An alternative to the wizard

[printing an entire layer](https://forum.prusaprinters.org/forum/original-prusa-i3-mk3s-mk3-assembly-and-first-prints-troubleshooting/life-adjust-z-my-way/)
