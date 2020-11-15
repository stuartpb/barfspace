# The original plan for Lean Notes' structure

This is a historical artifact from the issues of ported directly from Lean Notes' Issue #1. About half of it got done before https://github.com/stuartpb/how-i-roll/issues/3

## The original list

- Each content board will be copied to a Markdown file in a directory named `chapters`. (The filenames will be the kebab-cased titles; as on Trello, the chapters will be unnumbered and effectively orderless.)
- [x] The Overview board will be ~created as an `Overview.md`~ text in the `README.md` file that links out to these chapters.
- I'll hyperlink to the background of each board as a header image; this'll provide a place to keep that data for future reincarnations (if they have backgrounds), and will keep that visual "spice" that makes the chapters more easily distinguishable.
- [x] The labels on the cards will be implemented like badges / shields, in the form of tiny SVG files that can denote, like, what kind of aside they'd be in published form. (This also makes it a little less awkward to write flowing spans of text, I expect.) It'll also give me the opportunity to add a little more visual flare. (These SVGs, I'm thinking, will go in a `tags` directory off the root.)
- I'll make a `meta.md` and `news.md` for meta-notes and history, respectively (which I'm currently keeping in org-visible boards). Plans will go in GitHub Issues / Projects.
