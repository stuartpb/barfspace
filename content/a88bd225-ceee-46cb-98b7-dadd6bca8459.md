# snippet implementation

My thinking is that any sequence of commands to be sent to the printer are batched into a file, which is then canonicalized, hashed, and uploaded to a "commands" object-store folder, and dispatched from the SD card

I'm guessing "print file from SD" commands can be dispatched from an SD file, but work like a GOTO? Still, that's a thing I was thinking, that this could be used for one-way flow control (if all snippets are stored by hash)

Hmm, you could also create named aliases (usable as variables to make mutable flow control, even) by uploading files in a different namespace (like refs) where the only command in the file is a command that dispatches the gcode file by content

hmm... maybe each project has its own namespace, like separate git repos. and the project can carry along stuff like the common start gcode just a bunch of times redundantly, like how it works now

mm, but I'm thinking now about the firmware's 100 file limit (and how the redundant routines are nbd in this paradigm because they don't use up file nodes)...

also, a thing I'm thinking about is how you could do some real neato flow control by having each step have its "trailer" as a named file mirroring itself - since sequence control has to be one-way and sequential (like, with no stack), this would allow for, say, a number of large snippets, to be joined sequentially by just "manipulating their next-node pointers", so to speak

isn't this kind of overkill, though, since you could just rewrite the last line of the file? I don't know if this strict "always be uploading whole files" model is necessary

this also feels kind of like a possible Plushu design paradigm overlap?
