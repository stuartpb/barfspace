# What might not be a bad idea?

originally from [Sprout Leaf's docs](vhrg9-0wwy3-w2bd4-xc7x6-xh98e)

And I guess this applies for conjure as well, should maybe get passed through: a "read / prompt for some content to fill the page with"...

I guess I'm feeling like maybe now this is a real "bagtent tool"

- you'd use a kind of "internal shell" type deal
  - and I don't think this is too redundant to ed
    - or vim in ed mode or whatever
      - though maybe it's an idea for a generic editor interface?
        - hmm. and this could still integrate with the Frontmatter-Configuration-Centric-Documents-for-Routes system I'm building: one where it takes you through the scaffolding for the file piece by piece
        - How does Jekyll / Octopress do it again?
        - How's Ghost at this? Gastby?
        - Ooh, right, this is an idea I was having earlier
          - TODO: move this branch somewhere sensible
          - a system like Flux could process Helm charts based on content in a collection like this
            - Let's even say that it's like how SpamAssassin does it
              - where each user has a top-level directory for documents that they're responsible for
                -  or even each party, qualified by email/domain-name
            - you could also go the Bagtent way, where there are no strong names and every document in the folder just dukes it out
            - But however you structure it, you're defining that you want the classes of content re-rendered and baked into a new image by whatever transformation is specified in the metadata structure
              - oh man, this is turning into my Jackman plan all over again

## sprawling "description" I wrote just now

- This kind of overlaps a lot of the other proposals around here
- Basically, a section-by-section wizard
- But imagine having the full documentation for each section of your config file display as you're presented with the lines/section to edit
- Yes, that's kind of the way it works now,
- You could do a lot with branching logic
- The specific overlaps this has are with other levels of templating
  - Like, do you maybe have these things specified by HTML elements?
    - And then you have those recognized by Markdown rules
      - like maybe even specified as a transformation to the mdast
        - and then there's another transformation from the custom node to an HTML custom element
          - or maybe that's part of the custom node, I guess?
            - Isn't "embedded HTML" already a MArkdown construct?
