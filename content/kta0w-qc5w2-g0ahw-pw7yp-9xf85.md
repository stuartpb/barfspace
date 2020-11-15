# Dream slicer

This'd be a client-side fork of something? I guess

Anyway

You've got your model, and an array of options

I'm thinking probably a big "PLA/PETG/ABS" button for the major-scale temperature/venting world

which can be an abstraction over an interface that lets you set your desired specific material

## side thought on "material"

(There's also a thing to consider here about making it so the tools can be symbolically matched to whatever filament is in the spools - also, hey, it's neat how this is like Kubernetes)

## Odd side thought on that

You could have gcode stored on the SD card to "select which filament was just loaded" from the front panel LCD UI, as a hack that would just echo a message to serial which would then be read back into the "currently loaded spool" system

anyway this starts to lead into my thoughts from the other note about gcode object storage

## anyway, one more thought on material

It's important to remember that there's a distinction between "here's the material I'm writing for" (used for model matching, etc) and "here are the temperatures I'm targeting" (which could be tweaked per-print)

in fact, I think that's a smarter way to model it: "this material I think should be printed X degrees hotter than normal", and then the print can either set the "normal" amount that the material tweaks, or just clobber it flatly (though it still ought to say what material it thinks it has for spool matching or whatever)

## anyway

it has options that resolve to common options between Slic3r and Cura, options that can kind of try to paper over technique differences between the two, and options that just straight-up only resolve to one or the other's model (for when you need to straight-up override)

the eye toward these options is, of course, building a new slicer that picks the most sesible of either to support

a thought: the "compatible options" for each slicing backend could be modeled as JSON schema? idk

all these are stored as documents, either static system files from the server or in PouchDB

maybe multiple foreign document servers can have docs pulled from?

## the plate

everything targets 3mf output
