# The Bagtent Metadata Model

Or you can think of this as "bagbernetes"

Metadata is modeled as annotations.

Rather than attribute anything to a name though, things are primarily UUID-oriented

Or, actually, you know what? Screw it, you can have this model just mean "whatever is defined by the"

## Controllers

Like CRDs, you install a schema by introducing the document to the database that contains it

Data uses the "eleventy model", where a corresponding file with the name of the md with ".yaml" can also serve as metadata, espeically if there's nothing to say.

However, it's generally recommended to attach your metadata to documentation for it, like "here's where you can get"

## autokind / implicit / root-level metadata?

Legacy schema is present for rendering, but controllers should use UUIDs at the top level for their schema

Actually, how much of this can we borrow from, like, Eleventy and Helm? Like, shold "MIME type sniffed by extension and possibly other rules like magic headings" be a field?

This is, of course, informed by tooling.

## How this'd be set up

You'd have it as a path under the New Module Tree Format, where this spec is at "com.stuartpb.bagtent" or whatever, and the next level is "controller scripts for documents that have this field specified in their metadata", and because BISNES has the thing where the metadata is specified by (base) filename, this ends up calling back into the content tree for schema validation

maybe it's "whatever.bagtent.thing.commit" or "whatever.bagtent.thing/save"

or, like... no, I don't think they're implicitly distinct operations (well, commits are) - but, like, there should be a superclass that's "anything that operates on files"

I think each "class of run" can be implemented with a different tool/pipeline, and they're all using Plumbus hooks? hmm

I've been thinking that the Plumbus "name system" can be cut down to just "have Plumbus take the list of scripts to operate on on the command line", and it expands globs internally by default, and the surrounding environment can decide how it wants to provide them

And, okay, so, Module Tree is just the spec that says "design your module to work as a layer of a shared tree - make the root sorted by domain, and then, everything below that, avoid shadowing unless you really mean to

And then, as far as Plumbus is concerned, you can implement "layers" however you want - like, a wildcard level is fine

if you want you can just reject (duplicate names should serve as a warning in the tooling?)

So then, like, what's the functionality Plumbus provides - numeric sorting before lexical? And I guess also that we can make the globbing internal instead of relying on the shell (so it could potentially take an xargs-level number of scripts - and even support xargs-splitting into multiple calls for a very large number of files as input arguments!)

You know, maybe it should always take the list of files in as stdin? Or like, at least the hook version?

I mean, y'know, "provide stdin to each script" is already a flag - maybe we should make it "send this file in as stdin to each script"? And maybe stdin is the default?

So yeah, that's the other thing - managing the pipeline for input and multiple-invocation. As well as the ability to take files specified as args *or* lines from a stream

## wait, doesn't that mean "content" is just an improper-domain Module Tree directory?

pretty much, I guess

So yeah, "common paths" like `content` can become part of the Module Tree spec

It's weird to think of content trees as "module layers", even though that basically is what this is

so, like, the thing is, bagtent needs a layer where you're calling out to *some other*

## oh wait ok

Right, so the thing that defines Module Tree is the `MODULE_TREE` environment variable

maybe there's also a `MODULE_TREE_LAYER_ROOT` for a directory that's like `plumbus`

No, right, okay, so that's the idea: there'd be another layer of tool that's like "look, if the thing you're going to be using Module Tree for is just aggregating file lists to tools like Plumbus, you don't need to build an OverlayFS

oh right, *that* was the thing that defines Module Tree: it's re-entrant based on the context/scope defined

So... okay, so `MODULE_TREE` can contain wildcards to "construct the tree" lexically, and if other tools actually need to *see* a flat filesystem, they can figure out inventing an OverlayFS for themselves

and so, like, when you specify the wildcard to search in Plumbus, it starts from `MODULE_TREE` if you're not specifying an absolute path in the argument, which means, unlike a CWD, it can span multiple directories that are specified by the environment

`MODULE_TREE` does *not* support `**`, because variable tree depth breaks the design. It *does* assume nullglobs - if a component of the path has no matches, that works as a "no objects of that type", so the path stops searching there

