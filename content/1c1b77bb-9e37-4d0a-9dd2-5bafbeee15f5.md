# Pet systems

- [stuquart][]
- [stushiba][]
- [stutendo][]
- more, but I'll merge those in later

[stuquart]: 9f92b5fb-34f7-49e8-81e9-39f1cc0e2888.md
[stushiba]: 7a8242c0-f6fc-42a1-a077-b1205bcae73d.md
[stutendo]: 30e0178d-b9df-4125-90e8-a52a7dda1456.md

## petlogs is getting merged

(think of this like a little Operation Trapper Keeper squad outpost)

Okay, so, here's my plan for how the merge is going to work:

### pre-merger

- petlogs' structure is being rewritten by pasting link lists into README.md files, as well as the metadata YAML as fenced code blocks in their sibling README files.
- the current README file, as well as the list for the layout of pages under the machines/ tree (the legacies/ tree was kind of a namespace hack, they've been merged into lists in their respective machine-tree-readme-roots), are going to be orphan-roots linked from the README (which will just list those two links)
- I think I'm going to go ahead and link references to in-repo ".md" files to the notes they're in reference to in a commit now

### merge plan

Both pages from the old petlogs will be added as links on this page, and the "changes" to README.md will be discarded.

### post-merger shuffling to integrate

- This will remain the root for petlogs (though it might get put directly onto the root node, instead of linking off the papercuts page).
- The petlogs' system list page can take the parts of the "about petlogs" page that talked about the old layout.
  - If this can't be separated out from the old "about petlogs" page easily, I'm thinking this plan might move into that node. A node specifically talking about the old directory structure as An Old Bad Idea (or at last An Old Idea) can be conjured later.
  - The old README itself will probably be split up into a bunch of nodes that are more and less relevant today, and each whose relevance can change over time (ie Style Guide may have a comeback, spec philosophy like "why there's no use in titling journal entries in filenames" probably less so)
- The three machine roots here... I'm thinking will turn into, like, "the functional role of the system they describe, in the abstract" pages. I feel like that's a nice thing to have talking about pet systems, and that's how inbound links to these from other pages kind of treat them (ie. "I'm recovering via stuquart" could explain what a "stuquart-like" system is, and why you'd want one).

### thoughts

it's amazing how often "invent a new YAML spec with each document and no specific use case in mind" turns into a clusterfuck of [My Old Bad Ideas][], where the data is almost all irrelevant - and how that metadata is... still pretty attainable, slicing *as relevant*, in a neural bagtent structure

[My Old Bad Ideas][]
