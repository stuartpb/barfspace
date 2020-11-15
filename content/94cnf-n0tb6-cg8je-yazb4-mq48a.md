# Side thought about user IDs

So, a thing I was thinking, and I think you can go and find this in whatever note and link it in here, was that each purchase (or, like, each Kickstarter SKU) could get an identifier that is, like, maybe 12 or 16 bits within a namespace, where you've got maybe four eight-state factors contributing 3 bits (color, costume, front animal, back animal)

the zeroes are reserved for prototypes, like the v0 branch?

## ulid "address spacing"

can you fit the "namespace" of these identifiers, in bits, into a ULID, perhaps? (I don't want to screw with the true-randomness of )

Anyway, the first, what, 48 bits are the date? and the next 80 bits are random? so each namespace is, at the moment it's provisioned, (bitwidth)

## mapping this to Casettic / dataturf et al

this kind of overlaps with the "hot zone" idea from my 128-Bit Coordinate Space idea (not to be confused with the Cool Zone) - or was it a 256-bit space?

That could be cool - view one axis as the "to" and the other the "from"

though, like, with ulids, if you model it as 64x64, you still have "date" as an axis and then some, because it's all in the first 64 bits