And now I'm thinking... the `org.plumbus.hooks` layer shouldn't be there. That's up to the application - it might use `plumbus-event` or whatever to invoke a set of scripts that another tool also processes. Or maybe the path splits into `hooks` and `filters` if it supports both: that's up to the sctructure under the application's name to decide. It's totally possible to accidentally call the wrong class of Plumbus dispatcher with a wildcard; it's up to whatever wrapping you might want to implement to not do that (we might have Plumbus set some environment variables to detect if a filter is being run as a hook, if that's a concern - I feel like there's also a way to look up the parent process?)

also, maybe the variable should be called `MODULE_GLOB`, because

or maybe it's `GLOBTREE` or `GLOBROOT` or, oh my god, what if you call it `GROOT`

since this is kind of object-oriented maybe it's `OOGROOT`

Anyway, the idea here is that

Okay, so maybe this comes back around to the `PLUSHU_ROOT` design where, if you want to make your `MODULE_GLOB` the base for calls to Plumbus, you set `PLUMBUS_GLOB_ROOT=$MODULE_GLOB`, and it's the responsibility of whatever "containerization suite" tool you're using to set this per-tool

but, no, that doesn't shift a context to share with other tools... hmm, maybe that's the thing to consider: which class of module tree should be shifted when calling out to a different system?

because yeah, setting the glob sets an environment / context that effectively defines the function? yeah, this feels like real object-oriented shit right here

You know, the more I think about this, the more I'm like... yeah no, let the glob roots be definable on a per-system basis.

Like, when I was originally conceiving the spec, there weren't multiple conceptions of use cases for this...

wait, no right yeah I'm thinking about it again... yeah, no, tools can have different glob factorization models for different classes of component, so yeah, a common `MODULE_GLOB` is an outside concern. And, like if a tool wants to use a `MODULE_TREE` style hieararchy internally,

So like `plushu` is a tool that calls scripts under `org.plushu.commands`, and those are all expected to kick off to `PLUMBUS_GROOT=$PLUSHU_GROOT` - maybe they even tack on another context level like `org.plusku`, and when jumping out to a different domain they set `PLUMBUS_GROOT=$PLUSHU_GROOT/foo.schlommy`

I guess the trouble is I feel this could lead to scripts getting called with, like, the root / call division differing from what the script uses, ie. with the wrong context...

So maybe there needs to be a way to say "scope here is three levels above me"?

Or... maybe this is just kind of an intractible problem? I'm not sure there's a way to protect against this that doesn't also reduce glob-hierarchy model flexibility

I guess it really just is "don't touch PLUMBUS_ROOT unless you're really entering a contained namespace, like you'd be just as comfortable being a sibling"

This is basically the CWD problem - I mean, I'd love to naturally structure this in some way that doesn't have this problem, but it's an emergent issue in the underlying Unix model in other incarnations.

Like, if you want to guard against this, you can do the old "set PLUMBUS_ROOT to resolve this level relative to where this script is located" to ensure your scope is at the right level of relativity, in whatever language facility you have (remember, this is shell-agnostic - these are allowed to all be Go binaries if you want to get kinky)

That might have to be some kind of bundled utility that doesn't trip on glob names

## what if I wanted to have multiple search paths?

You know, the old "usr and etc and var lib and user config and run" model

Well, actually, that's a globbing feature, isn't it? Like you'd go `{/usr/lib/chumbled,/etc/chumbled.conf.d}/modules/*`

## this splot out from when I was talking about plushu commands

Or, like, no, better, you could have certain classes of "command that converts to hook", since so many of those commands had boilerplate invocations? like `org.plushu.blamphs` is searched after `commands`. Or like that's some kind of non-Plushu thing you can insert by hooking into the dynamic command handler, which might be a Plumbus exec chain... idk

## okay, right, so, coming back around to Bagtent

So in Bagtent, the `MODULE_TREE` root is different from the `BAGTENT_CONTENT` or whatever that defaults to `./content` or whatever, because you keep tools in `MODULE_TREE` roots so they'll all interoperate
