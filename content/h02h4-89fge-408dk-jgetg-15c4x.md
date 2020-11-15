# possible notes git flow

remember to .editorconfig autosave

saves and commits to a wip branch automatically on the shot clock. switching to a wip can be added as a feature of the polling, I guess?

and then, yeah, the rebasing. I was thinking the first level of WIP would be "every save is a new commit", and then those get rebased into commits on the shotclock's "cut commit and push to master" strategy

and there might be a thing to hold these in auto until it can be merged back to master with summary edit notes for each of the shotclock-cut commits (aka "wiki publishes")

can that level of rebase (ie. the shotclock) be determined retroactively based on the commit pattern of the "every save" branch?

have I thought about how this'd need aggressive gc? I mean, I think the current approach is already like that with the index anyway, but, y'know

that's another thing: is it possible to just, like, reflig the index? Is it possible to track this kind of construct via Git without making a full-fledged tree?

I think this is starting to morph back into my classic "deltas and keyframes" idea for ie. Penciltape

## penciltape nodegraph diversion

So there are "big unnamed sections" that are keyframes, and you can also name a revision to keyframe it

and you can delete keyframes? I don't know

going back and undoing... does that always keyframe?

I made a tweet the other day about being able to rebase undo history, ie. when accidentally doing linework on the sketch layer

## anyway, Git

the core idea here was that the WIPs are auto-synced between the user's mesh/systems (like, via a directory kept in Syncthing? both Objects and Remote Refs somehow, maybe each node updates itself?), but not to a public remote

or maybe those bits get magicked via Dat's Git implementation thing.
