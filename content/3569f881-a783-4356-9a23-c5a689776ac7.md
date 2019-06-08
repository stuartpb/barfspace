# The Environment

So, what if you look for a name that isn't in your scope at all?

it falls back to `_ENV` (a table in a little spot left of all the locals that I'd earlier said I would get to later on)

`_ENV` is a table that contains your "environment" (Technically, what I'm going to talk about here, the stuff that's initially populated, is more `_G`, but I consider `_G` more of an implementation detail than a language feature)

`_ENV` works like a local, and is essentially just a local that's always there

You can delete `_ENV` if you want to enforce locals-or-error
