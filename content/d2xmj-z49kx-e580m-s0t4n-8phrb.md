# Very Wide Mountable Address Space Memory Inspector

You know what would be nice? If most hex editors let you just easily define a format to visualize the bytes you're seeing in.

Like, instead of resizing based on your window, you mount it to an address space that's X by Y in a section of an impossibly-large address space, and then you can manipulate *everything* from a view based on that. (though you can set, you know, column width for striation - mapping the 1D addresses to 2D is a complex thing that's a concern of whatever visualization layer is interpreting the bytes, as outlined in Dataturf iirc)

And you could even have "all the RAM of my currently running system" as a microscopic region

or "a million digits of pi" - you can render those on demand via a spigot function

## thinking on the model a tic

okay, so there's two layers - "mounts", which map data into 2D addresses (or rows of 1D addresses if that's less distressing to think about) - and "visualizations", which translate 2D data regions (not necessarily 1:1 with a mount!) into higher-level constructs

visualizations can be layered, and some have a complicated relationship with how they map data visually

you know, a mount can also happen within the 1d address space, tbh

## intersection with something deep

Oh man, I'm realizing this is starting to resemble one of my *old* old ideas, which I can't even remember the name I thought would be good for. It's probably in my OneNote notebooks.

It was back when I was using OneNote and I felt the ability to lay notes out in 2D was paramount

it was something like "bigfile" or "flatfile"

that's right: vastfile

unsurprisingly this idea of "What if all the data on one page" has also resurfaced for me as [Red String Room](rgvet-f9pds-01985-jef45-ywyew)

## another arbitrary-data-visualization thing

note that some inbound links are thinking about some thoughts I originally had and described as [Casettic](v54am-trnme-0yak2-dbnsk-dhvmz)

that evolved into an idea for 2D complexity, mutating into [Dataturf](g0q2b-3wp8z-c6avy-yy5jb-6fx07)

This original set of ideas is actually I think what I was thinking about around [the PICO-8 Great Tape](092wz-g3nh1-nj864-w01qe-9h0zd)

what stayed on this page become more interested in the "practical tool" side of this idea

## now THAT'S what I'm talking about

http://kaitai.io/

## some hex editors

just making a note here that http://www.binvis.io/ is pretty good - [this Reddit thread](https://www.reddit.com/r/ReverseEngineering/comments/2xtyw8/binvisio_visual_analysis_of_binary_files/) about [its announcement](https://corte.si/posts/binvis/announce/index.html) has some other good pointers

it also links to https://reverseengineering.stackexchange.com/questions/6003/visualizing-elf-binaries which supplements it even more

- [Senseye](https://github.com/letoram/senseye/wiki) has the modularization thing down pat (though it doesn't present the different visualizations in a unified decomposition of the input data, which was part of my original draft idea thing)
- [capstone](http://alexaltea.github.io/capstone.js/) converts machine code to assembly, for the disassembler interpretation
- [veles](https://github.com/codilime/veles) and its predecessor binglide have some real cool examples of 3D visualization of entropy et al

a thought: can entropy be used to find the "native width" of unknown data?

## old quest content about hex editing interface

(this was originally a Quest, pardon the weird structure)

- [ ] Spec a JSON schema for Bytewise Abstract Sequence Trees (BAST).
  - [ ] Maybe look at Wireshark's structure for Dissectors.
  - [ ] Look at how minified JS / WASM do source maps for at least a few common parameter names/types.
- [ ] See what widgets there are out there for hex selection.
- [ ] Model the UI.
  - [ ] There should be N user-configurable panes, which can nest in tree structures if relevant, that are meant to display a cursor on the same data. Maybe there can be another interface for cursors.
  - [ ] for instance, "Bitmap View" (or "Indexed Bitmap View"), including by partial bytes (including single bits, if desired) would show all the bytes (given a certain alignment)
  - [ ] All UIs need to be ready to display and highlight any subsequence,
    - [ ] Specified in spans into the bits (but only by specifying eighths of a byte)
    - [ ] Must be able to illustrate selected / hovered spans
    - [ ] Cursor position (in terms of its own UI to sequences/positions, and in terms of visualizing a moving cursor position)
    - [ ] Things that lie on clean boundaries should be distinguished from the opposite
  - [ ] Views may be given invalid data: they need to figure out a way to visualize that as close to intelligibly as possible
