# Bagtent-Based Adventure System

I'm calling this "adventure system" because it matches... Inform? or that general family of story thing

Anyway, it's totally implementable in Markdown, as links to other documents. And the document's presentation can be *fancy!*

## Related idea

This should probably be kicked out to its own page, but you could keep HTML / CSS stuff out of a document by having "decorators" with selectors (ie. combinations of CSS selectors on the rendered Markdown (with slugs), and/or regular expressions) in the YAML frontmatter

- These would be applied to the document as a postprocessing step
  - and then CSS selecting whatever span/classname was added to the selection could handle, like, applying the "ROAR!"
  - and JS could handle whatever rule like "show each paragraph one-by-one, click by click"
    - and that could be derived from data-attributes in the HTML / being transformed into Custom Elements
  - a base rule would be added for recognizing, say, every list item that contains a link as an "go to page option", to be presented as a button
    - and that could be, you know, a rule that says "links in lists are choices":
      - give them the .button class
        - or replace them with `button` tags"
        - or maybe there's a *very special* custom element that can be populated from, say, the structure of a whole section...
          - this starts to get into Markdown As Schema

- These could even be imported/included from a "common library", like a base "stylesheet" for the set (ie. the scope of the "adventure")

## futhermore

These could also be useful for templating

- Like, not only could it be cool to have *runtime* templating
  - where, like, as they say, you could make the game truly "dynamic" by having the page's state modified by some localStorage variable)
- but, like, this could replace Eleventy
  - you just have one selector that's "append to head"
  - maybe you have each

- This is also starting to feel like that Go modular server idea...
  - of course, I'm looking at this as static rendering.
    - But maybe it can work that way?
      - Or maybe this could even be the basis for a mix of the two?
      - Maybe the server can even

## Okay, now this is making me think of routing

What if each file was allowed to override its route spec? Like, I could make a file with the frontmatter

## Eleventy Venn diagram thoughts

As an alternative to YAML being implicitly interpreted as frontmatter, or any other situation where you might distinguish between the two via file extension, you can have "YAML data" files that would just have to open with

```
---
---
```

(and maybe `%YAML 1.2` but, you know, that should go without saying)

But yeah, I'm thinking that, by default, you'd have the two kinds be naturally recognized as `.front.yaml` and `.back.yaml` or something like that

But, see, that could complicate systems that need `some.other.prefix.stuff.history.back.yaml` to be recognized normally

So, like, what I'm saying is, you'd have the two "I only want the one kind of YAML" formats to be distinguished by each one having a `---` at the top (before any document), and a second `---` either immediately, or at the end

Ending the second document with `...` is allowed

Behavior on multiple documents is undefined (disallowed) by default

a single document with `---` at the beginning but either `...` or EOF at the end is treated like a plain YAML file (unless the user would like to change the null-prefixed-YAML or stream-terminated-YAML)

(maybe this pattern should be called the DUD pattern for behavior that is Default Undefined/Disallowed)

As perfect as it would be, nothing is allowed to follow a YAML `...`, not even when in use as metadata (unless it is being treated as a bare file specifically specifying a frontmatter document)

You can specify whatever "warn if this/not this" linting on YAML that you want, but you know what, let's have it be out of scope

Oh man, and I feel like this was overlapping with... what, the Literate PICO format I was describing earlier?

You could use this as a task runner / script runner, too _ I guess I'm thinking you'd have it so

okay so you can set the MIME type / file type / pipeline syste to apply / responsible controller whatever


