# On Garbage Collection in Understanding Lua

## Note from OneNote

> When a value gets replaced, it falls on the floor. It gets collected when we're not looking at it. If we can't see it anymore, it's gone and we don't have to worry about it.

## Cards and comments from Trello list, "A brief break from surreality: Garbage collection"

### Blow the array we just made off the table (assign nil)

> The table constructed in Part 2 gives a pretty good example of something we might want garbage collected right then, but the notion of Functions, as a first-class value- that I can be holding the fabric of action in my hands- is the thing more likely to make people feel fatigued like we've fallen down the rabbit hole.

---

> One idea might be to make a couple arrays, and the function is something that replaces the second array we make (like we were constructing a function's output by hand- this also shows the power, and reasoning, behind how, and why, we write functions). Hence we - rather than assigning nil (which we can do at some later point where we might bring the notion of `nil` back for a thing on its practical use) - bump the table off the local-plate to replace it with the function, then we take a moment to visit what happened to that table.

### It falls out of panel, where it effectively ceases to exist

### Well, technically, from the computer's point of view, it's still taking up space in memory

### So it's just lying on the floor

### But eventually there's a "garbage collection" step

> The computer looks at something on the floor, checks that that thing that takes up memory isn't being used anywhere else, and marks it as memory that can be reused

### Just so you know the real memory characteristics of how this works