# Fun with proquints

https://arxiv.org/html/0901.4016

It's embarassing, you'd think I'd already be well-versed in these, but I only kind of knew them obliquely (like, I think JSBin uses this), and only found this in the README for [the first GitHub result](https://github.com/richfitz/ids) when Googling "random identifiers".

leads to [this fantasy idea](qfhxq-y45ye-mwavx-9tcn2-dg0wd)

## proquints versus octonouncables versus base32

I think it's not worth the extra 4 bits to do 16 bits in five letters, versus treating the native unit as a consonant-vowel pair syllable, handling it as an alternative to base64 that uses twice as many characters in order to be pronouncable.

in terms of user-friendly density, what's important is that base32 can do 15 bits in three, and you can extend those out to word triplets.

and of course hex itself is already doing 4 bits per character, though it is a sort of nice pronounceability boost to use the core badifogu consontant alphabet as your root. lets you, say, prefix each of them with something that ends in a vowel

and yeah, I think it's also good to use the vowel alphabet for the next level. determine in advance how many significant bits you're going to reserve for a namespace, then try to pick your names based on uniqueness under that layer of distribution: only pick a first consonant you've used before if you've used all of them, and then make sure you use a different vowel

## quick reference

B D F G H J K L M N P R S T V Z

A I O U

```
0x0  0x1  0x2  0x3  0x4  0x5  0x6  0x7  0x8  0x9  0xa
0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110
b    d    f    g    h    j    k    l    m    n    p    r    s    t    v    z

bdfghjklmnprstvz

aiou

a  i  o  u
00 01 10 11
 1  2  3  4
```

## ideas

something where the `ceqwxy` letters (incidentally, "qwexy" is a great mnemonic to remember the omitted letters after badifogu, where the "e" is just to serve as a reminder that "e" is not a vowel in use) could be used as check digits, like the ones in Crockford's Base64

## Migrating UUIDs to Proquint-Like identifiers

I've been thinking, and I think 80 bits of randomness is probably plenty, and UUIDs for these notes are overkill.

I've been *considering* converting all UUIDs in this note tree to names like what I describe in the fantasy idea: using the last six bytes of the UUID as the "first and last names", and the first four bytes as the "middle name".

I've developed this idea into "badifogu", a script for which is now in the [bagtent](q80bh-jwx0p-rfbtm-09j3w-2vnr3) repo.

## Another UUID-related idea

- [ULID-UUIDs](f5gzh-cwdax-638zw-38z9g-9wwwj)
