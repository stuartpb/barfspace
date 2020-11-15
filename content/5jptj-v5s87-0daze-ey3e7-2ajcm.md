# notes for the original NeckFX control block

earlier rough thoughts [here](nj9he-4wtvw-wr8qk-8h3dx-x774s)

I've devised this sweet jig for my ESP-12, and I'm wondering if I can't use this same trick with long pins and casings / crimped sockets

...oh and I'm thinking and looking right now and realizing I'm probably going to have the long pins protruding from alternate sides to be able to do this as a jig...
and that I think I'd have to separate pins in a housing for this (ie. if crimed to DuPont female contacts) with, like, a single interweave of electrical tape.

This pin-holding design does sort of obviate the "how do you avoid the pin coming out with the housing" problem, possibly, I'd have to see use in action.

But yeah, I could use this kind of long-pin-crimped-to-female-housing assembly for pieces of a housing that connects the chips to each other via bus, and puts out pins to connect to the LED wire

And there's either a (possibly clipped-together) case/shell structure that'll allow the regulator pins to tie via bus easily to the ESP8266 pins.

Remember, you've got space along the battery

So this'd use socket-pins connected to the regulator to provide pins to the battery, and would clip together in whatever fashion so that the middle pin would only be exposed to create a bus to the jig for the ESP (either some assembly with a pinch-jig, or more long-pin-crimps), which is used to connect

one thing I'm thinking is that it isn't really feasible to implement a housing for the connector pins (ie. the ones that are crimped) underneath the threading holes for the pins, so they'd probably be clipping into some kind of larger apparatus (which may itself be clipped together) that forms a housing

One idea I had was to use a LEGO interface to attach to these cases: I think clipping-on is going to be fine

I'm realizing that I could probably build a pretty good vertical housing along the battery case (for a cap / electronics casing) by positioning the print so the Z axis runs along the battery: this would also produce nice "housings" for at least the buck converter's pins - the pins for the LED outputs that run from that bus across the battery...

I guess can slide in, since we're sliding in the housing that holds the pin assembly? there can be a little bit of clasp around

so they're kind of treated like a "big, wide pin"

and the ESP-01, since that's what I've got working now, will slot in alongside the housing for its pins (which will form the missing side for the "stalls" described below, which will be printed with Z crossing the short side of the top of the battery casing)

Okay, so, the structure I'm thinking for DuPont housings, if I can print 'em (this might need a smaller nozzle), would be basically a "stall"-like row, like a shell with the tabs-side cut off entirely.

this is how the pins are accessed for busing: you put copper tape on the outside of the pins than need to be tied together

and that tape continues out the piece to the other end of the line - even for Ground, this works (the key thing is that the pin for Vout is not crimped, only secured for bus, as the Vout for the pin)

Okay so I think this can work, the electronics assembly being two pieces - the one that positions the long pins for the ESP-01's sockets also being the one to cover up, via an adjutting wall printed alongside the stalls, the bus contacts - this may be in the form of the bus lines forming some kind of "chip" slot, that takes power on one side and ground on the other (and some adjutment to prevent them getting mixed up and shorting the system or whatever bad juju happens when you mix the lines), and runs it down to the ESP-01 pins with that one whole side being high, and the high line carrying over to GPIO0 (and maybe the TX/RX pins, I ought to check).

So yeah, I think I'll make that connector work something like that, where the power lines "slide on" with the chip
