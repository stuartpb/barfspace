# Bagtent Markdown/Configured-Format Output Flags

- So, like, if I do integrate bin/validate into Bagtent at some point, for example
  - or, like, the distances script itself,
    - which should be able to also reconfigure by language
- But I was thinking that you'd want, like, maybe `-l --links` to print as links, and `-ll` to print as an unordered (hyphen) list of links
  - Maybe you'd have a proper format string for "how to write each line", and these are just some default formats
    - They'd be naturally structured as an abstract tree?
      - Can they be compiled into "parsed text sequences" and tree elements, like HyperHTML maybe?
        - Maybe you can specify in one language and it'll be used as the
          - So the "specifier language" like it's printf can be thought of as another "templating module" that makes a tree
            - and, like, Pug, to Moustache, to Go's template engine are all on a continuum like that
              - though Pug's pretty limited for one-liners
                - though I guess you can use `#[this construct]` now?
                  - note to self: think about integrating something like this syntax for Cre
                    - maybe cre sticks to the "CSS selector" model to specify descendants
                      - like in a comma-separated list? like TOML?
                        - thought on partywall: the selector could be called a "scope root"
                          - where it only matches the last ancestor having that attribute
                          - TODO: splice this out somewhere else
                          - TODO: Oozy sewer: write about Sprout and Splice
                          - Note that this start to get into stuff that overlaps my [General Eleventy / Literate Templating Model](bjst3-9j481-m0be7-2epd5-q2p2p)
                            - which also overlaps Markdown as Schema, Bagtent as Repository or Package Definition, Module Tree, BISNES...
