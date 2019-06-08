# On introducing locals in Understanding Lua

## Trello comments: So, we've been dealing with "values in hand"; let's save this table we've just made and start laying things out

> Alternately, this section could come before the exploration of tables, and we save a number like "69,105". That way, assignment to locals is taught before assignment to values in tables and people don't go thinking "oh, tables are how I keep names of things".

---

> However, we could also just teach the initial key value mapping thing through constructors and indexing, but no assignment. Then cover assignment to locals, then show assigning to a key in a table after showing locals.

---

> If covering table key->value assignment after locals, might want to spread it out a bit. Covering them "together" may result in the two actions being too easily conflated. I think showing assignment like that in "Tables, Part 2: Arrays" will probably be fine (although maybe we should get to that before we dive into functions then).

## Trello comments: Locals are our slots

> Locals are variables. Technically they're "one type" of variable, but that's the wrong way of looking at it. This book is partially written from the point of view of the internals of the Lua reference implementation, and its treatment of locals as registers that are a fundamentally simpler thing is one of them.

## Trello card: Locals are slotted when you give them a name

## Trello comment: There's technically a finite number of them

> 250\. You should never hit this limit

## Trello card: They're assigned with a single `=`

Honestly, everything I wrote on this in Trello is a mess, so I'm not even going to include it in the draft, I'm just going to link to this issue and rewrite the whole thing later

Yeah, to be honest, I think I should cover locals *first*, since that lets me write code that can refer to a table for assigning values. That would also allow me to do all the table stuff in one go, instead of saying "here's the beginning of tables, OOPS here's a bunch of important stuff I didn't cover, OKAY back to tables"
