# Undo History to Git Branches

So, I've just been reading up on custom Git remotes

One of the big thoughts I've been having for the notestack

I know some editors - like, C9 definitely did - persist the undo buffer

this thing I'm coming up with using Pouch docs as deltas / WaysIDE / whatever would definitely be suitable

convert from that format to Git trees, at a configurable (query string?) squash

you could then rebase these and sync them (or even sync them, then erase your history)

a thought I was having is that this might expose an interface like /refs/buffers,

maybe that interface is also configurable?

how much of this should come from the gitconfig? is it possible / advisable to let the interfaces be mixed-and-matched (like /proc and kernel options kinda sometimes do I think?)

what'd be nice would be to have this be *two way*, so you could use Git daemons to *rewrite your edit history* (ie. use the Git interface as your common driver) for that garbage-collection-and-forensic-secured-preservation or whatever system

looking into this, I'm noting there's one mention I could find of someone doing this with Vim's undo history

I'm also seeing something with Emacs? "undo tree"? is that a filesystem interface to undo history?

the interface I was thinking this'd be would be like you'd remote, say, `edhist:/stuart@my-editing-vm.internal:workspaces` (where the bit inside works like normal Git host matching, @ is considered to be ssh, bare paths or whatever are considered local, etc) and then

oh yeah, that's right. the thing I was thinking is that this'd definitely have to live next to a Git repo, and you'd have the edit histories branching off from Git commit states from the actual refs/heads tree of the last commit (with the undo history before that commit in a separate "wip branch" / ref representing a series of deltas prior to the commit)

but of course since that's a matter of parentage, you don't have to worry about way-too-granular commits

okay, so, yeah, the idea was that there ought to be a system to push these as public drafts / internal synced drafts in squashed form after a "Shotclock" (maybe 24 hours) expires - at least for syyncing. You don't want the drafts to get stale in this notesy mess.


