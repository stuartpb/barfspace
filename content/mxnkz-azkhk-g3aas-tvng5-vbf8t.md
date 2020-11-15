# chachacat

https://unusual.studio/projects/#6a20baf6-68ed-4c0a-9faf-96212bf9221b

some of the improvements I've been thinking for this:

- There's definitely use in keeping the hull, better than just tracking "space": you can also size items by *smallest hull able to fit within perimiter*.
- 3D hulling by farthest icon with current alpha value
  - hitting high-opacity material (ie. the "unmasked" area) settles all the lower layers until finding one that's already further out?
- "Compacting" this data
  - like, the idea I had was, your hull is defined by a level of *cumulative alpha*
    - I think this can be derived from the histogram data? Just multiply each
    - and of course you only have to go up... [255 + 128 + 255/3 + 64 + 51 + 255/6 + 255 / 7 + 32 + 255/9 + 26 + ]..
      - I guess that'd be the harmonic progression of 256, minus 256 really
      - (and maybe a few others that would hit 255? not sure how rounding'd go here)
      - Oh, right, remember, once you get to a steepness of 128, you just use the one-inset hull, the layer volume can only go "up" one more "layer"
      - I feel like I had a translation rule for centers-of-pixels-to-corners
      - So does this mean I developed a mini Minkowski hull algorithm without realizing it?
    - it's effectively the volume of a 3d object, I think
    - is it there's like a curved parabola intesecting the hull, that gets steeper at every level

## places I was thinking ChaChaCat could be useful

this needs to be worked into my other Better Icons notes, from my spec that I'm now thinking would apply for manifests

- a Better Icons implementation standard (icons are sized based on the 255-deep-hull)
  - Anyway, you'd then take this hull ("the hull of cumulative alpha that reaches a full opaque pixel's worth of ), and see how distant it is from a circle
    - it's important that we're treating opacity by the outermost hull
      - ie. a circular outline is the same as a solid circle
  - Past a certain uniform distance (or maybe overall opacity), you might want to apply a background shape for consistency
    - (ie. they used a rounded square and your app presents circles
  - Hell, it could be Half-Life 2, and its icon already looks like a weird droplet
  - And, you know, don't forget, this was also designed to find optical weighted centers + allow similar sizing of a design where you might have four-different-cornered shapes for icons, or arbitrary shapes altogether, and they're all sized within their container combatibly and comfortably
- there can be a rule of "Square maps with no alpha are treated as croppable to the UI shape unless explicit
- square maps are great for providing designs for different aesthetics
- You can always specify a specific map for each combination of theme/aesthetic and
- themes can work like fonts. Is this a new idea? There are "skeuomorphic", "flat"
- there's also drop-shadow, which I guess it makes sense for actually-rendered-a-3d-model-here-are-the-lighting-specs like Apple's old stuff
- I feel like this'd actually be better, in our coming world, by presenting a 3d model and a shader, actually
- and if you want to get clever, maybe airbrush in your own thing... you can provide a preferred pre-render, but if your model isn't available and able to handle some kind of 3d fill-in for the airbrushed element (you can maybe specify "use this for VR but don't try to rerender from it", or "render from this but it doesn't have a back so don't use it for VR")
- anyway, not providing the needed sources will cause your app's totem to be a 2D button or whatever the environment's icon notion is
- and it's fully permitted for a 3d environment to just not understand 3d stuff at all
- apps can have their preferred layout specified, and...
  - maybe we have a rule that the UA MUST prefer the specific-render version and not making their own render
- designers MUST NOT use the presence of a feature (ie. 3D rendering) to enforce an aesthetic difference

all this thinking about 3D icons would factor into the 3D Floating-Scrolls Tabs idea, asa browser/app thing.

Also, the UA should always allow the user to say "actually, I want to use the Tron theme for this one"

This really is starting to feel something like fonts - there are full on Presentation Forms (that anyone can make)

how does it work in xdg-desktop? Does one say "use the icon for this W3C concept" to specify fixed icons? Or do they specify a real image URL that's overridden?

but that's on the matter of icon-identifiers

Ooh, this makes a *lot* of sense for in-app UI, now that fonts can have

So yeah, maybe that's a form: you specify what character (or maybe three-or-four-character string - not sure how to define the glyph, see below) your app is, and what font you present it in

as I think about it, it might make sense to just be like "icons will flow however the UA wants" - does that mean icons could be wide, and that fits better in a "row" presentation (which would otherwise be also allowed through ChaChaCat's Hulling operation, which could be distanced from the desired bounding rect)

and fonts can have ZWJ sequences for whatever?

hmm, might want to be careful about emoji turning into a trademark infringement thing...

anyway, it's worth keeping in mind that the whole original idea around chachacat was to enable differently-shaped icons to be similarly-sized, not to collapse them into uneven containers. But whatever.

Ohh, I wonder if this came from the observation that "every brand wants the max amount of space available", and that's why Google was like "all icons should be deployed as masks now"

Oh, I guess that's another thing ChaChaCat can work at: making it so, if there is a smorgasboard of user-selected masks for icons (like, woo, here's an idea for the Windowsystem Metabrowser, say I want to )

Ooh, incorporating Apple's "mask icon" as another type of concept (and the app could choose to have its Mask as its main- I mean, GitHub does)

this'd also permit for "here's a specific mask to use for light colors" and "here's the style mask / color temperature or whatever we prefer for our icon"

Oh man, you could also allow for hue shifting / remapping as a user customization feature (this is starting to feel like Pull Tool)

this icon customization pipeline should also be available as a standalone util / lib (I mean, I guess ImageMagick is, but, y'know)

this also links out to MagickShop

Oh hey, this could use CSS filter/blend syntax

as could a tool like MagickShop

it could have successive iterations of changes

and is there a canvas-compatible imagemagick runtime? (is it WASM? does it have to be? is WebGL involved or optional?)

anyway, web apps could specify... maybe these kind of filter/composite options? that feels kind of like overkill, like that's between backend pipeline and frontend processing to figure out
