# notes metadata backend idea

the Final Arbiter of Truth is still the tree of notes, but it'd be nice to have a simple system for synchronizing the linkage metadata (it can maybe validate in the background)

https://github.com/MikeBild/graphql-pouch

so yeah, and this might tie into the levels-of-commit-and-branches idea of the notes continuous integration pipeline or whatever, when it rebuilds the metadata for the new content? just so content/buffer changes can get synced quickly (ie ~realtime) in the "here-are-unsquashed-deltas" or "here-are-squashed-but-not-applied-deltas" levels (which also form the undo stack? yeah, this is a thing, this starts to blend into IDE features - does Monaco let you override the undo system? does it already have a layer like this?)

anyway, yeah: the tree is the Final Arbiter of Truth, but changes can live in an outside system, like other branches or IDE undo buffers. getting the latter into the former, or having some other way of preserving and synchronizing them,

don't forget that it's nice to be able to prune undo buffers / backspaced text, and that there was even thoughts of having a "garbage collection" setting that would smooth over spans in the buffer changelog like that

but yeah, maybe once a change is committed to master, the buffer deltas (which may have been exported to a branch, in squashed form) are exported (somewhere - possibly internal!) to a Git branch describing a branch of changes

mmm! yeah, I like this. like a "true-wip" branch - and, like, the "wip" branch may be what gets merged? but those commits can still be arbitrary

maybe you even have a different tree under refs/ than heads/? or just a different tree under .git/refs/heads/ (which I think would make remote synchronizing easier?)

oh man, okay, I've definitely got an idea that would be swell: [IDE Undo Buffer Git Remote](1dzb3-gbj93-ma8t8-p06mh-3j1mh)
