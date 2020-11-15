# bagtent mixed content thoughts

peeled off from [the original bagtent ramble][mound], some context may follow from there

[mound]: jgsdh-qj8br-mk8vj-z8xmy-xmhgs

### mixed data stuff

I recommend having a restriction against any two data types (content, authors, assets, etc) share a UUID if one isn't directly defined by the other (though things like a scheme where there's a subdirectory of assets as attachments to content, it's OK to structure those by UUID of the content they're attached to, as that's not a structure the way "an asset" is)

reminder to think about the scenario where Fountain is in here, too, for when Pitches and Scripts gets real

### more about the tags/assets

Here are some thoughts that were originally written around the quest for pruning non-Markdown content from the notes.stuartpb.com tree in the [Implementation Arc][impl] on removing the "tags/assets" for Lean Notes:

[impl]: 63p2w-vj7t2-baaa8-r76as-nntma

I've been thinking that the polish of these Tags are kind of a legacy from the "I'm gonna try this real plain as GitHub Pages" phase of Lean Notes, where I was still thinking it'd be a basis for a presentable-if-somewhat-under-construction packaging, like a book.

I'm realizing now that I need to prioritize re-drafting Lean Notes out of Trello over preserving the fun tag stuff, so I'm thinking I'm going to spin the asset tags out from this repo into a separate repo which can live under the Lean Notes org, and if the "proper package" project does ever re-emerge out of this incubator, it can figure out its own way to structure the content integrating the tags (probably the same, but with a "tags" folder with filenames instead of a generic asset tree with UUIDs, which *still* has a `tags/` level in the current hierarchy because I was *way* overdesigning the original concept).
