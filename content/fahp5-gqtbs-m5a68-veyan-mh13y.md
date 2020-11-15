# Positioning Identifiers as Three-Space Coordinates

I guess this is really more of a "3D Index" - or, really, just a weird path /serialization model

Anyway, I guess the thing I was thinking was that it might be neat to have each axis be on a, like, one-byte X/Y/Z grid, and with some kind of simple

A thing I'm realizing with all of this is you really have to model all of these spatial systems by their objects' local origin, and decide how you're defining "origin", and how I'd recommend picking the center but, you know, you can have objects declare how they want to be "anchored", and/or you can make that mandatory for a certain class of object (like having all "character sprite images" be anchored from the bottom, I don't know)
