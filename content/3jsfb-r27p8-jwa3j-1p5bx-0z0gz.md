# A Spec for Partially Encrypted Content in Markdown / Bagtent

This is a less-noisy draft of the thoughts collected in [Softly Encrypting Secret Content](vrwwb-7bgj7-gm89z-ww4q7-et42n), having let those thoughts cycle around in my head a bit for the last week or whatever.

## Overview

This document is about specifying a way to encrypt sensitive information within a document by keys.

Like all Bagtent design principles, this spec is designed to interoperate with other Markdown content, and degrade gracefully in the absence of better supporting tooling.

## Necessary tools

This will require an app that can decrypt

## Codebooks

Codebooks are sections of a document collecting a lookup table defining secret words, such as names.

A Codebook is identified by a heading beginning "Codebook:" (though this convention may not be strictly necessary to function). A section can also just be called "Codebook" if there's only one in the document.

By default, all content in codebooks are assumed to be encryped by the SHA256 of a passphrase.

Encrypted content in a Codebook is represented by the Base64 string representation of the encrypted sequence.

The behavior of a codebook section is influenced by plaintext content in the section.

Keywords like `normalize case compatible letters` coalesce the passphrase according to rules like those used under the hood on https://thanked.name/.

A span like `rounds:3k` or `Rounds: 69105` implies that the password should be processed by a number of PBKDF2 rounds.

A span like `Salt: "Pepper"` specifies a string to hash and use as a salt in PBKDF2 stretching. (Specifying a value without quotes is treated as a Base64 value.)

More strings for Argon2-kinda parameters like memory hardness can be incorporated too, if you're nasty, but be advised that password-hardening algorithms are an antipattern. You should be using passphrases complex enough that no amount of kbrute force can find them, not increasing the amount of brute force required. Expect that any passphrase that can be discovered through the application of a sufficiently-advanced cluster, will be. (Remember: the NSA has computing power you wouldn't believe. You should assume that, whenever Windows is running slowly, it's because the NSA is using the latent botnet they forced Microsoft to put into every consumer Windows 10 machine to crack an activist's password.)

Passphrases in general arent't a great idea: key stores are better.

Note that normalization rules apply to quoted strings as well as passphrases. If you want to be sloppy with one, you have to deal with weakness in the other.

Sections may also use something like a hash or UUID to refer to keys / credentials from a store (ie. for use in BIGDOG operations, where keys are distributed per-operation).

Sections may use this to encode the symmetric key for content against known public keys for people who should have access to the content (though this should probably be managed by an outside key-scheduling service - I believe "Stuart Reinvents Signal" had a design for something like this).

A passphrase may be embedded into a local copy with `pass: "the actual passphrase"` to save it, but tooling should ensure that a passphrase never leaks into the actual Git commit. Embedded passphrases to enable automatic encryption / decryption

Passphrases should be cued by the nature of the Codebook. You can give yourself a reminder with a line like `Hint: it's what Bruce Vilanch does every day`, or a directive to display a hashblot/splat. (This stuff overlaps the spec for NilPass's notes.)

The distinguishing content of a codebook is a list of "code words" for use in the document (and which can be referenced from other documents) to refer to a secret concept.

Each list item consists of an optional prefix and colon, and Base64 encrypted content.

If the prefix is quoted, it is hashed via SHA256, and the first 16 bytes of the hash are used as an IV. If not quoted (but still separated from the content by a colon), it is parsed as Base64. (Padding can be ignored for the IV under the assumption it's 16 bytes.)

Content is assumed to be encrypted via 256-bit AES-CBC. (other algorithms/modes like GCM are currently out of spec, though GCM could be more useful in an untrusted BIGDOG context.)

Documents can refer back to the codebook by hyperlinking to the codebook by fragment identifier (in the relevant document if external) with the term defined there as the link text. Including the title "decrypt" can serve as a hint to tooling that the link should be rendered as the Codebook content when the passphrase is entered.

The content of a link matches by best-effort: if you don't want to come up with codenames, you can just use the first few Base64 characters (or maybe even alphabi for the bits) of a random IV, and if you don't care to generate IVs, you can just use characters from the (null-IV-by-default) encrypted content. Case only matters if it's ambiguous.

## Example of what a codebook section would look like

These code names were all taken, more or less, from https://randomword.com/ which is lovely - I think it's ripping off its content from http://phrontistery.info

The content won't actually decrypt: it's just a mockup using spew from https://generate.plus/en/base64

- "fougade": pS4L1emy6XE3ySRJH8gNhQ==
- "jactator": XiZavK3VuxKJ8KZtadhcB0xUgXs7FtLlJ+m8TD83DbM=
- "barkentine": BY8eRtlqFVq0xsvtb0wrCA==
- "comminuter": 3Kf0Qg+is4LwMjWenFskq2vasKjdscbMkuBZKj2qGWY=
- "xerophytic": aE38xDysNYiQxgMb59Fj22OoQskvI4Wnknw/NFeYdJZppr/qXWtT27Br/ekMJ2F7
- "cento": aIdtQRk3rUdNvDve0rXsqWYzcH6fmMvtcy6xzgt4Ulg=
- "gumnivore": QriTe5gP2d2QZXogSj1LXA==
- "agonarch": IIy2RJFpKHeI5KxXkt+XlnGRBjh1N0VdBH0q1QzNbDaI7VA3s6H0q8NvDD7+2/w9

## Example of what content referencing a codebook would look like

This pretends that the previous section was called "Codebook: Example", and slugged according to the conventional kebab-casing slug algorithm.

You'll note that I stopped including the "decrypt" titles, because I got bored.

Talked to [Fougade](#codebook-example "decrypt") today about assassinating [Agonarch](#codebook-example). They were [xerophytic](#codebook-example) about it (whoof, almost used a gendered pronoun there, info leakage much? even this hints that it's singular-they which says something)

## Footnotes for encryption

maybe

## Encrypted sections / documents

Just having one big Base64 string in a section / document can work like a Codebook with only one item, and it's the whole section, and links are actually treated as links.

Could also have a thing where there are multiple included versions of the content for different keys, that sort of thing. Out of scope for now, I just need something so I can write about companies I'm looking at via Triplebyte without being a messy bitch.

Might want to think about a convention for encrypting spans (I think I was thinking something like `[fine](#!decrypt?key=whatever-id-or-whatever&content=c4iqKAXDyg2l6P+3K7dzgEqjqc6FbGyABoVztK6eKj22h2qVmlADgPyWDfjjb+xHzQuQrhw8dSDGWIYqNHuogw==)`, or maybe the content is in the link and the target is just `#!decrypt` - note that this is different from the `?verb` and `#?verb` conventions proposed for page editing, as it is a command for *viewing*)

## see also

thanked.name is the lighter-weight version of this, for when you're OK being public, don't need to remember precisely, would like plausible deniability, and don't want the pressure of picking a random identifier
