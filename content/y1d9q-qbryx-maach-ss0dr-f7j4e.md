# Firefox papercuts & nice things

## the search sucks

the @ behavior is nice, but it should be able to detect and suggest these keywords automatically - when you're used to Chrome's behavior, having to type shift+2 first is a pain in the ass.

adding the search engine keywords without an @ does not give an equivalent experience

there don't seem to be keyboard shortcuts for selecting a search provider from the "one-click" bar

firefox can't just go ahead and search for domains that clearly won't resolve like "package-lock.json" or "element.addEventListener"

honestly, including Bing in the search bar next to Google makes me not take that whole row seriously: I've removed it in my stushiba layout

## sort of side musing about how Firefox does UI update rollout

one thing Firefox does that's cool is "You haven't updated for a while" to refresh your UI on an *opt-in basis* - this would be a cool thing to consider in my Windowsystem Metabrowser:

- a sync infrastructure that shows you how you've got your UI configured on different devices
- maybe something like a thing that lets you bundle changes as declarative packages, like Nix?
- a thing that shows you recommended changes as a patch/diff (that you could even cherry-pick) would be awesome, especially if there's a (blame-style / changelog / blog-post / FAQ feature summarizing each version-to-version change to the user)

it would be cool to derive this from the commit info in a different Git tree / a subtree or something, where releases for the UI / preferences / config are delivered from commits in a branch that has all its commits written ready for presentation in this patch-like format

## another thing about Firefox I kind of like with caveats

it's kinda lame that Firefox has address bar icons, as Chrome straight-up removed these, but I kind of like how they can be easily moved into the overflow menu and it's not weird and gross like Chrome?
