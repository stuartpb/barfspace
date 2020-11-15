# Slicing in the Browser

part of / adjacent to [printacle](v62a9-2ccas-m5a21-pppj8-966e8)

Was thinking of looking into how tricky Slic3r would be to port to JS, or at least WASM

but yeah, I've thought about building a new modular slicer

## things you could add with a modular slicer

- [bucket purging](bvdq1-n108c-wf87g-rky29-7w5ky) as an alternative to a purge-tower plugin

## another extensibility thought

Can you make your model so flexible that you can have many different kinds of input, maybe even inputs that you could mix and match? Like, I could use an SVG slicer to trace paths (or a text-plotting routine to generate calligraphy paths for the SVG slicer, or even 3D pressure paths), and the SVG linear plotting could be passed to the printhead-moving thing (and could also be handed off to SLA slicing, even though that'd basically just be the image mask)

Hey, is printer-gcode-setting-bundling-in-3mf a thing yet? Because that's something I'm thinking about here: having all the material attributes and stuff that a slicer can derive from / cue off of (like, I don't know, it takes one path if it's a modifier and another if it's a static value, or those are two different kinds of element/attribute that can apply, maybe within certain kinds of blocks, at different levels of the tree)

## XML blip thought

feel free to cart this off wherever it'd be more appropriate:

it's funny how XML mirrors the bureaucracy of RFCs and legal documents: "this document hereby abides by the treaties to the divisions of the global namespace as settled by the W3C Accords of 2001: this addendum is hereby ratified 2005 by the SVG Working Group", you know, like that

and how, the more you work with this stuff, the more you realize that's the right thing to do, cf. [Deno](https://deno.land/) using remote fixed URLs with lock files
