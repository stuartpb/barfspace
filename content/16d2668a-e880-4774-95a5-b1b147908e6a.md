# Git Standing Patch Ignore

Useful for:

- not committing secrets to the repo (ie. using templated placeholders in the codebase proper)
  - no more needing to figure out how to restructure your repo to put secrets in a gitignored file!
    - or having a template sibling file!
- hacks for the local machine / dev environment
  - eg. I wanted this for the thing where I had to switch one of my releases from the Lent's Encrypt server to the Staging one

The most obvious mechanism for this, to me, would be for the "don't track these" changes to be expressed a branch, containing all the changes that should be ignored in the other branch.

## multiple branches / classes of ignored change / not even "ignored" changes

like, you could even do this to sort of invert the classic patch model, by constructing multiple changesets at once? That's kind of what I really want, a way to, like, build the blame for a file alongside the file itself

## going further with this "reverse blame" idea

Part of me also feels like this... goes EXTRA well with literate programming style - you basically have the director's commentary, in the revision history!
