# revised NeckFX control block design

after a few months using the first-draft design I wrote about in [my original notes](5jptj-v5s87-0daze-ey3e7-2ajcm), I have some takeaways

## Review

Overall, the core concept of the design, a three-ply plastic block that pinches the pins of the buck converter against some cables and the ESP-01, is solid. Some of the stuff I'll describe below does run into intermittent issues that ought to be addressed in the next revision, but in general, not only was I able to verify that the implementation was feasible, I was able to pull off hours of field testing with this without any major incidents.

One of the first problems that emerged when first putting the block together was that merely shoving strands of bare wire into the battery block, ie. for the battery cable and WS2812 strip uncrimped power lines, didn't ensure reliable contact within the pinched area. I think I had to put copper tape on both sides of the channel to ensure a consistent connection to the chip's pins, and I also wrapped the bare wire into square "contact tabs" that were prone to getting pulled out (or falling out).

The other big concern that was addressed with an early intervention was making sure that the power buck doesn't crash into the ESP-01, since it does sit right on top of it in the jig, with no real structural reinforcement keeping it separated. My plan was to eventually address this with whatever "second layer" I'd develop to attach this module to the battery casing, but to keep the module functional while I gathered more experience with the characteristics of this design, I solved it just by wrapping the buck converter in a pinch of electrical tape.

The failure that prompted this revisiting of the design was the data connection I'd crimped to the center/green wire of the WS2812 bundle snapping, on account of having no jacketing on the wire beyond the end of the crimp. This was one of the main goals of this experiment: to gather data on how to handle the bundle of cables coming out for the main strip, and see if I could maybe come up with a design that didn't necessarily involve crimping anything.

I think I have that data now.

## Changes to the core for V2

Noticing how the ESP-01 has one pin grounded, then the data pin, then a pin pulled high right next to each other, was one of my earliest observations. I knew this could be used somehow to simply "tap" those pins for use powering the light strip, but I wasn't sure how I could work in the wires for that *and* keep the pins from getting obstructed.

Looking at the bare wires a little more, though, and thinking about the technique used for wire contact on the battery cases, I think I've come up with a solution: snaking the bare wires through the wall and then pulling them back out, crossing the pin - or even just something as simple as throwing them in the channel with notches you can hold pulled wire through, up near the chip, to make sure they cross the right pins.

(My original idea was going to involve two sets of "slots" in the channel, one at the base of the pins and one at the tips, so there wouldn't be the problem of a lot of little perforations in a row, but this should work the same way.)

The negative battery "cable" will be only slightly tweaked, in that the ground will now be inserted as a pin. There's enough space on the buck-converter end to make this perfectly acceptable: all it means is one more crimp.

Other than that, though, the design of the core has been successful enough to work unmodified for a second generation.

## The new "shell" piece

The central enhancement to this design, then, would be in the slide-on shell that would secure the WS2812 cable in the right position, and separate the ESP-01 from the buck converter, and attach the entire assembly to a battery case.

I've been thinking about this a little more, and I'm thinking it'll probably be at least two pieces: one to slide on from the short side to separate the ESP-01 and buck converter, and one to cover the other end of the control core (except the Vin pin and a hole/socket for Ground). I'm not sure which of these (if either) would feature the battery case clip; I'm also not 100% sure how to hold the WS2812 cable in place, or if either piece should cover the protruding part of the ESP-01 (and if that part should be the part clipping to the battery case, and how much the battery-case stuff should be involved in holding the WS2812 cable in place).
