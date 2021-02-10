# The Extension Engine Rendering Model

- This model is a mapping of targets to outputs based on the use of engines
- This is probably just reinventing the makefile at some level, but I don't care
- This is some kind of percolation / refinement of one of the bigger ideas in these notes.
- It's somewhat inspired by the model VS Code uses for editor state, which is file-extension-based (because of course it is)
  - Actually, does VS Code have a sniffing layer that could be reused here?

## so anyway

Part of the idea is that every tree has access to its parents, children, or siblings with the same prefix before the file extension, somehow. Like, if I want to have a photo, and a Markdown file with comments next to it, I might have a ".md", or ".comment.md"

And there might be a rule to put that file in the rendered output, or to cook it into EXIF metadata...

But the core data model is probably the way to lay all this out:

I mean, I think at some level the model should be flexible enough that this is just "it's about a collection of files in whatever structure that should be canonically composed into a tree with another structure"?

But, okay, so, like...

## okay so the thing that set me off on the "I'm overthinking the file-tree side of this" end

[Snaptoken, Kilo, and Leg](z5kzw-dp3gc-rk8aw-pdhwa-4yhav) present a fascinating model
