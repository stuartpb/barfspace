# vr touch-focal peripheral idea

What if it's just a giant touchpad, like the size of a tablet?

great for maps: you can expand the map to be fifty feet wide, you just can only interact with it touch-wise (without hand trackers)

shit, this could rock for teleportation

I mean, you can kind of interface this with Knuckles, but

hmm, a stylus would only need an IMU, wouldn't it, you could get Lighthouse data from the tablet surface, though I guess Logitech's thing makes sense for in-air UI

I mean, really, if I'm not mistaken, you can image the stylus effectively enough knowing its angle / distance data from the tablet

shit, can an ESP8266 or ESP32 interface with Lighthouse tracking?

anyway, the idea is that this could be useful for, you know, Swype-style typing, or Dasher-style even

idea on a [3D Dasher-like text entry interface](aw0gf-c2sw2-6cagf-1r4jj-hhbgs) given its own page

## how is this not a Vive wand

The key difference with this is that it's built for expecting the user can really tell where their hand is through whatever magic we have - we can probably get away with a gross point-cloud-mesh-thing if it just needs to be rendered into the headset (and, of course, if it's an AR display using photo control already, we're really just augmenting our ability to make an overlay from a piece of cardboard).

(idea on how this could translate into a "deck" "bookmarking" system are [here](145g4-r763p-8d80c-fth7d-84aet))

Actually, thinking back, I was thinking Vive wands displayed conductive finger signals way farther out than they did. So I guess that might be the thing: this'd try to model the hand based on conductive pattern? Is that possible? I'd guess that you could use high-res data to get a profile like a Pin Art or Kinect LIDAR deal, but idk

## anyway

the reason this'd be a full tracking pressure-sensitive pad (ie. something more than what you could do for hands in AR) is so you could draw in multiple places in 3D, with full artistic detail instead of the awkwardness of, say, Tilt Brush.

or, rather, like I said, it was as a peripheral to make text entry simpler in VR
