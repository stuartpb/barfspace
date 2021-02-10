# A Fuller QUID Spec

There are, of course, 8 total possible types of identifier within our three reserved bits.

The nature of universal identification within the entropic space often raises the question: why reserve bits at all?

## Type 0 (0-3): Never

Type 0 is Strongly Reserved, and MUST NEVER BE USED. For the purposes of soft cryptanalysis (ie. parsing an unrecognized file format by pattern analysis), a field of even the most mixed pool of Universal Identifiers will always contain at least one positive bit within the Reserved Field, whereas every other form of identifier is believed to plausibly produce triple-zeroes at any point (though Moments will hold triple-zeroes for long contiguous stretches of time, they also tend to have more contiguous bits that identify the Date span).

This pattern is ONLY acceptable within the context of the Null QUID, ie. that which is represented by `00000-00000-00000-00000-00000`.

## Type 1 (4-7): Reproducible Random Bits

Type 1 is the output from a function that turns its input into at least 128 bits of entropic data. The nature of entropy SHOULD make it that the particular details of this transformation do not need to be understood.

## Type 2 (8-B): Arbitrary Random Bits

This is directly compatible with UUIDv4

## Type 3 (C-F): Softly reserved

Type 3 (C and D in particular) is softly reserved for strong compatibility with UUIDv4, to express the deprecated Type 2 identifier. Reserving Type 3 also reserves E and F, the remainder of the 0-f hexadecimal range, for rough compatibility with existing "basically any 128 random bits is a UUID" implementations.

Unless compatibility with Type 2 UUIDs is required, QUID Type 3 SHOULD NEVER be used. The additional half-Shannon of randomness that could be gained by mixing both kinds of UUIDv4 is not worth the loss in uniformity, and the further half Shannon that can be obtained by using E and F (breaking strong UUIDv4 compatibility) is *certainly* not worth it.

[Older moments spec](p793c-6e9dh-4e8xp-906gw-pyccw)

## Type 4 (GHJK): Global Moment

40 bits representing the current second, and then the rest can be whatever monotonic time measurement the system is able to produce to the best of its ability, recognizing that clock drift happens.

Some systems may use a source of milliseconds for bits 41-50; others may use nanoseconds for bits 41-70. In any case, the one guarantee here is that the identifier is loosely-ordered within the second.

If you intend to increment the entropy bits without simply resampling from a monotonic source, consider a global Subschema instead

## Type 5 (MNPQ): Local Moment

Bits 51-60 of a Local Moment encode the UTC offset:

51: sign bit (1 is negative)
52-55: number of hours
56-59: number of five-minutes
60: "weird bit"

In practice, time zone offsets that do not lie on 5-minute boundaries are rare: they can be distinguised by use of the "weird bit", which can offset the time to whatever "weirdness" applies within that general offset (if no such lookup is available, this may be treated as a 2-minutes-and-thirty-seconds divisor).

## Type 6 (RSTV): Global Subschema

a Global Subschema allows for an epoch to be set, and for systems operating within the subschema

a Global Subschema is like a Global Moment, but without the strong guarantees about accuracy

Remember that [all of Twitter fits into 64 bits](https://github.com/twitter-archive/snowflake/tree/snowflake-2010#solution)

If you wish to make an arbitrary ID based on a word-like mnemonic to define your subschema, conveniently, "R", "S, and "T" are all very common letters of the alphabet, and "V" can be used as a stand-in for U, as the Romans used it for centuries. It can also be used to create a "two-digit version" for your schema that can ultimately fit 1024 "version numbers" (past that, it's probably time to increment the millisecond).

## Type 7 (WXYZ): Local Subschema

By using this, you're asserting that the first two digits of the middle pentet refer to the UTC offset (ie. time zone, more or less) in which the schema was invented. It is a more explicitly geo-centric namespace: for example, UTC offset at an epoch can be used to distinguish between data centers.

In fact, I'm thinking the last 10 characters should be an Open Location Code, and then you have some variant of "X marks the spot" - just like the 11th and 12th encode the UTC offset (which can be zeroed), the 14th and 15th can encode subgrid precision
