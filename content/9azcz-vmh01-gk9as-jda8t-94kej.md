# surpass and Gross Simplification ideas

Gross Simplification can use a notation:

N/E/W/S for which way the shape orientation is "pointing"
R/G/B for which color the "pointed" shape is
C/T/Q for which shape is "ahead" (circle/triangle/quadrilateral)

Note that this way, the order of the letters doesn't matter, since there's no overlap (hence why it's N/E/W/S, as U/D/L/R would overlap with Red, and "Quad" instead of "Square", which would overlap with "South", or "Rect" which would also overlap)

Hmm... but you need to track the color and shape of at least two points...

You really need six options for the color/shape groups - let's see, if we've used up 10 characters here, we still have 16 letters left - we could pick "short names" that summarize the remaining colors and shape collections

I'm thinking "V" can be left out, because "V" represents the N/E/W/S "top edge" being described (inverting the "pointed tip" model I originally thought from), so that it's clear that the shapes being described are "left to right"

GR: Yellow
RG: Orange
GB: Lime
BG: Foam
BR: Indigo
RB: Maroon

remaining letters ADHJKPSUXZ

Maybe this could use a mnemonic based on the delta in sides?

QC: -3
TC: -2
QT: -1
TQ: +1
CT: +2
CQ: +3

Maybe the delta in corners:

QC: -4
TC: -3
QT: -1
TQ: +1
CT: +3
CQ: +4

I think that's not a bad way to model it: "If you have 5 pegs, and you turn a rubber band from the first shape to the second shape, how many pegs do you have?"

QC: 9
TC: 8
QT: 6
TQ: 4
CT: 2
CQ: 1

this lets the template be "Vector, Shapes, Hues" (where SS and HH can be used to refer to the constituent shapes, or SHSH/HSHS to refer to them interlaced)

I was going to say "Direction"... I think "Vector" works - it lets the joint shape describe the point again, in my head, while still making it clear that the other two are what's described by S and H
