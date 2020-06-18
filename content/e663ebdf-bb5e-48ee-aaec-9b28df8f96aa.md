# Literate PICO-8 Cartridges

Anyway, you'd have it be Markdown, and all the parts that constitute data that goes into the cartridge would be in the form of code blocks - the first line being a fenceline with:

- `lua p8 (options)` for Lua code
  - Options:
    - tab to render to
    - whether to append to the previous code line, prepend, or insert
      - or maybe even replace, if we're inventing some new kind of inheritance model
        - I'm kind of thinking of Pug's "blocks" here
          - You maybe could even have a naming/selector construct
            - let's not go so far we need frontmatter involved, though
              - remember, *literate*: the semantics should be visible from the *text*
              - that being said, metadata like these headlines/fencelines for code placement should be exposed by the renderer
                - I could *swear* there's already a standard for Literate Programming code block assembly, though

oh look, it's [a set of highly commented PICO-8 cartridges](https://mboffin.itch.io/pico8-educational-toolset?click_to_load=true&embed)

## revisiting this

actually, the most common way to define "args" in a fenceline is to do them like this:

- p8.tab
  - for code
  - let's say it's all append within that - tabs are an easy-enough jumping-around mechanism
- p8.address
  - for, like, all the other data
  - might also have something like "p8.bank" or "p8.region" to make the same "appending" as tabs easier
    - maybe address "blocks" for use like "player" and "enemy" or whatever can be defined in the metadata
    - or maybe we're inventing a header-for-debuggers-and-inspectors format?
      - like, maybe you include a code block that's MAME's Game Genie description format or something like that
