# bagtent and names

split off from [the original bagtent braindump][dump], some of this may make more sense in the context of content that came before it originally

[dump]: jgsdh-qj8br-mk8vj-z8xmy-xmhgs

this is a thought about "another type" of content that might live in bagtent: aliases, ie. filenames for files that don't normally have names.

I'm still not 100% on this idea - indeed, the "ambient aliases" of [footnames][] *themselves* seem like to much name-codification. The idea of this is that some pages will have *really clear* names, but as a note over on that page currently notes, introducing a hacky "alias" concept risks jeopardizing the core conceit of Barfspace (ie. the one that underlies the entire bagtent model): that no page should hold the canonical claim to a name, as a future instance may retake that name - and all references should work out which one they'd be better pointing to (and/or links should resolve the discrepancy).

[footnames]: 64wps-e4bbs-2k92x-60dc5-v1afd

## aliases and refs

there's also of course aliases (maybe that'd be the default namespace for non-numeric or prefixed lines - and aliases that are numbers get populated as default options, if they're within the range of the list)

part of me feels like aliases should be called refs, but, nah, refs are namespaced, aliases live in one namespace (though I guess that namespace allows directory separators)

since symlinks were grody but I don't like the idea of just using the ref style unbidden, what about storing filenames by UUID (or just UUIDs) in refs/aliases? maybe they should be full filenames like `content/whateveruuid.md`, so aliases can also refer to assets and things like that.

you can have a switch for sprout and bagtent-open or whatever that's "if the given name matches an alias, you can skip the prompt step because that alias is unambiguously what I meant"

anyway this would also work for other types of potential refs like `refs/bookmarks`, which might work like `heads` for choose-your-own-adventure traversals (where the bookmark is moving while the person reads), or for documentation explorations.

reminder that the preferred mechanism for building any kind of real structure in bagtent is a document of UUID links, even if it's not going to live in the repository proper. Like, I've thought about having a "scratchpad" which is just a bunch of unaffliated pages that link out to the repo being read, and that's how you can build, like, your own annotated copy, or own table of contents or quick-reference cheat sheet or whatever
