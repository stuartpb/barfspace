# Thoughts on NeckFX Beads

So, one of the things I'd like to have in this design is functionality so that every bead can be removed without having to resolder/rewire anything.

Each pearl can contain a 2020-form-factor WS2812

My thinking now is that each "bead" assembly will actually contain two half-beads.

Now, the *simplest* way would be to have each "bead" be a half-sphere, with each soldered piece containing a front half and a back half. That might be the direction initial development will work with.

However, the *fun* stuff would be to have each bead-assembly be most of a hollow bead with the LED sitting on an outer shell (forming two-thirds of the "bead"), and all the bare wires running through an inner ball to the next "bead". This would hide the wires, which seems like a good enough idea to solve one of the things I've been worried about: causing a short by having the bare wires twist. (They could also be insulated, but who wants that hassle?)

My new thought is to continue with the "front half / back half" idea, like clasping Lego hands: a "disc" that's like a C, wired to a "clasp" that contains all the wiring to contact the next piece.

Anyway, the question of how to do the connection solderlessly remains. My idea is to solder each terminal to a wire with a 1mm stainless-steel bearing on the other end.

## connectors

Thoughts re: [electrical connectors](https://en.wikipedia.org/wiki/Electrical_connector) that'd be easy to use in a bead orientation

### 3.5mm jacks

The thing is, these'd be like 30 cents a piece each side, and that bumps the total bead material cost to like two-thirds of a dollar, *the bulk being jacks*

but if I did go that way, considering my analysis of how the jacks would have to be mounted...

I should consider having the male end be an internal component, like you insert the socket onto it and the male jack works like a pin in a port

this is starting to feel like a "why not just use pins for real" point, though

### using actual pre-attached pins

...is it possible to get WS2812s with actual pins soldered? I mean, criminy, you really just need to solder a pin+socket assembly to the edges for the power lines, and then a face-down pin for data-out and a face-up socket for data-in

### okay, maybe a little soldering

... or you just put sockets on both ends, and then anything can be wired up however. in fact, the power lines can just be an adequately-tight socket, like a breadboard line in thightness, mid-way like an hourglass

...damn I think this is what I was thinking when I was thinking "solder a crimping bead"

### doubling up on LEDS per bead

one thought I had is that you can probably back-to-back this assembly with two LEDs facing in either direction? they might not be able to share the right vertical space to share data-in (even if only one side needs data-out)

if you flip-flopped it so both LEDs are independently addressable, though... (that'd also make fluid simulations smoother)

my whole thing with this has been about making the LEDs all face "outward"...

what about soldering a bunch of these together in a 3D orientation where they share corners across a diagonal or something?

### "through-hole sockets"?

okay I KNOW through-hole sockets area thing because, like, IIRC the Prusa's motherboard uses them

### thoughts on inter-bead connection for data lines

(assuming that power is solved through soldering a through-hole-socket that you can just cleanly wire through or something like that where we don't have to care about it as part of the non-parallelizable data connection design)

so your data connections have to be made with little wires (just to give flex) between beads, but the core lines would be like a millimeter apart, and power could be threaded straight through (the beads maybe giving some cover to the inter-bead space for shielding)

### solderable interconnectable pieces

is there any kind of pin-head-socket out there for chaining joints like this? (to replace the inter-bead wire)

here's where we get into the "solder a 1mm bearing" plans, but how do we make that

### magnets and springs

ooh, fun idea from looking at https://en.wikipedia.org/wiki/Pogo_pin: magnets and springs? nah, that sounds like a recipe for caught-hair nightmares

what if the spring wasn't compressable to that degree? eh, you'd still have pinch points in the plastic, unless you want/like exposed springs

### magnets and springs *and* ball sockets?

can you have a spring magnetically attach to a ball with a reliable data connection? ie I'm thinking the spring is soldered, and the ball is magnetized (because if the spring was pulling the ball toward it, in this probably-confused mental model I have, the spring introduces more potential-pinch-point tension)

trying to think of stuff that doesn't take much material but, like the little-pieces-of-wire-in-crimping-sockets, can provide the structure required to maintain the connection on its own

## Possible "easy mode" implementation

I'm thinking about just getting a bare WS2812 strip and building some pearl enclosures to snap onto that - maybe getting another 60/M strip and cutting it in half (there is already a solder join there on the one that I have here).

Sure, it has a lot more material blocking the space between the LEDs (which is kind of a mixed blessing - if you want less bleed between the sides, this'll do it), but it facilitates material experimentation (ie. how much plastic to put where, how much is diffusing and how much is dimming, how crucial placement of the component is relative to these factors), as well as being a good-enough wearable prototype for experimenting with the lighting designs in public

This is the direction I'm going for my current prototype - I can try this more elaborate stuff at some point in the future.
