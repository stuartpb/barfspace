# Redirect Stubs / other Bagtent Stumps

So, a thing I've wanted with these notes is to have all of them be accessible in the

but I've also thought it should be possible to "gravestone" a node

So you could have this managed at some level by a daemon that collects Gravestones and puts them in a managed Table of Contents

## topics this touches / resolves

How pages should merge etc. is a question that's floated around this data since the Unusual Studio Project days (which, it's worth noting, has still not actually been merged into this notestack)

## Quick side thought on unusual.studio

(make sure this is already recorded - I feel like I wrote it down smoewhere in my latest thoughts on Unusual Studio?)

- It's fine to make the project definitions for Unusual Studio come from my notestack if my noes are just modeled as one "card source", of many
- In fact, damn, what if that's how this works: the notestack is crawled (by a job that runs on a webhook when the site is updated) for sections that match the "Unusual Studio Project"
  - and then that's how the ID would be, the project is modeled by its canonical data source's URL
    - ie. "notes.stuartpb.com/`$uuid`/"
      - which I'm now deciding will be the next rendered generation's path format, fuck it
      - will probably have some model of defining extensions underneath this
      - will probably have a redirect rule for the raw "name.format"
        - and a redirect rule for dropping the "/content/" layer
          - maybe this should be an "api" layer thing?
          - like, "content" is a namespace, and other directories with other formats (ie. a chart repo, for example) might be hosted under a whole different deployment strategy (ie. pushing to a repo), or at least a different image format (ie. an IPNS update)?
            - this is starting to get into ArgoCD territory I think
              - would want to figure out what scope this shares there
    - I'm also realizing now that a thing Eleventy gets deadass wrong,
      - and yeah, you can and should have files-with-the-same-base-name-and-different-extension be interchangeable with "index.`$extension`"
        - THOUGHT FOR THE SEMANTIC MARKDOWN OOZY SEWER:
          - note how "backtick code block for symbol insertion" can be a very natural pattern in Markdown
            - Can your data use that? Think hyperhtml expressions, or other simple model mappings.
            - On that note, this isn't a bad idea as a format for defining "extensions"
- Also, did I have a thing in the Semantic Markdown orbit about having these be modeled by matching against the document's authored language?
  - and you can have different rulesets: if you want to have an extremely hoity-toity literate format, you could train it to recognize "We let X be a Y that is initialized to Z" as a long-form tree to transform into a JS expression (if you're diving into the Literate Programming side of things)

One incredible thing is that you could then have this render back out, if it's possible to spec the language both ways (ie. you have a way to serialize to English as well as parse it) by reversing the tree through, translated into another language.

Isn't there some other language model I remember reading about, like Lojban or something, that is also regarded as an abstract tree format that can parse from and render into

What format does Parsey McParseface parse to?

the thing I remember that language I was describing (from memory and/or imagination) was that there was a standard fixed "dictionary"

is Wikidata plugged into Wiktionary yet?

is it possible to parse naturally from and to German? What would happen if you round-tripped Kubernetes' asset names, I wonder?

That raises a good point, actually: is

## the Redirect Stub Format

Rather than / in addition to (if you want to be redundant) specifying a redirect in the metadata

You can maybe just have a top-level heading that's "REDIRECT" and the name of the page it's refirecting to (with an optional "Title this stub was known by that this page is fulfilling" as the link name)

## Mapping / deploying into PouchDB's model

(right around here I was starting to get somewhat off track from the original premise)

You'd have the IDs be the whatever root filename base, and then the mapping for "data" and "content", with "data" coming from "The Metadata Object For This ID" and "content" coming from some index.html at the end of rendering or whatever

or better, you use attachments for "content", under the "index" model

## Thought re: Printacle model (watching)

this overlaps with [The Useful Thing About Modeling Metadata as Deltas](rwgf8-mcmpz-ccb30-xhs3b-xppxz)

you could have a different Git tree / system for annotating "this is why I started this job"

and so this tree would be mapped as a different "source" for, like, a different class of data?

## so anyhoo

You have "sources that define a state", and then "things that converge to a state", and then some way of mapping a set of the former to a set of the latter, and that's your CD pipeline definition, imo
