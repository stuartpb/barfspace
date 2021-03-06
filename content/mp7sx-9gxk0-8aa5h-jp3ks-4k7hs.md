# Git stuff you'd need/want for federating a wiki

This applies for all the different applications currently tracked on the page for [federating barfspace](nfwjw-tvvm0-gkb2e-k3xhv-h6f7k). (Most of these musings predate the UUID structure, but are otherwise still relevant.)

Collaboration would be awesome: have other folks just clone the repo, fire up autocommit.sh and go hog-wild themselves

looking at this as a Second-System, the only real change I'd suggest would be that the repos should just have the content, with tooling living outside and versioned like a normal Git project

"so the basic idea is, what if tumblr was a federated wiki, wait where are you going, no come back"

inside the federated barfspace, you'd want to make a few changes to the normal Git built-in flow:

- pulling from a repo would only take the files without conflicts, then create separate refs (like branches) for the changes in each file that does have a conflict, to be reviewed on an individual basis

actually, should it? like, what about when something in one file of the repo refers out to something that was written in another file; maybe conflicts really should work like a traditional conflict, where the whole tree has to be reviewed

anyway the big question I guess is how you deal with the way that remote refs are constantly being rebased and rewritten - like, I think remote tracking doesn't have a fast-forward constraint so that's fine?

i guess the real change in the workflow would be that each merge would just be like "here's a new merge from this completely alien tree", and sometimes it'll diverge on a commit that was rebased so you'll have ten versions of the same commit floating around in your history from doing twelve merges (where one merge might have introduced five variations as part of its own history), but who cares

maybe it's considered polite to have your pullable ref squash history on a pretty broad-strokes basis so as to avoid hairy replays

okay so I don't know if there's already an interface in Git for this, but a view where, after you fetch refs for all your remotes, you can see a digest of what's new since the last time you reviewed your news feed or whatever you'd call it, like `git log -p` for each ref, and intermingled, and only going based on the diff between when you last looked and now

so I guess the thing would be making it so merges are more easily cherrypickable? like, is there a way to say "credit the author of all the changes I'm pulling in this commit, collapse all the sequential changes that had the same author into one commit"

is there a way to say "trace the commits that introduced this content and make a new commit that calls them its parents" I don't know I guess that's just kind of ridiculous, just make a squash like what I was describing up there, one that runs and makes sure the blame's the same for all, and splits up commits if there are multiple authors to credit

like, the thing I'm trying to figure / recall if there's a tool for: is there a way to cherry-pick merges by content? "merge this line, not this line"? and, really, to not even get reviewed on most of the changes, like a way to say "I just want to take a piece from this one file", or, like, maybe they'd like to do a series of commits based on one commit someone else put out
