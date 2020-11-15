# getting lost in the weeds with bagtent

I was thinking "it'd be cool to have an editor that's defined as a series of prompts like "Do you want to add this section of your starter template?"

But, like, not in a terse, traditional task

## back on my Helm / Flux bullshit

This also extends back into the idea of specifying these as values to a Helm chart, or even specifying the base of a helm chart itself

See, one idea I'm having with the "selector" idea

though actually I guess you can essentially do this with the logic of

But, see, what I'm thinking is you could mix editable fields specifying values with (potentially editable too in the interface, if you ask me, but under a context menu option like in Grafana)

And you can press link buttons that set values in your live state

## Oh hey, actually

Now that I look at this, I notice that, yeah, Kubernetes handles documents that define several documents, doesn't it?

But, so, like, okay, the thing with what you'd need from a generalized literate preprocessor format, you'd need to be able to specify all the various sections of various different Resource templates in one file, to represent all the stuff a value would touch...

or maybe you just hyperlink.

So yeah, there you have it. Helm Notebooks.
