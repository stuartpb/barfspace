# Viva La Firefox

I've started using Firefox as my main browser on all my non-Chromebooks.

The main reason for this is that Google's tipped their hand with this DeclarativeWebFilter fuckery (ie. everything linked at the top of [this Hacker News page](https://news.ycombinator.com/item?id=20052623)), but also:

- Edge moving to Chromium puts us dangerously close to an IE-style monoculture again (reflected in the comments around said Hacker News page, sentiments only mirrored harder on Reddit and Twitter, though the monoculture worry is being expressed less loudly than the blocking API issue)
- There's that fucking bug with the massive lag spikes due to font processing on Chrome
- I should be getting out of my shell more
- Firefox's perf is really good

(Incidentally, between this and [Google Cloud going down this last weekend 2019-06-02](https://news.ycombinator.com/item?id=20077421), Google has really been taking it in the pants lately)

I've been thinking Firefox First should be an initiative, as well as Chrome Is The New IE (explaining the problems we're looking at).

## Related

- [Browser Extensions](aqwqk-rbhx4-6vanm-hm867-cfewx)
- [firefox code-server headaches](x32m1-bvqkq-rmapx-yjgbh-j97ra)

## Tweaks I've done

Starting with Stushiba, although I'm also switching on Stuzzy.

Pulling from https://wiki.archlinux.org/index.php/Firefox/Tweaks

- Had to screw with the default fonts so [Wikipedia][] doesn't display in DejaVu Sans.
  - Switched the default to Arimo.
- ~~Changed the theme to Dark Mode, because I can~~
  - UPDATE: I have changed it back because too many favicons are too dark - see the note on how there ought to be a feature for dropshadows below
- [fixed tearing on Linux](7gdmn-90cj8-g7aqe-8jvf2-wfkge)

[Wikipedia]: https://en.wikipedia.org/wiki/Wikipedia:Typography

## Observations

I like how having the tabs scroll after a certain density (letting them show a *bit* of title), on top of making it easier to tell the difference between a lot of sites' tabs, helps keep them *distinct from your pinned tabs* once you hit that density.

Hmm, the MDN docs aren't showing zillaslab, what's the deal with that? (was this a caching issue? I think this font works now)

## papercuts and mild frustrations to look into

Is it possible to disable middle-pick-paste? On one hand, I kind of want to keep it just to see what breaks (ie. Theia's tab-close handler, which I haven't reported), but on the other hand I hate it with a fiery intensity and never want it, ever

Is there any way to get back Chrome's "instantly display answers from the omnibar/awesomebar" thing, where I can eg. type a math problem and it'll show the answer without me having to hit Enter?

## ideas for mild enhancements

(these would be in the realm of "things Chrome doesn't already have yet")

Hey, does this project have an "I want to propose a feature and add it to the codebase, who do I talk to about that" person?

- Icons should be assessed based on their total difference from the background color
  - (or, you know, at least their edges)
  - and if it's within the "negligible" range, the browser adds a contrasting dark/light dropshadow
  - this is also kind of [ChaChaCat](mxnkz-azkhk-g3aas-tvng5-vbf8t)-adjacent
- It'd be nice if I could tell which side my active tab is scrolled off to

## Container observations

https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/ installed, haven't found an opportunity to start using it yet

## other addons

https://addons.mozilla.org/en-US/firefox/addon/voice-fill/

https://addons.mozilla.org/en-US/firefox/addon/laboratory-by-mozilla/ seems like it might be a nice webdev tool

## Thoughts on Tree-Style Tab

I've also heard good things about https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/

UPDATE: I have installed both of these and am loving Tree Style Tab, might start using it instead of Tabalanche

I'm thinking it'd be cool to have only pinned tabs in the "tab bar" (and thus not in the TST sidebar), and then the rest of it is the page title

I am *loving* TST's reparenting by succession logic (the eldest child becomes the parent, and its children become siblings of their parent's former siblings)

## Other stuff I'm finding

https://color.firefox.com/ seems like it'd be a nice themey thing - is it possible to make these apply dynamically based on the container of the current tab? *that'd* be smoething I'd like

## other addons I'm not yet installing

https://addons.mozilla.org/en-US/firefox/addon/notes-by-firefox/ lololol

see also https://github.com/mozilla/notes

https://github.com/mozilla-lockwise/mozilla-lockwise.github.io - isn't this just a password manager, But From Firefox?

## addons I had in chrome I should look into

- How's Firefix's Tampermonkey? Is it superfluous (seeing as how Greasemonkey started with FF and everything)?
- The extension to block w3schools results in Google would be nice
- A user-agent switcher, too
