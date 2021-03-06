# Alphabinary Analog Experiment

These notes are copied from a "README" in an unpublished repo where I've been experimenting with a potentially-more-flexible successor to Alphabinary, tentatively called "Alphanalog". Alphanalog centers around the concept of a word's "charge": the total distance of its letters from the center of the alphabet. This is a new iteration on the same "use letter positions in the alphabet to communicate data" idea as Alphabinary, but with (hopefully) more flexibility in writing style.

Some of the thoughts below are completely untested for practicality, and may not even be cohesive at scale.

[non-brainstorming-related work to do](0qp4k-x2sap-3p85m-mxtxy-kdhp5)

## Parsing rules

The first word of every sentence determines the number of bytes that sentence encodes, based on the length of the word and the average absolute charge, or "energy", of its letters (ie. the total absolute charge for each letter, divided by the number of letters), with the base being the integer base 2 log of the length, while the length scales linearly to... well, if I don't want to explain the rule so elaborately that it's code, I should just give the first few examples and see if the pattern makes sense (if you want the theoretical continuation for this, check the Lua script):

| Letters / byte range (see note) | Minimum when less than | Max when greater than |
|-----|-----|-----|
|  1  | N/A | N/A |
| 2-3 | 2/3 | 2/3 |
| 4-7 | 1/4 | 3/4 |
| 8-15| 1/5 | 4/5 |
|16-31| 1/6 | 5/6 |

It's important to recognize that the number of letters does **not** correspond to the number of bytes: while the word length and byte lengths lie in the same ranges, a 7-letter word with low energy (such as "nominal", "minimum", "Johnson", "milkmen", "limping", "nonplus", or, ironically enough, "million") can specify a 4-byte length, and a 4-letter word with high energy (such as "jazz", "tuba", "beat", "wave", "buzz", "yeah", or, ironically enough, "dead") can specify a 7-byte length.

(NOTE: Having the first sentence work like this might not be as useful as letting it work with the sentence, and changing the number of bytes of a sentence in the middle of a paragraph can potentially require lots of editing to realign, so this might get fixed to just powers-of-two byte sentences, and if you want to encode 3 bytes at the end of a file you just have to do it with a two-byte sentence and.)

Hyphenates are considered one word.

Passages where the number of bits specified by the header is higher than the word count of the following (or include header?) words will be ignored. This can be used to write freeform sentences to join data sentences.

## Big gap here

How do I represent the relative positions of the words in a way that adding small words won't majorly shift data (ie. it'll get truncated)?
