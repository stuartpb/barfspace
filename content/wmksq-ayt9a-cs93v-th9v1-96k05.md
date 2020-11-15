# Literate Kubernetes Deployment

Literate Programming especially works well with this narrative structure... in fact, I'm thinking about...

oh man. What if you had the literate programming versions be underscore-prefixed, and they're also used to distinguish...

no, okay, so, what'd be better would be to have a "shadow repository" of source code, and that's how the branching for whether or not "support" for a flag-day ends

but so yeah: you have a repository of `.yaml.md` files, where they describe the file you get when you run them through, what, `lit`? And so they get rendered out with the directory structure being used to lay out the page hierarchy (ie. the "chapters") / navigation structure

and files that don't end `.yaml.md` are just not included in the helm-release render (so ie. you can have pages in the interleaved documentation that aren't attached to a specific yaml file). and so the rendered versions are the "stable" releases, and staging systems pull from the source and compile manually. the rendered branches are maintained by some sort of CI

## more on "page order"

[Code Narrative Order](ae5d3-g6gtd-ed90v-bd7p1-k7g2n)

## style guide

I still like to put `yaml` at the end of the top fence, even if it can be inferred from the file extension, because it distinguishes the opening line from the closing one, which is always bare. It's like a neat little self-closing tag.

## for very unimportant documents

[The CRDS in a Literate World](0veam-tt84w-3tatf-zrcpr-nh60q)

## see also

- [Literate Programming notes center](3hpyy-r92a9-d9a2q-x45xd-k7cz6)
