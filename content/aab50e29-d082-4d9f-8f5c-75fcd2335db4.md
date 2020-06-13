# OGEL

## The idea

For a snap-together part standard, the Lego model is actually not a bad basis. It has a metric measurement basis (With a little margin for material differences), and an established field of available generics. If you're shipping out a plastic assembly you want ordinary people to be able to mod, the truth is, LEGO are the interchangeable plastic construction parts they're most likely to already own (maybe followed by K'nex and Tinkertoys).

You even see LEGO-compatible parts in stuff like the Juku kits.

The thing is, it's not an open standard. (Neither is the Juku port design, from what I can tell, but that's a side project for another time.)

## The aspects

- A refactoring of LEGO.scad into a tree of modules.
- A specification for canonical logical part names in a hierarchy (under v0-alphaX or whatever, for the drafting phase)
- a system that pre-caches models rendered under those names
- a system for bundling those parts in to a BOM / adding components into your own models
  - you could even have "order these parts from Lego"
- a mapping from LEGO's part numbers to their logical OGEL names
  - Same goes for Mega Bloks and whoever else
- Specs for alternate measurement factors
  - like Duplo or those little micro-blocks you get at the drug store counter
  - you could even have new variants that work on straight-millimeter scales, allowing them to interface with conventional metric pieces
  - and others based on existing component sizes:
    - another spec that mirrors the gauge of 2.54mm headers
    - audio equipment could maybe use one based on 3.5mm
    - some real interesting stuff  at USB port scales
- Another spec layer for "material adjustments"
  - like, making the tweak to the "official OGEL spec" that makes fused-filament 3D printed parts match LEGO's adjustments-for-fit
  - And aren't there tight-vs-loose parts? How are those defined?

## On the long tail of LEGO pieces

Of course, LEGO makes lots of one-off, licensed

So you probably want some way to specify LEGO part names explicitly
