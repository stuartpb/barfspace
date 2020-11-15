# Tabalanche scrollback implementation

My original idea was to make this as a generic visual component, but really, CSS can handle a lot of the complexity I had around that idea - it boils down to position: sticky, setting some explicit heights on elements based on queries that happen as the user scrolls, and making sure their viewport doesn't jerk around as this happens

## on that last part

That'd be Scroll Anchoring, which [ought to be implemented by the UA](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-anchor/Guide_to_scroll_anchoring), but if I had to polyfill it, I believe that would be done by taking the page-position of the innermost container at the center of the viewport the page before doing the height shift, then checking the difference and scrolling to the new position after adjusting the height

Oh, you can use CSS to [specifically select what nodes are allowed as anchors](https://blog.eqrion.net/pin-to-bottom/), neat

[the explainer](https://github.com/WICG/ScrollAnchoring/blob/master/explainer.md#anchor-node-selection) does a better job than the spec of laying out how anchors are found:

- the UA goes through all the elements of the scrolling element in order
  - if the element's the kind that scrolls normally (hey, by this logic, position:sticky would count as scrolling!)
    - there's also a bit about how absolute-positioned elements aren't considered? not 100% sure about the logic there
    - skip anything that's not in the frame
      - if an element's partially in the frame, look at its children
    - choose the first child in the document that's fully in-frame

okay, and any change to the dimensions of the anchor element's parents triggers a suppression (called [SANACLAP](https://github.com/WICG/ScrollAnchoring/blob/master/explainer.md#sanaclap) in the explainer) - also, modifying the `position` of *anything* will suppress scroll anchoring (this is all mentioned [in the doc](https://drafts.csswg.org/css-scroll-anchoring/#suppression-triggers))

it'd be cool if there were CSS properties to opt out of those suppressions but w/e

## anyway, scroll area, not anchoring

One thing on my mind is that the page shouldn't be as tall as everything by default... oh was this the thing timewaiter was meant to handle, introducing new elements to gradually grow the scrollback

well anyway, the idea is that there'll be a record of how many tabs are in each document, and each span of time (year/month/maybe-week-and-or-day), and on startup, the page can get that total-all-time-tabs sum, and then query the underlying pages

Is this a known strategy to calculate hierarchically for in CouchDB? the only way I can think of doing it is to emit once for the day/week, month, and year of each doc

but, oh wait, isn't the simpler way to just query for "sum between given range", emitting a count at a key of the doc's timestamp? does something under the hood keep the tree of calculations for that? I feel like Couch/Pouch is capable of efficient subreductions like that

but so yeah once you scroll to, say, last month, it'll load the size of the docs from that month (paginated, last first) as "space needs to be made"

I guess that's the key element to this, the "does space need to be made" pressure resolution algorithm

it'll never scroll beyond the (close-enough) "end", because it'll have that data from the start

one thought I have is that "Scroll to latest" (especially if there've been new stashes?) should maybe be a fixed top item, and maybe some kind of "navigate to" bar could be at the bottom
