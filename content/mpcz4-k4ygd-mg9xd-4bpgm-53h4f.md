# UUIDv4-Q3ID Isomorphism (Q4ID)

Take the random bits of the UUIDv4.

The first 15 random quartets (ie. the first twelve, then 14-16, skipping the fixed "4") are translated into 12 Crockford-Base-32 Digits. These are represented with hyphens

The 13th digit (ie. middle digit) is "8","9","a", or "b", according to the 17th quartet of the UUID (ie. the first threee digits of a Q4ID are reserved as `010`).

The remaining 15 random quartets are

## benefits

- Twice as precise with every character!
- Save 7 characters!
- Lose the 4 fixed bits that just say "the rest of these are random"!
  - Where UUIDv4 reserves 6 bits, Q4ID only reserves 3 - *a 50% savings!*
- Use more of your keyboard!
- Crockford Base32, so no homograph collisions!

## interesting thought

If you're willing to ditch the version number (beyond maybe a flag), this system can actually cover all "UUID data". And, realistically, you're either using a system that is already making the distinction, or you're treating them as random IDs: if you need to get them back out to a system that uses a different version, you'll know how to detect the pattern as matters for you.

## Actually, extended spec

It seems to me that there are three sources of "ID" that you really want:

- Hashes
- Random ID
- Moments (ie. sequential identifiers based on a timestamp prefix and random suffix, like earlier UUIDs and ULID)

And, oh hey, look how many "wonky bits" we reserve in this spec.

So, here's what I'm thinking:

- `001` is the mask for an Output, where the ID is derived from something like a hash with the reserve bits masked.
  - The idea being that this would be a great usability extension for Git, as long as we're migrating away from SHA-1
- `010` is the mask for a Random (as well as I think `011` for compatibiltiy with "variant 2" UUIDs?)
- `100` is the "separator" between the timestamp and (most of?) the randomness.

When generating Moments, to guarantee there will be enough space, you can specify howe many bits should be zeroed initially: exceeding this limit introduces the theoretical and minute possibility of crashing into another instance, but eh
