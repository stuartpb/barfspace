# At Least Three Ways To Do Anything in Three.js

Or Babylon, or ogl, or other 3D engines - the point of this was that a sufficiently-flexible engine will let you evaluate any number of tradeoff techniques.

A note I made was "If I ever start making content, a repo will probably be called for since it'll probably have a lot of code" - not sure about that, I'm starting to think that'd be better served by linking out to examples in the repos of their own projects (like the three.js example repo)

## Text rendering

This was one of the main reasons I wanted to start this repo, as there's:

- Creating bitmaps for the individual glyphs of a font and placing them like sprites via UV mapping
- Rendering the entire body of text out to a texture and presenting it on one quadrilateral
- Rendering the glyphs as polygons

OGL seems to have a good way to do this, albeit I'm not sure it has line-wrapping

## HUD Elements

I guess there's:

- Putting them over the Three.js canvas, which isn't compatible with VR
- Parenting a scene to the camera
