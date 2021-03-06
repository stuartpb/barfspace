# A Straightforward Literate Notebook Tool

This is a tool for making Markdown that works for [literate programming](3hpyy-r92a9-d9a2q-x45xd-k7cz6)

It also potentially overlaps all these other visions of Markdown-and-YAML-and-templates unification I've been swirling around lately.

So, the model is, the first word on a fenceline determines the type of a block, but **by default, a block does nothing**. This makes it fine to use a syntax-highlighted block to illustrate examples, etc. (You can maybe turn on "require inert code blocks to be identified" as some kind of warning later.)

The word after the language type is treated as a "command", and the tool's two stock commands are "w" and "a".

The "w" command means "write", and the "a" command means "append". You use the "a" command to open a file if your file is meant to be collaborating on the content of that file with other documents in the pipeline (the pipeline might even check for a "file appended to before an initial write" in validation), and the "w" opens it for overwriting. (There's no prepending, because that's, you know, hard.)

As such, you should always start the first access of a file you're writing "from the top" with "w", and all subsequent writes with "a".

- The default filename for these is the filename of the document with "md" stripped and replaced with the fenceline's language extension
  - stripping whatever other "extension" identifies this as a "literate template file" before ".md"
  - extension doesn't get added if the filename is quoted
    - or if it's the same as the filename?
      - I'm specifically thinking of "Dockerfile" here
        - Might just have to be a language-specific settings thing
        - Or maybe files that don't want their own name to have the extension opt out in the frontmatter

Tooling might provide some kind of presentation for displaying the filename a target writes to, but it's expected to be conveyed in the text naturally for a system that won't necessarily render extended language hints

- Flags can be specified like `--gnu-style`
  - so for instance you might have a `--no-extension`
  - or maybe something short like `--base`
- Anything with an `=` in it should probably be regarded as a "variable assignment"?
  - not parsed as a filename unless it's in position *and* quoted? (maybe quoting is also how you enforce no-extension)
  - anyway, the point here is to allow for cooperation with other systems' fenceline directives

this could be used for, like, a whole system build image script layer

it could even be used for building ConfigMaps / k3os config `write_files` / cat-scripts / TAR / whatever, by overriding the functions of "a" and "w"

## possible warnings

- warn if nothing happened because no fences specify write directives

## out of scope here

any ideas like these ought to make a new document:

- defining templates
- a level distinguishing "first-pass markdown" like this from "Second-pass markdown" like the render that uses the templates the first-level literate defined

## Another thought

I think each *fenced block* should create a new code context; however, an *indented code block* inherits the last set context.

The starting mode, and ability for fences to not set new contexts, can also be configured in the frontmatter.

Anyway, this would allow for two three-backtick lines to "set a context" with an "empty fence" for following whitespace-indented lines (the frontmatter version is mostly so you don't need an ugly empty fence if that's the only way you do it)

This also starts to overlap, as I think I said above, with the "generalized content-recognizing pipeline configurator" idea

and of course all this needs to also be weighed against experience with Jupyter before making any decisions

## but, so, like, operationally

So, like, you could have every `.c.md` default to being open where every code fence appends to the

though C is actually one instance where one-file-writes-two-files is most applicable, as you can have your template file house both the definition in the .h and the .c

but you get the idea - specifying the block type every time isn't necessarily a great time

and it might be the kind of thing that could be managed by a postprocessor?

## thinking about this a little more

I think what'd make more sense would be to have it so each fence "of the same type" has the same file buffer (with a default name based on the file), and you change it with `w=filename.ext` or `a=continuing.ext` (so it retains the "variable-equals" form of other code-block tools)
