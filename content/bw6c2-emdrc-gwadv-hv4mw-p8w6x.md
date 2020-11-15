# pseudorandom extension?

I don't know if this is dumb or overcomplicated or how it already works, but:

if I had an infrequent source of entropy I wanted to produce a non-blocking stream of randomness from, I could do a running hash of the bytes from the entropy source and a "secret salt" based on a sliding window that uses, like, bytes from the entropy pool inserted as well as the suffix to the hash used the make this hash. Like, I'd start with the hash of (let's say it's a 32-byte cryptorandom hash) 32 bytes from the entropy pool, not reveal that, hash 16 more bytes of seed data with the first 16 bytes of that, hash the last 16 bytes of that first hash with the first 16 bytes of this new hash, etc.

if you need to provide random bytes at any time, you provide the hash of whatever this is, and then iterate that chain so the next call will hash different pseudorandom data

but this way you can't use the results of a call to the PRNG to construct what subsequent calls would look like, unless you have a snapshot of the PRNG state and are analyzing for what the seed data mutations could have been?

oh yeah, so I was thinking you'd also have the "upstream window" be out of some pool, and determined by the latest secret byte (or whatever address space) - that would also make it so, even if you know a thing about the address pool, you'd have to track too many variables / levels of hashing to follow it... because you wouldn't know exactly what data your sample came from, based on...
