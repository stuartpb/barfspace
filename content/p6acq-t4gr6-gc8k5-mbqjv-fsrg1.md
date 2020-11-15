# A history of my Pebble Time straps

## The stock straps

I didn't like how these got all gross from my wrist so easily, so I 3D printed an alternative

## Printing the clasp originally

I printed this but never used it - I think my issues were:

- Not an improvement in breathability
- Narrower than the width (see below for how this becomes problematic)
- Actually couldn't get it to latch! Maybe I just didn't get how it was supposed to work, or maybe manufacturing defects made it too tight?

## Stopka segmented strap design

Using the spring bars from my Meta Watch, ironically enough.

Printed in White ABS as one of the first things I made with my Qidi Tech I. (Or was it the narrowing version?)

This was okay, but it didn't feel all that elegant, and I kind of wanted something that would *fit* my wrist while still being breathable (instead of just being breathable because it was too loose).

## take 2: TPU mesh

(this section is mostly pulled from the README for my loadout repo at the time - if there's any weird tense confusion etc, that's why)

The watch strap I used until somewhere around mid-2019(?) was based on https://www.thingiverse.com/thing:2276049 with the parameters tweaked (resized to fit, render quality bumped to high settings, and the contour switched to a straight sphere), and notches added to the holes and the ends of the strap for collapsing the spring bars (ie. the "helpers" in https://github.com/Stopka/watch-band/blob/master/src/watch-band.scad).

I picked this design because I wanted a breathable, one-piece strap for my Pebble Time. It's sized so that, when relaxed, it gently grips my wrist, and when "stretched", it can fit around my hand to take it off.

The iteration I wore was printed on my Qidi Tech I in [PRILINE Complexion TPU][], sliced in Cura at Extra Fine (0.06mm) with 0 infill, 200C print temperature, 60mm/s travel speed, 40mm/s extrude speed (10mm/s extrude speed for first layer), and 1 normal skirt line. (It *might* have been printable faster, but I didn't want to chance ruining the print.) Keeping the print hollow avoids zits from having the nozzle jump around to add infill, and lets the waves be a bit more flexible: with the printed side facing inward, the final product is fairly comfortable.

[PRILINE Complexion TPU]: https://www.amazon.com/gp/product/B074DTRRXQ/

The final rendered STL for this is 50.8 MiB (which is mostly why I didn't ship it in my loadout repo). Rendering it took 6 hours, 47 minutes, 46 seconds on my fairly-beefy AMD FX-8350, probably because it performs sequential hull operations on spheres for *every point in each wave*. There are a *number* of ways this could be refactored for better performance (such as only calculating hulls for a *quarter-cycle* of the wave function, then reusing that form with transformation for each subsequent quarter-wave), but the *best* solution would involve simply extruding a circle along the path (which would also allow for asymmetric inner/outer contours, calculated for a half-cycle), which has been a [long-standing missing feature from OpenSCAD][openscad/openscad#114]: I *could* rewrite the SCAD to use [gringer's module][thing:186660], but, at this point, I already have the STL rendered and the model printed, so I don't particularly care to. (Should I ever need to *re-render* it, I probably would rewrite it, as doing so would probably take less time than waiting for the current implementation to finish rendering again.)

[openscad/openscad#114]: https://github.com/openscad/openscad/issues/114
[thing:186660]: https://www.thingiverse.com/thing:186660

## how that went

Tight, and scratchy to remove, but usable.

## Prusa era: CLASP and a new TPU

That TPU one eventually fell apart, so, as a "good enough" solution, I printed the "clasp" that prefigues the one I have now in clear PETG.

I printed it at 0.3mm, thinking it'd be stronger (since thicker layers are stronger, and there was no Z detail).

That fell apart (as did the round of replacements I printed), so I decided, next opportunity I got, I'd try going back to that previous flexible strap design.

I gave up on remaking the TPU one after I was trying to get it on in the Seahawks' last playoff game and it *pulled the spring bar out of its holes*. I realized that this kind of tension on that part was liable to damage the watch (not to mention making it difficult to figure out where the spring bars flew off to), so I decided to go back to my old safe clasp.

I ended up just printing the clasp again in black PETG somewhere aound that time (I think I printed it some time after October 2019 and switched back to it, though I might have printed it after giving up on the TPU, though I think I needed the black PETG strap in the interim). That held up, but it did feel kind of funky, and I ended up breaking it apart at the beginning of April 2020.

Once that happened, I decided to revisit the SCAD for real to see if I could address my biggest peeves with the original model:

- Narrower than the space allotted - I ended up hitting my wrist on something at the beginning of March and *the spring bar popped out*. Maybe that's just a side effect of whatever wear I introduced with the TPU experimentation, but a tighter hinge would address this.
- Loose latch: on my Replicator clone, this felt tight,

Ah geez, I'm just realizing now that *running the narrower clasp is probably what weakened my bar holes*. Geez!

## Clasp redesign

I reintroduced Stopka-style bar-access notches, made it as wide as my TPU band had been, tightened up the latch, and printed it at 0.15mm

## Planned next steps

I want to add holes to make this breathable, too.

I had previously thought about making a dual-extrusion yellow-and-black "striped" version, but I've pretty much decided to give up on yellow-and-back-dual-extrusion prints after determining just how much sheer material is required to truly transition to yellow (somewhere in the neighborhood of half a cubic centimeter, *per layer*.)
