# error correction for xmortis rabbit hole

## too fancy

I think there needs to be some kind of forward-and-backward error correction, something like the outer byte represents the data of this byte, the inner nibble XORs with the next byte, and the outer nibble XORs with the previous byte

I'm thinking there are two levels of XOR. The outer nibble represents the agreement of 0/1, 2/3, 4/5, and 6/7 after XOR with the next, and the inner represents the agreement of 1/2, 3/4, 5/6, and 7/0 after XOR with the previous.

The ends of a sequence are implied to be null.

So I guess you'd have two 65,536-entry tables to make this easier? I don't know if there's a nice way to make the pattern easier to trace...

## no, wait, I'm overthinking this

You don't need to get fancy with xoring against the byte of the message itself. you only have the same number of shannons of data you're protecting: just have it be... fuck it, have it be the inside and outside of the byte. so there are the "core elemental words", and you are constantly interleaving the pieces of the word

actually, though, am I overthinking it?, like, I think making it so there isn't clear agreement between the two... yeah, there's "the word itself" and "the before and after", and the latter is created...

yeah... like, you'll get a definite answer of what the byte looks like from the error-correction-codes, but if there's a disagreement - if the error correction code was mangled, you'll also see a disagreement in the confirmations before and after...?

oh, right, yeah, because the value of the previous byte, the next byte, and their shared verificiation state

## okay, so, the simpler way to model this

let's say for a second every "even byte" is a data byte, and every "odd byte" is a parity byte - just straight up 1:1 xor of the previous byte with the next byte.

and so now lat's say each pair contains the outer parity bits of the last byte, and the inner parity bits of the next byte. (the menemonic I was thinking was the "a"s of the antecedent, and the "p" of the postcedent)

and so if a byte is messed up, you can tell because it disagrees with the XOR of its neighbors... that's the "consensus". and you know if there've been too many errors, because you won't have a clean triple of errors.

yeah, if we're going by the "one letter gets messed up" theory of how errors would occur in this system, I think this idea is sound

I keep going back to "but what about using the letters themselves so that the entire byte is dependent"

actually, fuck it, why not just, yeah, we go back to the "sacred core words" idea, and each "word" is just... the byte twice.

and then you split the byte across three words

i keep being compelled to do this internal bit-twiddling, but, like, no, it's for detecting multi-bit errors within a packet

The reason I need to settle for sheer redundancy is because of the chance of false negative errors - ie. where I luck into...

no, okay, so, like, it feels like that's the reason to perturb the encoding? so that false negatives are... harder? because they require more bit agreement?

no, because, like, your odds are fundamentally 1 in 16... no, that's not right

## reflecting

okay, so, whether you're transmitting half the bits, or you're transmitting the bit-agreements, you're transmitting a fixed 4 bits based on the original byte.
