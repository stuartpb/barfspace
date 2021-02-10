# Waste of bits moment version

This was an early attempt at trying to spec how the reserved bits of Moments should work that eventually shook out into the subschema

## more reflections on the notes below

Should have a distinguisher for "UTC time, bits 51-60 are part of the entropy and/or more precision" and

But yeah, bits 26-50 are kind of, like, yours to play with, if you feel like it. Like, I might call this `01EQ8-DRAFT`, because that's the 9-hour period around when I started working toward this, and I don't really care about the specific time that represents (incidentally, it passed in the time it took me to write this line, between `01EQ8-DCQPG` and `01EQ8-DX6ZJ`)

## Types 4-7: Momentary Twenty-Questions Tree

The `1xx` QUID forms are all "hybrid" identifiers, in which the first 50 bits represent the (signed) number of milliseconds from the Unix Epoch (ie. any date between 33708 BCE and 37648 CE), and the remaining 72 bits represent a position in a binary tree defined by that moment. This binary tree may be partitioned

The boundary between "timestamp" and (ie. the boundary between the second and third pentet) is soft: if more-precise timestamps are needed, the further levels of the tree may be used to subdivide the millisecond to whatever precision is possible (though, on most hardware, at some point you're liable to run into quantum effects anyway). If more entropy is required (ie. 80 bits), the momentary precision can be reduced

## The subdivision

THIS SUBJECT IS STILL SUBJECT TO JUGGLING

The second bit is "Indirect", and the third bit is "Persistent". What these bits mean:

- "Persistent" Momentary QUIDs (types 5 and 7) are ones which, like Type 1 vs Type 2, can be reliably reproduced if you aren't the party that generated the ID. It can also be thought of as "Published".
- "Ephemeral" (types 4 and 6) can also be thought of as "Internal".
- "Indirect" (types 6 and 7) can also be thought of as "synonymic", or "tentative". The same tree might produce several equivalent Indirect IDs for the same loose concept.
- "Direct" (types 4 and 5) can also be thought of as "Canonical", or "unique".

These are all just meant to assist human recognition of the guarantees of the identifier within

Maybe it should be "which side of this would we more likely want more precision on"? That might be the elucidating question for at least one of these criteria

Maybe it's like "which one do you think you'd need more of, and would you be more likely to be right about that than for the schema to need revision before the heat death of the universe"?

## Reframing the bits

- Are you more space-constrained than time-constrained within the 50/72 time/space Shannon boundary?
  - Recognize that, with millisecond precision in the mix, the odds that your use case needs more than 72 bits of uniqueness is unusual: that's already enough that you're already 256 times past what we think is enough to represent all addressable RAM for all practical computer architectures in the forseeable future of human civilization, *just in that millisecond*
  - Framed another way, in that light: are you genuinely likely to need more than 72 Shannons of entropy (random or otherwise) per millisecond, but not the full 122 Shannons that would disentangle it from the timestream?
- If your answer to the previous question appears to be wrong, is the mistake probably yours, and not all of modern science? (Only set this to 0 if you are willing to publish a peer-reviewed study to that effect.)

This protects, as much as possible, against collisions, since it isolates the ID by "mistake space", so overflowing space won't impact IDs that want confidence in the

I think the four-state might be something like "I need exactly the 50/72 tradeoff and messing with either one will perf impact my system"...

That's probably the way to express it: "my model violates random entropy expectations on this side of the division"

## Why 50 Bits?

This is inspired by the 48 bits used by [ULID](https://github.com/ulid/spec)

The era is selected in part to respect The Long Now, and in part to compensate for human error. This can be described in terms of the "Smart Jon Bois Problem" and the "Dumb Jon Bois Problem".
