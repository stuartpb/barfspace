# Big Bagtent Red-String-Board View

This is an idea I've had

It kind of overlaps in a few ways with the ["2D BBS"][Squorum] system idea I've had, and a few iterations of Boxesin and maybe Acebins (which ties into the Metasystem Windowbrowser and Pipeline Plotter)

[Squorum]: g3018-t2t29-4p91w-34nep-jb4ap

I feel like this is kind of the ultimate nexus for that Acebins-side class of concept: "Red String Rooms". Like, I should consider it, scalability-wise, as capable of expressing, as well as a fairly complex function, a static graph of the magnitude of these notes...

and it should be possible to use in 3D. (I've written about [3D Floating view in Bagtent](145g4-r763p-8d80c-fth7d-84aet))

And I'm also realizing this reminds me of SunVox, and the 3D concept reminds me of Soundspace

## Core concept

And this is part of where this overlaps with Windowsystem Metabrowser

These coordinates should be thought of in "views"

It might make sense to allow for multiple instances of one document? this version I'm describing is more catered around not having that, though.

I do think it'd be cool to have this, and then you can have the same doc in two places a a sort of "portal" between the two contexts that link into it so much

## Thought on this as a Bagtent thing

though it also applies in Acebins world

Sometimes I want to visually "Embed" a page in another page - what I'm thinking would be cool for the Bagtent thing is if you can somehow insert a floating element right where the document gets inserted, and it can actually *affect the flow of the surrounding document*.

hmm, what about, like, attaching to the edge of a document, so when the text content changes and the positioning gets recalculated, your page moves too?

oh, right, the idea is that you define a viewport for your page, so if a doc got longer it'd just shrink, I guess?

or maybe the text isn't even really in the box, like my imageboard-inspired original idea

And you could also include metadata before SVGs and other such assets I guess?

## okay so

I'm starting to think this is really feasible as a sort of "bagtent BBS", where "new posts" can be displayed as toggleable layers for each changeset that introduces files and where it puts them (which can default to a calcluation based on graph springs and all that, whatever - maybe the author suggests and the tool considers recalibrating on the user's suggestion)

another key point I was trying to make about how the model works is that positions should be something where I can say "move all the files relevant to Z into this cloud here (I mean, I actually define the points, "this cloud here" would come from a higher layer, same goes for "relevant to Z"), and it won't affect the unrelated files, and I can return them to their spots when they're done

Oh, and more importantly, the transforms should be nestable, y'know. So I can put all of the October posts in a little box

but so anyway, like, I think, while there maybe should be a "default location in default context" metadata field, there should maybe be a "suggested alternative locations" or "transform sets that include specifications for this" or, I don't know

really, I guess I just think... okay, so, like, I think the metadata should usually be specified outside the files, and can maybe be baked in if you're looking to build some kind of base distribution

oh, right, so like you can have "translate this far from the position this layer put it at" okay I get it

## dawning realization

wait a second, isn't this just a scenegraph? am I building a scenegraph for the filesystem?

hmm, the only thing missing from this is a real 3D metaphor of a window / directory, and then it'd be just like my "desktop for everything" concept

also, this might be a lot like PureData, if what I saw from SunVox is any indication?

but like, in the [Binder](9vzhy-yr8cb-6v87n-wp4b8-m7v0v) model, "RedString deepzoomer" would be just another (in the X sense) client / driver

I'm starting to actually wonder if I shouldn't look into seeing if there's a good standard in the UI stuff for Hypnospace Outlaw's HypnOS

## kinda blip idea

what if you applied visual styles in this by kubernetes selectors against the YAML metadata

## food for thought: BISNES

I'm thinking now that RedString could actually be prototyped under BISNES. You could have a model for a series of defintions of docs that form "this board", and then the Markdown

## Frontmatter

you could even bake it into the docs themselves, if you're building a system where you're primarily modeling documents in a 2D space - like, if you really want "canonical positions", frontmatter is the place to put them.

To overlap this with the idea for Squorum, and what Dr. Cole was desiring: maybe the option is like "What do you present here", and if it's "thumbnail" it'll render the document within the bounds, and the alternative is like "cover" and it's an SVG document, or HTML? specifying an image/icon to present instead

yeah, by presenting the thing as an SVG definition, we can theme them via CSS, and put IDs on the SVG doc so it can be updated (or just derive it from the metadata and a template, w/e)

ohh, maybe yeah, is there an easy Eleventy way to say "apply this template for this document's metadata"?

hmm, food for thought. also this feels a lot like something d3 could eat for breakfast

isn't this starting to overlap with the scenegraph for video rendering I was describing earlier?

## interesting thought

For rendering the Markdown: this could be done through the document model from remark's whole party, rather than ever touching HTML rendering. That's probably not simpler, but it might be more performant and predictable / reliable
