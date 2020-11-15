# Sensor augmentations

## Wind sensing

It'd be neat if, say, the fire-in-the-necklace simulation could react *to the ambient wind*.

Coincidentally, about a week before I had this thought, this appears on ResearchGate: https://www.researchgate.net/publication/328179359_Wearable_Anemometer_With_Multi-Sensing_of_Wind_Absolute_Orientation_Wind_Speed_Attitude_and_Heading

Is it possible to build this, and what kind of line would it need? (maybe pearls have an internal path to route extra-signalling lines through, or wire cord or hanging line or other stuff like that?)

A fucking *wild* idea: it might be possible to measure this by [reading the drawn current from the LEDs themselves](https://hackaday.com/2018/08/21/an-led-you-can-blow-out-with-no-added-sensor/) - though that might not hold when they're being driven by an onboard controller like this, and besides that we can't include circuitry (here) to read their draw individually.

## Light sensing

I was thinking it'd be cool to have an RGB light sensor that can make the necklace reflect ambient room light level
