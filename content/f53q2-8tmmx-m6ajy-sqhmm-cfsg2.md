# On tables in Understanding Lua

*(As collected in issue #5 when this was on GitHub, 2018-02-13)*

Earlier iterations of my notes had tables represented as *doors* (OneNote), or windows (Trello), instead of containers- the thought being that I would go *into* a table to index it.

Revisiting this idea today, though, this seems needlessly abstruse (the motivation for making them such portentous objects stemmed from my thinking that so much of Lua I write happens within the context of tables that making them anything *less* would be to overlook their importance). It's better to just make them tables with drawers as I'm writing them here.

## Notes from OneNote

> - Tables: a door to a room with a "table" with a supermarket-type scanner on it and a Monsters, Inc.-esque rail / airport baggage belt (imagine the other side looks like Toy Story 2) that the value is retrieved with when a value is swiped
>   - When walking into a room, the door vanishes when closed (you know, into the white) and the only way out is a fireman's pole that takes me back to the chair.
>   - Appearance:
>     - Has a metal placard on each door with its address (not the 0x part) (the edges of the placard are { }-shaped)
>       - Alternately, the {} are on the knob/knocker
>     - Has a hook for a metatable (a table's metatable is a door on a string hung on this hook)
>     - Scanner has [ ] pattern on it
>     - Table's legs are (it's one of those feet-and-a-stalk tables) intersected curly braces
>   - Pros of tables-as-doors:
>     - Everything under Appearance
>   - Cons of tables-as-doors:
>     - Makes the Alice-in-Wonderland sizes-are-completely-arbitrary-ness of values a bit too obvious (since I have to be able to both carry and walk through doors).
>     - makes tables kind of weird to represent ("so he goes through the door while holding the door, swipes that door on the table, and it brings him a door? Wait- he can carry the same door he came through? WTF IS GOING ON")
>
> ![ugly drawing of a table](https://user-images.githubusercontent.com/572196/36184609-aebb31e4-10e9-11e8-80b6-005b09517171.png)

## Description from Trello: "Tables are... windows?"

> This kind of explains how tables work. Kind of.
>
> Tables have their address engraved on them to identify them, and may be visually different (ie. represented as different color window frames made of different woods).
