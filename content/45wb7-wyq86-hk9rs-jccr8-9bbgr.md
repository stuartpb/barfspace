# Back to the It's All a Bag of Markdown concept

this popped out from the part in [Suggestron](mm18x-jgd13-01aaj-tatzm-bbq0s) where I was talking about modeling it in Trello

## what I typed

what if these were Markdown files in a folder (where IDs are prefixed with what position they're in as of a certain date - I think I described this before), and all the metadata is in YAML? And it's, like, even possible in this system, where you can elect to apply a template to your page, to prepend it with some label templates

this is overlapping into the Adventure Game System - kind of part of the Overall Data Cluster Nexus that's been developing, with interest toward "Everything's a document in the Big Document Store" (which is already an idea with a page, if I'm not mistaken!)...

but I suppose this is the idea, that this could be structured so that a document could specify something as broad as a window in the "workspace" or "Desktop" on the client, and it determines if it renders as a browser tab, or a browser session (if we don't want to force no-tabs-mode), or that'd probably be specified as an X Client (and, needless to say, that's client-specific, though damn, X does mean there'd be a way to transmit over the network wouldn't it)

anyway you'd also have classses like "stream as video, with or without" (and that could have drivers from MPV to VLC to a `<video>` in the browser environment that's been provisioned for a whole section of the screen)

using the Plumbus everything-should-be-cooperative-documents model, you'd have these implemented by... I feel dynamic systemd-style hooks, where they could each go "Hmm, actually, no, I can't handle this", and the first one to go "yeah, I can handle this" doesn't exec into the next one

a kubernetes-operator-like system, though, could even read the spec for, if a file defines a hook for this call,

dang... you could, actually, do this... in documents... in the control plane...

damn, okay, so yeah, I guess that's where I'm going with there ultimately being an "ultimate source code format" in Kubernetes: the codebase is defined by a Git tree that builds the Kubernetes state needed to publish the content (which may be, you know, an entire app)

or a configmap... so damn, yeah, okay, this is what a microservice architecture is. and that's what this next-level Ingress format is going to be: a total roll-your-own-microservice-structure specification format (or, at least, renderable-to format - you can build higher level constructs through Helm charts).

figuring out how to get images built, like to prerender all the static pages of a "route" defined by a tree that's all static documents

anyway, you'd have the site's content be built in Markdown (and whatever-templating to build the whole view for it), and then microservices can be specified as literate versions of their

you can even have... oh damn and hell yes, you have Helm subcharts defined using values from a "literate" spec. Like, your suggested default configuration can be specified through fended code blocks (this is one where TOML really would make a lot more sense)

oh man, so what it is is, you'd have these values files applied using selectors

Man, this is starting to turn more and more into what I wanted to do with glasstub.es

Okay, so, we're not even necessarily relying on the Bagtent model here: you can lay your files out in whatever logical structure makes sense for your spec (or should I say your "literate chart for Flux").

- the one thing I'm inking is that there ought to be some kind of facility to specify
  - would this overlap with that idea of letting data like that be naturally selected out of the structure of the Markdown?

[okay, totally off track now, but](rbxy3-74n7t-w99td-wgg5k-6snrw)

## also

So, basically, you'd have a spec where you'd say where the "file for a folder" goes, and that is your "eleventy config", as Eleventy models it, because it is then read as the root (when the server/compiler is told to pint at your page)
