# linear dataturf (Casettic)

I'm thinking it'd have a 130-bit address space, expressed in [Crockford Base32](https://www.crockford.com/base32.html) (which is represented as "0u"-prefixed), but with 0u0 to 0ug000000000000 (the first 64 bits of address space) reserved, as well as 0u80000000000000000000000000 to 0uzzzzzzzzzzzzzzzzzzzzzzzz (the upper three quadrants)

maybe it should just be a reservation to 0u4000000 (the first 32 bits)

maybe the lower 32 are hard-reserved, and 0u4000000 to 0ug000000000000 are reserved for experiments (possibly involving representations of the ledger data described below)

so you could put like a website at the address `0u00we1c0met0thev1rtva10as1s`

the "upper threee quadrant" restriction might be relaxed to 0ug0000000000000000000000000, with another striated restriction that any address with that "8" bit set must also have the 65th bit (or whatever) unset - point is, it'd be to match the approach taken by [tonsky compact UUIDs](https://github.com/tonsky/compact-uuids)

alternately, it can just be that top bit is reserved, and the middle bit can be set on a UUID-as-an-address for an "attachments"-like block space (which gives you, what, 16 exabytes of space before the next possible UUID-space collision, and that's if you don't tuck more data in the unused UUID bits?)

my thinking is there should be enough "total energy" in the system at any one time (at least, enough total energy to the users who aren't paying for more space) to write all the backing storage available, at the farthest reaches of the address space - so you can be sure you won't run out of room

the basic unit should be like the "rim megabyte" - all address space can be thought of like concentric rings on a disc (though, in this case, the outermost "ring" is at least 8 times larger than all the rings inside it? but I guess that reduces at an inverse quadratic rate, because it's area of a circle? hmm, I guess this is only really tracking the "first digit" - I'm not sure each ring can double the area of the previous ring without it getting nuts fast)

## ownership under cassettic

so an idea I have is that addresses can be "more expensive" to reserve under a certain length, ie. each bit that's zero from the left increases the hourly cost

it'd be priced like Tarsnap's insane deduplicated-bytes-bet-picodollar-or-whatever, with address space as another factor

like how Nitrous had "sources" (Nitrous's resourcing model really was pretty cool), contributors can get a certain amount of monthly resource by

anyway the resources can be "writing sauce", "persistence jelly", and "protective coating", where "protective coating" prevents others from overwriting your work, "persistence jelly" is depleted as long as you own space on the tape (ie. so long as it's not erased or overwritten)

protective coating is the only stuff that needs to be address-location-sensitive

maybe "writing sauce" is just... maybe just reclaiming address space requires extra Resource? Maybe this can be the thing that makes lower addresses more valuable, lower addresses are more expensive to overwrite

okay so yeah it's like Magnet Power, and it can be dedicated to either Writing or Shielding, and there's like a built-in Altitude that gives a Natural Defense adding / mutiplying to whatever "maintenance" score it takes to hold the address (which can be on a completely different scale - like, it takes 4 times the Magnetism to hold data close to the core, but it takes 1024 times the Magnetism to overtake it, and putting 1.5 times the holding rate on the block reservation gives you six times that to claim)

hmm, I think reservation power should actually have "absurd" scaling at the rim, so like if I'm paying double to shield a rim address, it costs 1024 times as much, and if I'm paying quadruple it's like core-space-level costs to overtake

I think the bottom line is that it should be possible to pay a lot to "reserve" either a small amount of low address space or a large amount of high space

maybe the scaling can be something like each outer quintet takes an increasing 1.x the last to reserve, going up to 2x for the last few before the hard reservation?

can also maybe have an energy drain for "cloaking", which hides the "energy signature" that is normally used to seek along the track for used addresses (ie. public data)

your "magnetism income" is a thing, as it's the basis for your storage allowance: you can save up surplus magnetism to claim premium address space (which is then holdable at a lower rate, though still higher than cheaper space)

passive income can be apportioned by other users, and ultimately it's that "total power to keep all backing storage filled at rim addresses" thing.

so I guess the real unit would be "rim meghour"

hmm, so maybe "shields" can be "market shields" - you can put more energy in to make a "more profitable" shield, where more of the energy cost spent to overtake the shield goes to you (versus just being "wasted", ie. going to the Bank/Ground/whatever you call the sink normal costs go to)

the core idea here being that you can deploy Rent Shields, which sublet write access for parts of the block at a lesser price than paying to overtake the block

(these make more sense if you think of address space as time on a stream - see below)

this would probably be a function of the aforementioned Absurd Scaling at the Rim - you can make insane profit off rim addresses

anyway the unit that ownership is managed under is a keypair, where the public key has an energy ledger entry

users can share private keys to whatever users they want to have access to that block - to have write access to its data is to have write access to its allocation and allotment of energy

## consumers / applications

this could be used as a block storage / backing store for a volume used to host a webpage which could then be overtaken by, you know, whuffie

ooh, one of the really interesting applications with this is when this is used for a streaming ring buffer

you can even do this for an address space that uses the date/time for the lower 64 bits (or whatever), and then you can reserve "time on that channel" by reserving the block for that time

but yeah, this is a key notion: that this system can be used to sell address space
