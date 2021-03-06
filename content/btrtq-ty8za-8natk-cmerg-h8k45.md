# brainwave on bagtent URLs

split out from [possible alternatives to bagtent's UUIDs](c4g5h-7tqnh-8j8gd-eaqvs-sxh8j)

there's a known endpoint like `../lucky/search?h1=pitches+and`, and either you've got a server that implements it, or you've got a build system (or editor script/hook) that replaces it

I feel like it'd have to be like a shebang, because you'd need to be able to trace the edit you'd need to make to the page live to have a directive like `#!bubble?to=former-link-goes-here`

I think the thing is that there needs to be a separation from "a fixed link to create a new page" to "a one-time directive for how I want to rewrite this", and, like...

you know, I guess having "create a new page here later" as a link *does* kind of make sense...

but... nah, that should be an editor/buildsystem thing (ie. the buildsystem can actually reject these link directives unprocessed)

so if you're thinking of the page, and you know you want to bubble it by name, would you use...

ooh! you could do it as an action on the page, like `?bubble&id=` (which could also take `h1` or `link` or some other search parameter if the ID isn't fixed), where that'd invoke the "replace the link where I specified a query" interface

and then the standing-fixed-invocation interface can be the shebanged one (or, really, `#?`, so it just becomes "the live-version character")

really, I think these should be equivalent (operating on different vocabularies, so like `sprout` doesn't overwrite the link, because it specifies to add to a list, but `conjure` does), but pinging the server makes it happen by *performing the action and then opening an editor*, and the hash version does it by *readying the action in the client before performing*

actually, that sounds a lot like violating HTTP GET semantics, so maybe not

also, do hrefs starting with `?` apply to the page the way `#` does? I think so?

this can also be thought of as "commenting out the query" in CLI environments that process bare-query links

you can also have `?extract&section=rest&rehead` (or `split` or something, though I think that names hould be reserved for something else) to move the rest of the file (restructured) into a new page

so if I wanted to replace with a link to an existing page, I'd do something like `?search&h1=spiral+mountain&lucky` (or maybe just "lucky" is enough)

anyway note that this goes right back into the note I wrote before on maybe using special links

and referencing the live path is how you make a link "ephemeral"

it's probably not a terrible idea to have a generic `q` which means "search, prioritizing use of the text in headings and links"

you could also have `qq` (Quick Query) for "search like `q`, but accept partial matches for all terms"

in the vein of "leaving the link blank should prompt to rig" (the history of which is described [here](h3jma-ap4ef-01a3j-hfdjq-d31jq)), I originally wanted right-side-queries so I could search for a partial name, and then fill in the page name from the full result. However, what I get now is that I can do this by having the right-hand-side be an action like this if I want something like that.
