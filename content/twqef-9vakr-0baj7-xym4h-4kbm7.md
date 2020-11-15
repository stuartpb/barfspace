# PocketC.H.I.P., but it's new

So what I'm thinking is a board that'd have the screen, keyboard, all that PocketC.H.I.P. stuff, but for a Raspberry Pi.

Though, I started also thinking, what about a modular device, so you could start dropping in features that I've been daydreaming more easily, like built-in earbuds, or the gyro and wireless stuff for a [works-as-a-remote stylus](cebrr-y9q9k-p2aqg-4gwsj-vhr8v)?

and now I'm like "wait isn't that just the ClockworkPi Gameshell"

but so, the big thing here would be do-it-yuorselfability, and cost. we'd want this to be ultimately at the same price point as the PocketC.H.I.P.

so like, the main thing I was thinking HATs would be useful for would be adding USB ports (accepting power delivery!) to the Raspberry Pi Zero (W), which is currently USB-Micro-only

So yeah, in this, the thing I was thinking could be a neat adaptation to the different design of the RPi would be adding another set of GPIO breakouts or two as a common bus for HATS like they're the PCI cards of the Pi

That'd also, like, let you plug in your RPi0 in the middle, and your USB-C-hub-and-battery-charger HAT (or component-video breakout or exact-clone-of-the-top-of-the-CHIP-HAT) at the top

Not sure if that'd be prohibitive anywhere other than behind the screen...

But actually, I think you could do 4 Raspberry Pi headers here: arrange them like `|=|`

that woul even let you have USB-C Hub HAT on the left, Speaker HAT on the right, the Pi on the bottom, and CHIP Interface Hat at the top

You could even have 2 Innie, 2 Outie as the default stock configuration - or just the bottom one is opposite all the others? so you could stack one next to the next. eh idk

Also, don't forget the idea of letting all of this be pogo pinned in place! Save the vertical space needed for pins, let the user not have to do so much soldering. (this'd especially be the case for the TinyPi-Clone-Thing HAT)

At this point, though... could

## naming ideas

Heh, you could call it the HATRack or HATCHIP

## shitpost re: naming ideas

all they know is be embeddable, eat hat chip and lie

## ultimate goal recap

But yeah: what if this (or a configuration of this, like the Raspberry Pi Zero WH) is just a collection of surface-soldered pogo pins that breakout the RPi header into a stack (and it's a continuous pattern that alternates which side the pogos point out of from the board)

I also had this idea for having the top row, like the PocketC.H.I.P., but it's the WiringPi GPIO pins. One idea would be to keep that at all the edges: another idea I'm thinking, though,

It's important to remember that the pogo pins can't cover everything

Hmm, what if you just stacked "pogo headers" that are just pogo pins

Oh shit, since all this is is just a bus, you could basically make this out of a bunch of these pogo pins and conductive thread- or, really, bare wire

ah, there;s how you can 3D print a circuit: include trenches for

So maybe that's the base of the kit: a chip with the right set of breakouts to make all the included pieces fit correctly and nicely, enough to fit either a Zero or a full-size Pi(?)

This way, you can make the speaker optional, yet not as awkward to source and add as it was with the PocketC.H.I.P.

So your (oversized) HATs would be:

- Screen HAT
- Keyboard HAT
- Whatever Top Interface You Think Would Be Appropriate HAT
- Battery/Power HAT
  - maybe merge this with aforementioned HAT?
  - so there's "Top Interface
- (optional) Speaker HAT
  - This might just connect to lines provided by the Everything The (Pocket)C.H.I.P. Had That The Pi Doesn't HAT
  - What about the HAT Bus?
  - Hmm, maybe you can split traces to disconnect
  - Or instead of "split traces", we're just weaving on a 3D-printed piece (or even an injection-molded weaving grid!), and we can just not weave those connections
  - Oh crap, this is the ultimate realization of the end goal of that "3D Printable Circuits" quest
  - You can make a "breadboard" that's wafer thin and the lines go wherever you want
  - Oh my god it's like Shenzhen I/O
  - Anyway, the thing is, it'd all have to fit within 2.54 mm...
  - nah I feel like this is workable

  okay, so the price:

  - for the screen, let's say it's $15 for the end user to source.
    - that's for raw screens, though - the assembly for a comparable screen for the Pi costs [$35 from Adafruit](https://www.adafruit.com/product/1601)
      - that's Adafruit, though, all their stuff is marked up like twice what it needs to be
      - as components, they sell the controller (the [STMPE610](https://www.adafruit.com/product/1571)) for $10
      - the screen (the ILI9341) is on amazon for [about $15](https://www.amazon.com/HiLetgo-240X320-Resolution-Display-ILI9341/dp/B073R7BH1B)
  - if the pi zero costs $15, that gives us $20 remaining for the other components
  - don't forget that the battery itself also costs a fair portion of money
  - a 3.75v LiPo like what's in the chip costs $10 to source on Amazon

you could have the screen controller be part of the power / other stuff module, really, and have the raw screen come into it
