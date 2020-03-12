# dat git remote

looking at substack's incomplete thing, looks like he was trying to implement something like a Git view on Dat revisions (and failing because [you can't just hand Git some arbitrary sequence of bytes from a different system with a different hash function and call it a commit hash](https://github.com/substack/git-dat/blob/master/cmd.js#L48-L51), nor [vice versa](https://github.com/substack/git-dat/blob/master/cmd.js#L74))

like, I sorted through an agonizing amount of old npm versions and GitHub releases and shit to try to understand that line (to the point that I actually cloned it and ran `npm i` so I could inspect the code of the deps it pulls from), and the best I can figure is it's diving into an undocumented interface to pull the SHA256 for the tip of the tree (see the definition of `Feed.prototype.head` in hypercore/lib/feed.js)? it's weird, because this doesn't even make sense as a preliminary functionality, but... whatever. I guess this is just one of those early WIPs where you're just inserting pieces of code you'll probably want, even if they don't actually fit together, because you'll at least get illuminating errors reminding you what you still need to implement (ie. actual commit translation)

## regardless

bottom line, substack's lens-like remote (which I do think would actually be a cool remote driver, but call it something like `git-hyperdrive` to communicate that you're translating to a different model, instead of a transport) isn't what I thought it was when I saw there was a "git-dat"

what I would like - and some of this, I feel like I need to get more into multi-writer Dat before I can describe it with certainty - is a "remote" that can push and pull from *an actual Git repository tracked in Dat* - ie. a hyperdrive for a `.git` directory

you can kind of do that now by just having Git track a directory and pushing/pulling from that like it's a Git repo? and, like, peers need to be syncing your files anyway, so that's kind of all this would boil down to?

but, like, no, because this would be a way to potentially *not keep the Dat on your system* is the idea. like, you can just let Dat be an outside substrate
