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
