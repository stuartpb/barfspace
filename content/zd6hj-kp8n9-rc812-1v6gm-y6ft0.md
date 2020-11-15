# On metamethods in Understanding Lua

(Originally GitHub Issue #6.)

When "calling" a table, or "indexing" a string, or any other such operation that's not a primitive capability of the type, I'm thinking this will just be represented as the value in question being momentarily represented with a facility for the operation that's being done to it - ie. the string having a keyhole, for the duration of the panel where I'm indexing it with `"sub"`.

OneNote notes on page for metatables:

> - Non-table types with metatables have them attached with bank-pen chains.
>   - To make them easier to work with, the metatable for strings is printed on the back.

OneNote notes on page for operations:

> Operators are tools on my belt.
>
> No, operations are actions. Maybe `+`, `-`, `#`, `*`, `/`, `^`, etc are tools, but stuff like indexing is going-through-a-door-and-scanning-the-value, and assignment is different depending on whether it's assignment to a local or assignment to a table index (because it is).
>
> Various operations are represented by interactions with consistent features (ie. table indexing is always  walking through a door or swiping on a scanner).
>
> But how to represent Metatables as tables?
> - The same way they work in Lua: as an invisible concept only accessible through functions that expose them.

From this last note, it's clear that my earlier note on the representation of metatables was superseded (which is the right call, IMO).
