# Unusual Studio from the burgeoning Data-Notes Model

From the model popping up around [Thread Jam](5e1y8-03bex-6w9e6-7pq56-78ece)

I've been thinking about bringing my Unusual Studio Projects into this...

## thought on how this contradicts a thing I just typed

okay, so like, my thing about how "multiple controllers can parse the same object"? Yeah, that's dumb: it should be more like "here are controller pipelines this document is ready for, categories it can be processed as", and like I described abut those defaults coming from a Globerlay is fine and valid

because, like, this very muchcreates a Post object, but it creates a nobject that is derived from...

okay, so, like, it creates a Markdown Document, which is turned into a Note, but is also turned into

So maybe that's what it is: a (Markdown) document can specify that it's isomorphic, but what the process needed to "render" it into whatever object type is

so, like, "Projects" would have it be a

In the interface for this, everything is ultimately converted to another form of String Document that's used to pass the value around. Usually it's a "YAML-prefixed some-kind-of document", where the string body might be another YAML document.

Yeah, okay, everything is either converted into a Derived Document, or Mounted into, like, a Kubernetes Cluster, or an Nginx Route, or rendered to an image, or pushed to Git, or...

so you're either a Transformer that provides the Route to interpret a document as a given Type, or you're a component that reads those derived objects and turns them into whatever state you're supposed to have Outside the Source Tree (which might be "a clone of the source tree with all the implied documents rendered in")

so like, an API tool could detect circular references, that's one reason it's like "why have a tool to handle any of this"

## the root configuration, then

- You'd have documents of "BagpipeRule" defining matching for default supported
  - path matching
  - annotation matching
  - sure, special sniffing on an existing type, sure why not
    - like, I'm down to say "treat every document with an Unusual Studio Projects link as a bare paragraph as a Project Page"
      - that was one of my thoughts initially
  - the thing is, path matching is cheap, and content-crawling isn't

and documents of "BagpipePipeline" defining default conversions

- can be container/pod-based
- or maybe they're npx scripts
  - which can have different Pod profiles specified, for environments that support pods
