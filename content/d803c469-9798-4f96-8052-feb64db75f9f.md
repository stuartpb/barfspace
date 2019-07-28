# Linting and Rigging Markdown

- [ ] Integrate a Markdown linter to your workflow.
  - Now [this](https://github.com/remarkjs/remark-lint) is what I'm talking about.
- [ ] Write bagtent-rig to make adding links easier.
  - [ ] Hook into bagtent-top-links.
  - [ ] Write up the menu that's probably specced on the bagtent plans page somewhere.

Gonna start moving features out from the above list to subheadings below

## Linting things to check

- [ ] No unreferenced definitions
- [ ] No undefined references
- [ ] No blank URLs
- [ ] No blank link names
- [ ] Local links aren't mangled/pointing nowhere (see below)

## Bad link targets

Could have a linting feature to check if, say, I accidentally lopped a character off of a filename, breaking the link: "Ensure local link targets exist"

This can also catch "someone didn't put the `http://` protocol prefix on their remote link" errors
