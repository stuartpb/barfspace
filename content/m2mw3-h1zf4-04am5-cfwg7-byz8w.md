# Invalid Input Happens

It's a big deal that you design systems that, as much as possible, don't choke on invalid inputs or non-parsing states. (Like how Markdown doesn't replace "invalid syntax" like getting parentheses and brackets backwards with anything, or crash - it just treats them as the exact text that was typed, no change.)

Not only does this protect you from malicious systems / attackers / irresponsible third-party vendors throwing a wrench into the gears, it also opens up avenues of extensibility.

An example: when I type, sometimes I start typing at the beginning of a line, then hit "Enter" to insert a line break at the beginning of the original line. This causes an "invalid heading", for example, if I'm typing `## New superheading ### Old heading`, and if I'm previewing it as I type, the render state for that line isn't going to make much sense - but it *doesn't break the entire page*.

This is a big part of why XML is such a pain in the ass (and why editors for it are so often bloated and abstracted), and why so many are moving away from it: and why YAML is so much nicer to work with than JSON (if your indentation level is wrong, you're just writing an unknown sibling field, not breaking the entire nested parse structure)

(side thought split out [here](3m7zg-k6bf5-t6a70-nyjky-e1fzk))

## anyway

this is why JSON Schema doesn't, by default, invalidate extra fields.
