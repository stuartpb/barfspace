# Log from trying to print individual beads on a plate

## first plate test

I'm now trying a 12-piece print. Turned the skirt height down to 1 layer, because otherwise it left the first piece to travel the perimeter for skirt, which is unacceptable (never got through those three layers alive).

It'd be nice if it were easier to cancel instances like objects for a plate like this: would be easier if the positions were auto-named, if I didn't have to right-click and select "As Separate Object" for each one, if I could reorder the pieces for printing or select a visit strategy (either for one-by-one or all at the same time)

THOUGHT: What if G-code were exported as an array of "here's the line of gcode, here's the time estimate, here's the object/instance it's built for" so this kind of manipulation can be done without comment hackery

## Results while printing plate

First piece came loose sometime between the second print starting (finishing?) and some time into the third one - was within range for me to quickly pull it

that'd be another nice feature: "pause after this next part"

Got 6 done in total before it failed possibly between top-center-left and mid-center-left.

You know, why cancel instances of the same part? You can just set it to cancel at same temperature and restart the plate

anyway

thoughts on a redesign (TODO: link this in) aside, I'm going to try printing with 3X layer infill for the next test bead, no plates involved. 100% (Archimedean Chords). Might try concentric, too.

Welp, it failed (see below) - maybe I should try 2x...

or maybe I should just try a redesigned interlock mechanism
