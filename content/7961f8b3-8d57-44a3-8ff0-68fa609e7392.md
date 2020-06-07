# ULIDs: a UUID v7?

background: https://github.com/ulid/spec

So, thinking about it: you would only have to restrict a few of the current "random" ULID bits for the lexically-sortable 48-bit-Unix-timestamped ULID to become UUID v6, with all the advantages of ULIDs

Can also contain the thing in the spec that you may choose to use subsequent IDs or straight-up shave off bits and claim a subset of the random ID space to, say, create a limited-scope ID namespace (ie. you're using at least the first 80 bits, ie. the 48-bit timestamp, the ~~6~~ 7 UUIDv6 fixed bits, and ~~at least 26~~ 25 of the random bits, to prefix a namespace some subset of the last 48 bits)

The idea is that, in terms of long-term use like this, you probably

## don't let this get out of hand

we WOULD have to impose the restriction that, in the interest of preserving uniqueness, this not be used for namespacing

## anyway

so the "middle 48" (the three 16-bit chunks) are all kind of like your "assured random-ish region", and the bits you're allocating are your "monotonic reservation"

this acknowledges what people were doing with UUIDv4 already (ie. Ceph with `ceff`)

This also takes advantage of ULID's natural presentation form of Base32 - your "namespace reservation" can be an *all* the way hack

so in a ULID, the first ten characters are the timestamp, the next nine(?) cover the reserved random region?

to expand on the diagram from the original ulid README:

```
tttttttttrrrVrrZxxxxxxxxxx
```

breakdown

- t: timestamp (10 characters)
- r: random unless you're nasty (3+2=10 characters)
- V: based on the assigned version number, one of two characters
  - v6 is kind of boring (6 or N)
    - Kind of a good idea to avoid this anyway, as UUIDv6 has [a marginally-popular established format](http://gh.peabody.io/uuidv6/)
    - Already proposed [as a Standards Track document](https://tools.ietf.org/html/draft-peabody-dispatch-new-uuid-format-00)
    - https://github.com/ulid/spec/issues/10
  - 7 would be 7 or Q
    - matching the proposed reserved bits
  - UUIDv10 would make it the "James Cameron Character": always A or T
    - Which also allows it to be pretty neatly hackable
  - UUIDvB makes the most sense as "version 11 UUID",
    - where the version would always be either B or V
    - also it's funny because the "ULIDification" of "ULID" is "V11D"
  - I like version 13 (D or X)
    - would also make examples using `vv1d` a thing
- Z: 7, F, Q, or Z
  -  ~~W, X, Y, or Z~~ whoops that's not how this is aligned
- x: random / monotonic (10 characters)

```
rVVvvRrrrRrrrRrrr111xXxxx...
RvvvvRrrrrRrrrrZz111Xxxxx..
```

## why this uses the "reserve pattern" of 111

Not quite sure how strict the [variant part](https://en.wikipedia.org/wiki/Universally_unique_identifier#Variants) has to be, but I think we can safely say we've given up on the idea of "network order" in this representation

by the time you're reading this UUID format, you're not at the point where you can glean any information from those bits other than format conformance anyway

since this is a "new meaning", and those three bits happen to align at the end of a character, I think this is warranted.

It could also take the `10x` pattern, which would accept 4, 5, C, D, M, N, W, X

Or, heck, you could accept either, making the set 4, 5, 7, C, D, F

You could even permit the "Microsoft exception" 110x pattern, neffectively making it so the only pegged bit is the middle one (avoiding Variant 0)

But, ultimately, I like having the version that reserves 3 bits, as that makes the base-32 version easier to pattern match against

## and anyway

of course you can always downconvert to UUIDv4 for compatibility

maybe the additional fixed bit from this proposal is used to signify "this is a subset of UUIDv4 that definitely looks like a ULID"

In fact, you know what, the more I think about it, the more I think you... kind of gotta do it that way

I guess the reason I was thinking it should be a "new version" of UUID is because this cuts into the possibility of colliding in UUIDv4 random space

## Links around here?

- Proquints / badifogu?
