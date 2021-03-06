# bagtent-destructure thoughts

While looking at how bagtent-destructure outputs based on the presence of a content directory relative to the current one, which is weird and all, and how that affects the output structure...

okay, so, honestly, it output the old way to cope with files that had a lot of interlinks to each other by filename, and how rigging those was easy when you have a mapping file

anyway, you could still do the same kind of remapping step(! this could be worked in as a function of this script, as I'm not sure it is currently)

there should still be an output directory location

## better destructure operational structure

so, thinking about it now, the best way to make this script work would be to be like bagtent-conjure, where it creates a new node and outputs the filename for it (without the content/ prefix, according to some logic that should probably be worked out)

this would then work nicely for some kind of stepped recursive use, ie. you could have it destructure a repository...

ooh, single-file destructuring would just be a "conjure conversion"

## quick aside

I think I kind of wanted to do this originally, but I also wanted to keep the easy ability to map links to filenames around?

I can't quite remember why it works this way, but I think the way that I didn't want to turn things into parentheses links led to the two files, which led to not having them create a new node for themselves

## anyway, as I was saying

... some of the details need to be worked out, I think, but bottom line, the most useful base design for bagtent-destructure is to create a new node collecting its many input filenames and output it as a sibling file, the filename of which is echoed to stdout.

this can then get appended to the README (like how notes.stuartpb.com's descendants worked), or it can get appended to a node being collected for a higher-level directory with a README in it by some outer-level script (or maybe just a mode of this recursively)

Maybe the move-into-bagtent function ought to be its own script, and "move a series of files into bagtent and output them as some kind of mapping" could be another.

I feel like the native form should just be an inline-link list, because that can be easily transformed / split into two files: I think I just had some fear of losing filename tokens or something. This fear is shirking off as of my importing Understanding Lua into these notes, though, so I'm less afraid of having this kind of link be the base format.

Even if I worry about hairy filenames, I can use the fact that I know the output format of the filename to cheat like a bastard: if it's output to just the UUID as the target, I just have to match the filename as "everything between the first square brace and the last square brace, and discard the UUID in parentheses at the end".

Sure, it'd be saner to have a more porcelain/plumbing-friendly-esque "UUID filename, space, original filename" formet or something like that, but then you'd *always* need a transformation layer: this format is much more dump-user-into-editor friendly.
