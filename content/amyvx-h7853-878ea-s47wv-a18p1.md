# Pipeline Function Maker Thing

This page documents a commonality between a few different project ideas I've had:

- [magickshop](eqwj9-t864t-jta25-3deyj-1xvq3)
- [acebins](47fbb-38jaq-rgax3-sy87n-0vemw)

## namestorming

Seeing the "interaction model" below, I'm thinking this does remind me of Wizards

Maybe it's, like, Wizard Tube? Wizard's Pipe?

## thought for the Oozy Sewer

This page is why fully-random IDs are important to this model, ie. why ulid's date-based ID wouldn't be appropriate. Each of those subpages is newer, but refers to an *older* idea, with content referring to projects older than any of these pages.

Giving them a natural order by creation time would just make things more confusing.

## High concept

this is an idea for a "pipeline editor" (where the "pipeline" might just get thrown away after the edit)

Basically, think like Blockly, but actually useful.

You'd have all your inputs represented as Blocks, and they could even have TypeScript-style Types. (And we could use those for inferring auto-connection)

But yeah, one of the core ideas is that this should be as simple as JSFiddle or Codepen (which this should also be able to supersede)

## example 1 (MagickShop)

So, like, say I want to build a function that I can transform a bunch of images with, that takes an input image file, runs a GraphicsMagic conversion on it, then puts it into a ZIP file which is then downloaded once everything is ready.

I'd have a block for "File input" (which produces, like, let's say "filename", "additional metadata", and "content blob") - I then pipe the content blob into the MagickShop transformy bit, then, like, maybe I pipe that into a "Promise.all" collector (if that's a construct that'd make sense for batching?), and then that produces an Array that I hand to a JSZip block, which I pipe to a Download block?

## example 2 (Acebins)

two big text fields, one I just use as a String input and one I use as a YAML source for replacements

so I pipe one in as a String and the other one I have as a YAML Map

## other block types

I was thinking you could even have the backend be a Kubernetes task?

I might have even been thinking of turning a Function into a Kubernetes image, or having it smoehow interface with Helm? There are some notes about building Helm charts [here](k7j86-ye9bv-cbad4-fj5mb-90ty1)

This could also interface (through some system - might have to live under the Kubernetes-Pod-Definition implementation) with [Module Tree](237wy-vyzdz-w39y5-va8ej-3r5g6)

This thought of "it's up to the implementation, but the root for this would be JS" overlaps with a thought I'm splitting off from [fileify for Bagtent](2e4eq-penrp-vqats-3vtn2-q5mc3)

## Interaction model

You'd have a block type that's "Stop here and prompt the user for a new input", like "make them fill out a form" or "have them upload a file"

This might have been where the Helm thing came in? A Function can produce the YAML or whatever object for a Helm chart, so you might use this to servw as the "setup wizard" ("Upload your branding logo now", stuff like that)

But you could also have, like, "pick one of these images"
