# DHT Partial Discovery Announcement

So, like, you could have a Dat-or-whatever have some metadata that says "if someone asks for the first twenty bits of this file's hash, announce this as an option"

it's designed to make discovery easy under an assumption of

the number-of-bits-needed is to allow for the name to be a long enough "password" that it coudn't be guessed.

anything less than 8 is probably too broad to allow: narrowing it down to one/256th (three badifogu letters / one alphabi word)

80 letters is generally considered "random enough to not be discovered by chance": that's one full terminal line of bits

you can also, of course, write them with the first

of course, once you start getting into prefix attacks... I think you're still fine?

## so, what I'm realizing here

this can operate independently of any service that operates on hashes, like Dat or IPFS or BitTorrent(?) or even Tor or Bitcoin (though those last two are liable to get prefix-attacked)

## a thought on fingerprinting for recognizing prefix attacks

rather than use orange/blue colors like I have, you could write letters in a style that puts the weight on the top or bottom? or just super/subscript them

NOTE: I just mocked up a too-low-res SVG of this in my experiment-a0z1 workspace folder on stushiba

see, like, for Badifogu, or Base32 or 58 or 64 or whatever partial-hash transmission format you choose (I think), you can communicate the first 80 bits in a way that you can easily check "yeah, that's what I had", because they're two-way - but since Alphabi is one-way, you can only match against the class

## an aspect to think about

I keep going like "why do I want Base32? Is it really that much improvement over Base16?" and then it's like "oh yeah, Base32 lets stuff stand out as much as possible" - you're not gonna have one-offs from copying errors (well, b can still look like 6 or 8 or 13, but the big three, plus casing, are taken care of), and, honestly, it's the farthest from having "perceptual homographs" where, like, I'm not gonna register "oh, that's a capital Q versus a lowercase one"

of course there's no research backing this up, but it feels right
