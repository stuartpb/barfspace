# Old Qidi Tech I stuff

Remember when you bought that whole goofy Replicator 2X clone because you wanted to be able to print multiple materials? And then it turned out that dual extrusion is a massive headache to work with? And then you bought this MK3 because this seemed a lot more like how you were thinking you'd expect multi-material to work, and you were getting all these different kinds of material that you'd like to swap more readily between anyway,

## last known logs

(Ganked from [my old planfile][planfile postmortem]: I've generally stopped using the printer described here)

[planfile postmortem]: ydct3-s9y9z-8g8qr-rd0rt-wezm4

My Qidi Tech I has been shaking violently (or at least, violently enough to audibly rattle) on the X axis whenever it starts a new layer: I had been seeing X shifting in some of my prints, but had been attributing it to too-fast print speeds. After searching for [similar symptoms][] and finding people attribute this kind of shaking to faulty cables, I now think that this is probably being cause by some kind of brownout/undervolting in the supply of power (since it only happens for a few seconds after actuating the Z stepper).

[similar symptoms]: https://www.3dhubs.com/talk/thread/grinding-noise-qidi-tech

I tried reconfiguring the power hookup (so that it's only going through one power strip), but that didn't resolve the issue. I'm planning on emailing Qidi Tech support about this some time this week: all my other 3D printing projects are on hold until I can get this issue resolved.

## postmortem

I've heard this sounds like a Z screw issue?
