# Searching Using Incomplete Link Structures

I think I wanted to be able to search "Link names" as a class to find pages (so I wouldn't get results from body content), and I wanted to make it possible to not search "link text" for when the text of the link had nothing to do with the page's "name", and unifying link searches to "lines specifying link targets" seemed like a solid way to enforce that.

In practice, this never really ended up being an issue: if you grep for text in square braces, you'll pretty much get what you're looking for. (And you can make it "only check inline with parentheses and start of lines followed by colons" if you really want to force that search - bottom line, it turns out inline links are the right form factor 99% of the time.)

Anyway, most of the time I've ended up being able to find a page by its first-level heading, so "search outbound links" was kind of a gratuitous concern. (Though it might not be in other Bagtent applications! But the headaches I ran into trying to use them would still be likely, enough to not make that a commonly-prioritized Bagtent pattern.)

Yeah, and, now that I think about it, the name used for a link can be as much chosen for "syntactic" reasons, and meaningless, as the name on the left side of the pair, so really, you just need to search any text in brackets!

Anyway, the point is, you don't generally need a "let me write the link I want in the text here" format

And, you know what, if you do, you can [embed it as some kind of query string](btrtq-ty8za-8natk-cmerg-h8k45)

Typing all this out caused me to [completely rethink the bagtent-rig model](j18x2-56k4r-wraa7-f4xvy-e57gg)

Writing that out is what help me understand how I'd been cargo-cult-imitating what I thought content inserted by tooling would look like.

[Inline Rock](t2m2g-73fjy-r58h9-406ky-mz9re) collects and documents the signs of the shifting attitude toward inlining links that isn't incompatible with this "incomplete links" design
