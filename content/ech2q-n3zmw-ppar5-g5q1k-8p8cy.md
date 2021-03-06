# HiveBug Face Thoughts

I feel like it should be possible to "repurpose" the HiveBug for so many applications...

My thinking here is that this should be only marginally more complex than arouter's default LEDs

So, like, a strip of WS2812s?

I was also thinking an ePaper display to, like, mark "this LED represents this service, etc"

So, like, it could have a simple "pwnagotchi" face

## Hardware interface

If this is on a Raspberry Pi, then you'd think you'd use the GPIO pins, yeah?

But the RPi is prolifically not big on driving WS2812s, and even Adafruit suggests having a separate controller board

So [you could drive them via a USB connection instead](9jfy6-qm0et-rza63-x73dd-b6b8r)

That'd also play nice with the "take it apart" model, where you can easily resuse components of the system

Would also make for a simpler device for sharing into a controlling pod

## Another thought

You could have the "worker drones" have a simpler face - even just like a seven-light Flower

I also like the idea of having a "Larson scanner" stripe running along the body

Oh man, you know what'd be perfect for a "bug"? Put a flower ring *above* the line. So, like, you can have the part of the light strip that runs above the ePaper display for the "status" lights, and then use two points on the sides of the ring as "eyes"

This would also allow for "Pie charts"

## More thought

Actually, what would be *really* cool would be if, like, the whole body is wrapped with LEDs positioned so that they form a hex grid (ie. each row is offset 50% from the last).

Or you could just have three rows like this

That would allow for multiple pie charts / flower-style spinners

Also permits "faces"

Also keeps with the "hive" thing, allows for multiple cool blinkenlights visualizations (like, imagine each light is a Pod)

## Possible layout?

What if it's a vertical slab, with the epaper at the bottom, and a face of lights above that?

And then maybe it's just a Honeycomb

## Buttons?

I feel like putting a physical UI on this starts to get too far into the weeds
