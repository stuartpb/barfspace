# There Ain't No Such Thing As A Compliant Implementation

https://stackoverflow.com/a/3558200/34799 gives a great example: a browser that's maximally compatible with web content has to have a quirks mode that would be theoretically compliant with previous standards (except for, y'know, all the compliance-breaking hacks browser vendors copied around like [the one that makes you have to write `monospace monospace`](https://stackoverflow.com/q/38781089/34799)), and actually complying with stuff like the SGML `</`

This is the thing: the details are *so, so, so* much more that just what the spec says. Some of this knowledge, this meaning, this agreement, is only stored in the commit messages of the browsers that invented them. Some of it's only in the bug tracker. Some of it's only in private email threads. Some of it was only ever spoken aloud, and it will die with the engineers that devised it.

anyway, it'd be cool to make something like "the Ugliest Spec in the World", that details *allllllllll* the known quirks to have ever been seen in the living web (

## lifecycles

Quirks have three lifecycles:

- Their lifetime being introduced in browsers
- Their lifetime being exploited on the living web (ie. you'd need a browser to match the quirky/underspecced behavior)
- Their lifetime being noted or recommended in published revisions in standards documents.

A quirk can become "ascended" if it becomes an actual part of the HTML Living Standard.

## Ascension of Quirks

Recommending against, or deprecating, within a standard blemishes it, but doesn't kill it unless the web ecosystem / browsers follow suit.

that's maybe another angle to consider, though: "how common/well-regarded was this practice on the web" - like, was it just added to clean up after sloppy authors, or is it something that some people still regard as best practice? not all of the former get an opinionated judgment against them (ie. deprecation) in the spec - and sometimes, the former moves to the latter. (Look how much of HTML was "sloppy relative to XML" circa 2000.)

## how does vendor support work into lifecycles?

this lifecycle goes by the last supported browser version to either have the quirk supported naturally, or to have the quirk supported in a quirks/legacy mode.

like the other parts, special support contracts for proprietary internal systems don't count. The idea that there's some highly-important kiosk out there that can never be upgraded beyond IE11, which has an underground government tiger team that will maintain it until the nuclear apocalypse, does not mean IE11 has eternal support.

same goes for non-branded forks with less than .01% market share.

once the vendor no longer supports the last browser version that supported a quirk, the First Lifecycle comes to a close.

## how does browser support work into lifecycles?

it defines the window of the First Lifecycle (the milestones being defined by the edge of vendor support)

Well, it's definitely something to track. It can be like the world's shittiest caniuse

## lifetime

- only pages published contemporaneous with the browsers that ran the quirk
  - if I can come up with a new page that would need to exploit an endangered/extinct/somehow-never-before-noticed edge case for Netscape 2.0 tomorrow, that doesn't make it a Legacy QuirkThat Must Be Supported
- When evaluating web presence, we don't care about internal software. If you're going to ship some proprietary intranet piece of shit that you're not telling anyone about, you don't get to call takesy-backsies once the non-compliant behavior you relied on starts going browser-support-extinct after going surface-web-extinct. (we'll still note you, mockingly, but you won't factor into the calculation.)
- Quirks

You could even have "the Dead Ugly Spec", which collects rules that no longer

## examples of endangered quirks

quirks that are almost gone from the web, and soon from browsers as well

## quirkified standards

underloved specs that never got widespread enough adoption:

- SMIL
- the aforementioned SGML bits of HTML

embarassingly, the New Order of Chromium monoculture potentially means we'll never see specs in this zone again, or at least until another major, Blink-tier fork: they'll either languish unloved but unretired in the Chrome codebase and in a majority of the world's browsers, or they'll die with only support in friefox.

Eh, it's still better than life under IE6.

## examples of extinct quirks

and some of these were *standard!*

- there's got to be some XML things that died before they ever lived

## see also

This kind of overlaps Evergreen Targeting, it'd form a bigger target to get looped in with it
