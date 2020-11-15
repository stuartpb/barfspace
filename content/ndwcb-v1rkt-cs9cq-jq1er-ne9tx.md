# Jig Printing: The Forbidden Technique

a print mode where you print something, remove it, then print a jig to hold it in place, don't lower the bed temperature, don't remove the build plate, and don't rehome the extruder, and then lower the print head print an additional part onto one surface, re-oriented or with some post-assembly done to it

You'd have to make it a very mechanically secure jig

Oh dip, what if you used crash detection to locate calibration points on the jig (ie. specially-placed-and-oriented towers)?

there was also an idea I had once about magnetic jigs: since the heatbed uses magnets, wouldn't this theoretically work for that as a positioning mechanism - letting the user insert magnets into points on the jig?

This is, essentially, a pre-printed support to impose the print's calibration on existing material

This would get really clever with a printing farm, or even just having two printers: while one prints the part, the other printer prints the jig for the next step, then you swap the part, clear any jig/support from the bed the part was removed from, and begin printing whenever the other bed's jig is ready

(this would be super cool with a farm, to prerun each jig step as evenly as possible by packing into schedules)
