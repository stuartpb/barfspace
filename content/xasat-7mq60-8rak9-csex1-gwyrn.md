# Markdown Processing Filter: Localize Links

This would be a thing where I could copy a link to a page straight from the browser (ie. one that starts with `https://notes.stuartpb.com/content/`), and then "press a button" (run a command, have it go through CI, have the IDE pop up a suggestion with a keystroke to auto-accept, etc) to convert it to this tree's local format

maybe also just "stripping off the content/ part", or even "stripping off the notes.stuartpb.com" for when it's being edited in my notes workspace which is the root of the VS Code "relative path"

and maybe we can teach it to treat anything before the hostname as "just a local mount", or maybe there's some way to recognize local mounts like that?

this could also make it simpler to consolidate all local IDs to one format, under a given "byte-conversion" specifier as well
