# Cleaning the Repo

Okay, so, this is a quest all about the files in the notes.stuartpb.com repo that *aren't* in `content`, so I figure this is probably the right place to track them. This has been playing out in my head for long enough that it's been a quest (which is a thing I've been noticing lately leads to good quests).

- [x] Fork the git-shotclock script (bin/barfmode) off to its own repo, like git-slum.
  - [ ] Add issues for feature-tracking in that repository.
    - [ ] Add an issue for adding a validation / integrity checking hook (desirable for this project).
  - [ ] Make new issues to mirror all the existing issues from this notes repository.
- [x] Remove the uuidify script after ensuring it's been superseded by barfspace-destructure.
- [x] Remove the "vendor" directory.
  - [ ] Instead of vendoring scripts into the repo, make a note page describing how all this work is done in a workspace that has all these different repos symlinked into one PATH.
- [x] Figure out what you're gonna do about Lean Notes' asset tags.
  - [x] Do a subtree-filter and split them off to their own repo (see notes on [this page][mixing] for more info).
  - [x] Remove references to them from the Lean Notes pages currently in the repo.
    - [x] Just rewrite the "Tag:" part to put the name of the tag, followed by a colon, so it's like "Protip:"

[mixing]: pbddw-54adh-m39zp-sfrtt-420cc
