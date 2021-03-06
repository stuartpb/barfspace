# Label-based HOARD Concept Postmortem

Project HOARD was an attempt to organize my stuff so that I wasn't just piling things up in random corners, but putting them *away*, in a fashion where I could *remember if I had them*, *retrieve them if necessary*, and *put them back when I was done*.

This started by buying some black Profesional Box bins from Costco, as well as some plastic shelves. I started recording things I was putting in the bins by hand-writing Post-It notes that I put on the pin, and I would take the Post-It notes off when taking an item out (signifying that the item was out, and that it should be put away where it was retrieved from before getting another item).

However, this ended up getting messy, quicky: I'd have trouble reading my hand-written notes to find things, and the sides of the bins would get cluttered with notes before I'd be even remotely cloes to recording everything that's in the bin.

Some time around mid-2016 (I could go back and check if I cared), I bought a Brother label printer for my PC, which I was thinking about incorporating into some kind of cataloguing system (influenced by talks I'd had with Andrew Perti). I decided I would buy some removable label paper (hoping for the same kind of reusable-placement I'd had with the Post-It notes) and use that as the basis for a new cataloguing system with the characteristics of my Post-It-based procedure.

My original conception for Project HOARD was to use the labels as an "authoritative source of truth" for a computerized cataloguing system: every item was printed in OCR-B text no more than 14 characters to a line, and bins were given designated UUIDs, which were encoded into QR codes and stuck awkwardly on the faces of a few bins for testing.

The idea was that, if I wanted to find an item, the system could see if it had a record of where that item was, and if it *didn't*, I could scan the labels on the bin with something like ARCore to update all bin records and auto-highlight items that matched the search term.

While this concept did put low-tech viability at the fore (when the technology is down, items can still be found, just not recorded), this has a common characteristic to [my old bad ideas][MOBI] in that it prioritized a *theoretical future system* over simplicity in filing (though, in my defense, at the time, I was blaming my handwriting for why it had gotten so hard to find things with the Post-It notes, so computer labeling seemed like a no-brainer).

[MOBI]: yfsxd-ek388-ct9ye-xb9we-qb9mj

In practice, this worked better than the Post-It notes, to a point: the notes took up significantly less space on the fronts of the bins, and the legibility-optimized OCR font made it significantly easier to find items by reading. However, there were a number of hurdles that eventually led to the system breaking down (predictably, by me just failing to put things back altogether, rather than the data going out of sync like I'd fantasized being a failure case):

- The printer does not have reliable Linux printing facilities (I've got a note on my endeavors to fix this somewhere I think in the petlogs), so I could only print labels for new items under Windows (which I eventually couldn't boot into due to a login issue).
- The "removable" labels were not "removable" in a multiple-use sense: even applying them a *first* time made them prone to fall off of the surface they were applied to. (Some of this can be blamed on the matte texture of the bins, but not all.) Labels would have to be re-printed if something were filed into a new bin, and labels for "checked out" items
- I eventually chose to switch from white paper to yellow paper for aesthetic reasons, which led to an inconsistent layout on most of the bins I had filled before switching, and making it so that I would hesitate to produce labels when it would mean having to switch from another kind of paper loaded into the printer.
- The complex shape of the bin sides meant that much of the space on the bins' front faces was unusable: there were essentially six "columns" in which an item could be listed (and due to the aforementioned issue with moving labels, that placement ended up being persistent, averting any kind of logical re-ordering).

One good concept that survived in practice from this, as part of the original conception but adhered to out of necessity due to the inability to re-label bin contents, was that momentarily using an item didn't entail removing it from the labels on the bin - I just kept the bin in the Loading Area (the part of my apartment that stays clean for VR use) until the item could be placed back into the bin.

There's also a thing I'm not covering here that will probably get listed in the non-postmortem page because it's still a good idea, where all items are bagged (if they can fit) when they're put in a bin. This idea comes from police evidence systems, but it works well for ordinary household use in this system as well. (I don't follow it for things like canned goods, though.)

Anyway, after needing to get things picked up around here and having the label system offline for long enough, I'm trying a new revision of this concept: I'm cutting white contact paper for dry-erase markers into shapes to match each bin's front face, and then I'm going to start writing the bins' contents on the whiteboards, along with any other "guiding" data (like themes). This concept mirrors the "let your data structure be improvised and heterogenous" theory of the "bagtent" system I use for my notes. My hypothesis is that this will make it easier to create emergent, organic structures that will let me recognize each bin distinctly better than the old every-bin-looks-more-or-less-the-same layout.

Needless to say, falling back to a lower level like this allows for more experimentation with mechanics that might be useful: I'm thinking I might cross out items that I "check out long term" with the date that I'm removing them.

I'm also thinking I might introduce a system like the one I'd originally conceptualized for tracking what item's in each bin, but I'll make it simpler by having it just recognize UUIDs as rectangular DataMatrix labels that both bins and bags/tags will have: items can then be associated to a bag/tag, and dis-associated with them just as easily. (Photos will also have a higher priority.) This will require finding a good DataMatrix library, hopefully a real-time one.
