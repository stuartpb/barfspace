# The Document Phase model

Something like POST - INDEX - HEAD - GET

I'm not sure if this maps into whatever paradigm, but here's the three-phase abstraction I'm envisioning for an abstract k/v document abstraction system that maps into a Static Site Generator and a, you know, live site with static-like characteristics.

## Discovery Profile

This transforms a document by Filename (for lack of a more concise way to say "Document Identifier" - this is only really a "filename" in the Static Profile) into a Key (contiguous with the Filename) with "header" metadata as its value (sort of like doing a HEAD request on it).

This is how documents configure their rendering parameters in the

So a "File" contains its "content", which defines its "header" and its "body"

## Path Definition

This is only relevant for the Static Profile: the Live Site is defined by (hang on... see next section)

This takes the Keys and returns the Pages, ie. every Request Path that needs to be separately rendered.

## On tractible vs. Intractible Path Definitions

If this is intractible for your use case, well, you've built something that won't work in the Static Profile, that's your problem.

In that case, wouldn't this be modeled something like 1:1 with Indexing, unless operating in a "don't prerender everything" mode?

Okay, so the thing is... yeah okay that's right. There's only "strong path definitions" (ie. ones that are tractible to define the space of) and "weak path definitions" (ie. ones where defining the space is intractible), and the Entschiedelungproblem et al mean that we can't do more than ask the user to declare which is which and suffer the consequences if they're wrong (after all, who are we to say if 4TB is too much to render over a small difference in capitalization? Maybe they have 400TB of disk.)

So yeah, it's Forward Path Definitions and Inward Path Definitions. Trying to understand the nature of their distinction in general is too much for my head to hold at one time, so I'm just gonna go ahead and stick a pin in this model and move on.

No, wait, I think I've got it. With Forward Definitions, you're taking the key entropy from the inside: with Inward Definitions, you're taking it from outside, and the key entropy just lives within the system.

## okay so here's the bit we need

You can unify with a Inward to Forward Redirection, where Inward is allowed to see the Pages. This is to make it so the Inward doesn't have to re-render just to define some manner of case-insensitivity.

## Indexing

This maps a Request Path to one or more Keys

## Body Creation

This makes a decision based on the set of Keys that match the Request
