# "fileify" transformation

being able to highlight a block of lines and "fileify" it, splitting it off into its own node.

This flows most naturally in [the Accordion Editor/Viewer Concept](n3ht7-s55td-078sn-zx3ny-z0b0q)

for example, this started off as a subheading I was adding to the Accordion page (though, really, I only ended up keeping about half a sentence's worth of text)

Anyway, you don't need the accordion editor to have this

## the idea

So, you'd probably want to make it so the selection starts with a heading. Maybe there's a non-highlighted version that's "export everything from the heading that starts this section, down to the next sibling-or-parent heading"

so yeah, you'd have an item in the context menu like `Export "the idea" as new file` - let's put this under a "Bagtent" submenu

So the submenu would

## side thought about that submenu implementation

we're into the woods a bit re: I'm thinking about VS Code / Theia's bagtent extension generally

that can be grafted off from here in whatever factorization later

anyway, the idea was, should there maybe be another hijackable level of config (like a yaml/json) for the Bagtent extension, where the default tries to use the in-shell Bagtent tools (which it might search for and add to PATH as part of the extension's code, like, it only applies to shells spawned by the extension?)

yeah, that could be an aspect of the yaml config, you can customize (append/prepend/replace style, or maybe provide-an-index)

I'm also thinking about Module Tree?

oh dang, does this get into the notion of it being feasible to, like, spin up a container (or even a Pod) just to create a file? oh wow, this is a tangent

##
