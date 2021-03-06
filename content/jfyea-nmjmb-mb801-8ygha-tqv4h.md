# lumpkin

A CLI bulk mailer. Reads recipients from a CSV, then sends them the message defined in a file via SMTP.

https://github.com/stuartpb/lumpkin

## features I need for fancy email

- inlining and all that style flattening stuff
  - needs [inlin](xwzm2-rt7gf-0t986-pxgpx-n1nyq) because juice's default is inadequate

## Features I need for sending a second wave

- Modify the list with outputs (or at least "output a new list that can be pasted in as a column")
- Skip-if-field-is-defined (for skipping addresses who've already been sent the campaign)

At the very least I should produce output that makes this easier

## Differencing

I'm thinking `--omit` can be the syntax

This can be one of the commands that defaults to specifying a config rule with `path:`, and "a raw list file" or "a YAML list of addresses"

Should there be a possible ordering, definition-order-style (see "Multiple Configuration Sources" below)

## Other recipient list formats

- Just a list of `to` values, no comma parsing
- YAML (I mean, heck, why not, as a `path` value to transclude I'm cool with it)
  - one thing is that this should accept either an array or an object with a `recipients` property containing an array

## Multiple Configuration Sources

Following from the last thought in the "other recipient list formats" section (as this also pertains to the implementation of "omit"): I'm thinking the consistent thing would be to have fields like `recipients` be defined at the top level of the object, so arrays are unsupported at the top level, but allow arrays under `recipients`, and allow strings to specify a to-parse email address, or other NodeMailer-compatible address specs to specify addresses as parsed objects in JSON/YAML

and these arrays can maybe be nested, so they're functionally a workable basis for a hierarchy? how do Helm Charts do it?

anyway, part of the idea here is that multiple documents can be specified in one file to adjoin multiple passes, like if I want to re-include addresses after specifying an `omit`

another thought: not all properties off of `omit` would be about the source for the omitted addresses: you might want to have something like a "strictly match all fields including the Name", as well as "don't omit vs. crash" and/or a "warn about

might also want to allow stderr/stdout config for warning classes

so maybe there's a `warn` object? and it can be set a la gcc at the command line, or as properties in the `warn` object in YAML?

## Columns overhaul

Array-style implies "no heading": no-heading can also be set for object-syle (if all keys are numbers), but defaults to ignoring the first row (even if all keys are numbers).

Each field can be defined as a set of column headings to try (these will also be skipped if the cell is blank)

You can have each array item (ie. a one-item array, if you just want this) define an array of columns to check for presence (each must be defined as an array, or it's interpreted as a literal string). Adjacent columns are separated by a space unless you specify a literal `''` between them.

`to` should be the key for "use this as the entire email"

## lumpkin as a listserv

man, this seems like an incredibly cool use case for lumpkin's approach to mail: define mailing lists in terms of CSVs tracked in Git - the CSV is fetched whenever someone posts to the list

maybe `lumpkin` can become `lumpkin send` and this mode can become `lumpkin serve`?

this way you can do `recipients: path: http://...`

## To-do-later features

Template formatting:

- JS template-string (`${}`) / "EJS" syntax
  - maybe as hyperHTML to allow for HTML formatting where the user opted into it without
- Pug
- Handlebars or hogan or magnum or whatever
- MailChimp / whatever ESP formatting with `%%Percents%%`
  - This is also, what, Windows templating? Batch echo? Visual Basic?
- Shell-quote syntax (though that's pretty much just the JS syntax with optional braces)
- Go template syntax?
- Maybe just a "gimme the kv pairs as CSV with two rows and here's the command to run" or something so people can write it in Lua or M4 or whatever, then we buffer it from stream
- It's also worth integrating this functionality with columns for the input data

Markdownification:

- Templates can probably handle the "insert content Markdown here" pattern
  - maybe taking blocks by heading, even? or there can be a template for Markdown and HTML layout separately, both taking pieces from separate Markdown files? Anyway)
- But for situations like what I'm doing right now, what I'd want would be an autogeneration *of Markdown from the HTML input*.
  - And I'm thinking there are ways to do this automatically, especially if we permit selectors for *which node to transcribe*
    - a thought I'm having here would be "normalize headings", ie highest-level becomes h1
      - I think this is an existing feature of something, like, in the HTML Outlining spec?
    - You'd probably want to preview it, and maybe just manually edit it by outputting it, then reusing it as an input file
      - So what we're saying is lumpkin is probably going to do double-duty as a rewriting toolchain processor
- Also, editors having a "turn this crap into plain Markdown, then back to HTML" mode would be a cool, smooth way to get rid of meaningless-font-switches and crap
 - especially with a "turn this into interpreted Markdown into HTML" mode for when I use asterisks for emphasis in a WYSIWYG editor
 - now that I've discovered remark and rehype this all seems downright quaint

Sending:

- DKIM? https://nodemailer.com/dkim/
  - I feel like the ESP is expected to handle DKIM?
  - Maybe this can be added as a feature for providers that don't do this sort of DKIM integration
  - And maybe there can be helper commands for generating a keypair and DNS entries?

Start-at-row, for resuming

Import-file-as-columns-spec (though isn't that just "import a file with `columns:` at the start"? Yeah, this'd just be redundant with `use`)

you could have something like a "build column spec from these headings" tool, though?

A log option (saving only error records, error and delivery records, or full records with timestamps for all emails)

Better console output (like, each pending email has its own line that redraws)

## ES Modules style

I tried to do this, but the need for a flag, plus the [troubles around ESM in binaries](https://github.com/nodejs/modules/issues/152), made me decide to pass up [my own best practices](b57nn-27xma-g9axf-r6dhz-gmg0g) and stick with implicit-cjs for everything. (Those will become best practices once the flag is unnecessary.)

I considered https://github.com/standard-things/esm
