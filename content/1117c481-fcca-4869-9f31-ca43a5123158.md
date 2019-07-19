# Project Araminta

https://unusual.studio/projects/#b0328876-0695-4750-8948-3852b5511ae6

[Project Araminta][] is coming along: I've got a working stamp prototype fully fabricated and tested.

From here, the refinements would be around tooling - possibly some sort of frame to align the stamp precisely (maybe involving guides and knobs).

ughhhh son of a bitch I'm an idiot https://tubmanstamp.com/ - the sources were up at https://www.thingiverse.com/thing:2537926 like two weeks before I started. Oh well... at least my version has a lot more SCAD composability - and I can gauge my version of the stamp against the original now. (And incorporate it as an option

[Project Araminta]: https://github.com/stuartpb/project-araminta

Welp, it turns out the sources for the original stamp you were going for were online right about when you got started. Bummer.

## Stamp inking & guide structure

- [ ] Design a stamp pad to rest the stamp on when not in use.
  - [ ] Design a cutting jig for inking stamps.
  - [ ] Order a stamping sponge.
  - [ ] Order a stamping ink.
- [ ] Design a self-inking stamp with guide.
  - [ ] Complete the "A Spring Thing" quest to unlock filament springs.
  - Use a cube with feet enclosing the Treasury seal, a la tubmanstamp.com's design.
- [ ] Design a "clip" for raising twenties to be inked, one after another, in rapid succession.

## Upstream Compatibility

- [ ] Review this project's placement of Tubman's portrait relative to Jackson's against tubmanstamp.com's (theirs is probably better, we should try adopting it).
  - [ ] Import the svg of their negative, flip it, open the document that was used as a guide for all this that's still in the repo...
- [ ] Spec out the placement of the portrait relative to the Treasury seal (like they do), probably like in a SCAD like a prototype for a self-inking stamp.
- [ ] Review this project's balance settigns relative to tubmanstamp.com's.
- [ ] Spec the copperplate banner region to be a trapezoid, like the banner shape.
- [ ] Consider implementing a banner like the one in the upstream design.
  - (It looks like their text is harmlessly bigger, too: maybe a stamp design that puts it in the margin?)

## Content pipeline

- [ ] See if anybody's competently modeled dollar bills in SVG under Creative Commons yet.
- [ ] Rework the stamp mold to use a raster negative.

## Production

- [ ] Print the revised stamp mold using a .25mm nozzle and minimal layer heights (if raster).
