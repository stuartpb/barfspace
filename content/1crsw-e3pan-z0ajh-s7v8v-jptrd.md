# Alphabi Airgapper

The idea here is that you'd build a tool that can encode arbitrary data as an efficient binary sequence, and this is a note for the prefixes negotiating that output character set.

Here are some formats for expressing how the encoded data should be presented on the other end, by prefix:

## if the string is a binary sequence:

`binary` (or shortend forms)

(in theory you could insert a two-bit "dna" mode here but I'm not sure that's necessary)

## else if the string is octal:

`octal`

## else if the string is representable as hex

`hex` (HEX if all letters are capitalized, Hex if there are lower-case letters and the first character is a capital letter)

## else if the string has no more than 6 characters that aren't letters of the same case

`letters` (LETTERS if letters are upper-case) for a duotrigintesimal (base-32) character mapping

'#:-,. ' are the default 6 replacement characters

if there are non-same-case-letter characters not in that set, the second "word" (of arbitrary non-space characters) will be one of the following forms (with `ABCDEF` in the word replacing from the character set):

- `#A`: `#A-,. `
- `@A`: `#:A,. `
- `$A`: `#:-A. `
- `%A`: `#:-,A `
- `#AB`: `#AB,. `
- `@AB`: `#:AB. `
- `$AB`: `#:-AB `
- `%AB`: `#B-,A. `
- `!AB`: `#A-B. `
- `?AB`: `#:A,B `
- `#ABC`: `#ABC. `
- `@ABC`: `#:ABC `
- `$ABC`: `#C-AB `
- `%ABC`: `#BC,A `
- `#ABCD`: `#ABCD `
- `#ABCDE`: `ABCDE `
- `#ABCDEF`: `ABCDEF`

the `#` form will be used unless one of the characters in the default set is present

notes on how this could use some revision:

- `+` would make more sense than `#` considering the literal context
- in hindsight, there's no reason to make the first character an enshrined one
- better default characters would be `_` or maybe `/`
- a syntax for arbitrary code points could be cool and match the other modes' abilities, but they'd need to be careful about separating from literal digits

## else if it contains no more than two non-alphanumeric characters

`base64`

the default position-63-and-64 characters are `+ `

being followed by `+A` or `+AB` set the continuation characters to `A ` and `AB`, respectively (where `A` and `B` are the two non-alphanumeric, non-space characters)

(in this sense, a traditional `+/` base64 value would be headed as `base64 +/`)

`+` followed by hexadecimal characters encode a Unicode code point (so a series of lines with spaces and letters would be a literal `base64 +A`)

two code points will be separated by a letter like `x` (so a series of lines containing letters, numbers, and snowmen would be `base64 +Ax2603`)

## else if it contains fewer than 127 unique code points

`ascii`

characters are replaced in the second word by the corresponding positional letter of a character not used, and the character to use instead, as a decimal code point (so, for example, a string that contains spaces and commas but not carets would start `z85 f32`).

(note: I think that was supposed to use a Unicode character as an example of a replaced character in the set? idk)

## else

`utf8`
