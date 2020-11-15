# How petlogs was merged in

## destructuring the repo

- petlogs' structure is being rewritten by pasting link lists into README.md files, as well as the metadata YAML as fenced code blocks in their sibling README files.
- the current README file, as well as the list for the layout of pages under the machines/ tree (the legacies/ tree was kind of a namespace hack, they've been merged into lists in their respective machine-tree-readme-roots), are going to be orphan-roots linked from the README (which will just list those two links)
- I think I'm going to go ahead and link references to in-repo ".md" files to the notes they're in reference to in a commit now

## merge plan

This was the plan I followed:

Both pages from the old petlogs will be added as links on the root page for petlogs, and the "changes" to README.md will be discarded.

This plan is moved into the original repo's machine-list node (which became [Camp Papalima](9xr5p-sec7k-w6a4n-nebsb-qfmmp)). A node specifically talking about the old directory structure as An Old Bad Idea (or at last An Old Idea) can be conjured later (see what's left of the thoughts on Camp Papalima).

## how I did the merger

- checked out petlogs as a sibling repo
- did a bunch of bagtent-destructure magic as described above in an `otk` branch
- the following shell commands in the notes.stuartpb.com repo (essentially - I actually had to rerun the fetch when I realized I had a fixup to do because I didn't actually delete the yaml files):

```bash
git checkout -b import-petlogs
git remote add petlogs ../petlogs
git fetch petlogs
git merge -S --allow-unrelated-histories petlogs/otk
```

from there, I resolved conflicts in README.md (I used mine and moved the old one's content around here, as described above) and .gitignore (petlogs had a slightly-better Cloud9-safe version, not that it matters that much at this point), then did more commands:

```bash
git add README.md .gitignore
git commit -a
git checkout master
git merge import-petlogs
```

since the merge was in that branch, this is a fast-forward merge, which I then `git push`ed to make my entire machine notes history part of this notes repo. Hooray, I just added like a dozen heads to trip up tooling!git remote add old-project ../old-project
git fetch old-project

## stuff that happened after that

The now properly-populated petlogs root swapped places with the papercuts depot on the root note.

there were three redundant nodes for systems - each one expanded to fit all the remaining content that didn't make more sense merged in to the machine's changelog list or plan or whatever:

- the stushiba one turned into a page for "stushiba problems"
- the stuquart one turned into a changelog entry for "I used stuquart on stutendo" to point to that note as a stub
- the stutendo page that was also kind of a stub pointing at that page turned into a general index for "Windows Problems I've Dealt With", we'll see how that shakes out
