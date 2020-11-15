# Tools as Literate Bagtent Documents

So, like, you could use the frontmatter like a CRD in Kubernetes to suggest a tool for a name, and then the content of your document (literately!) specifies what'd live under that name...

and let's say that, ultimately, the form it takes is of a Pod that will run the command

And, like, maybe that's implemented by some higher-level templating that can also read the same simple metadata like "this is a bash script" and just puts it in your `~/bin` under the suggested name if there's no conflict (and maybe under a username-alias or domain-alias or something - look at however Kubernetes handles CRD name conflicts, I guess), to implement the same "tooling" at a different "level"

this one really overlaps with Wayside, huh? And the whole "Wayside as just a Pod manager" - though, like, I mean, Helm can make pods, so making it a Helm manager seems like it might answer some of these questions

## quick thought

Helm has "implement this layer of values to override this previous layer", right? Like, that seems like a reasonable way to summarize changes to the default values rather than having to merge them in with the original specs (though, like, then again, that's kind of a thing it does already).

And I don't know if this has been covered yet, but it seems like Helm's "subcharts" model is really neatly suited to Git submodules? Or you could use the include system, I guess - but maybe those two systems cooperate?

## The ultimate idea of how this would apply in my cluster

The idea is, I'd have my whole "dashboard" designed as a Deployment based on a tree that deploys the relevant Resources (which could even include a CRD for our specific pod-tool "shell" model)

## the weird possible vision

You have a CLI "shell" that you type "c9" into, and it adds a line of Markdown that is read by tooling to create a Deployment of C9 (Which is also specified as Markdown), and this is a proposed commit for you to review and customize

Also, this is a much better alternative to preserving the YAML comments
