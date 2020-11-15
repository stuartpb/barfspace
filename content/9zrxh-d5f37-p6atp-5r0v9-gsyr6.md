# Lua quirks that are Good, Actually

## Indexing from 1

I could go on and on about this, but yeah, indexing from 1 is fine - the only reason languages like C index from 0 is archaic assembly leakage anyway

## The float/integer thing in newer versions

I mean, you already need dynamic typing for the engine - why not?

## the ends of the string being null when matching boundaries

I remember seeing `%b` documented with these nulls and thinking "huh, that's a dumb implementation feature to list"

Thinking about it, "boundary treats the ends of the string as `\0`" is a useful feature - if you don't want it, you can append alternative values (like, doubling the first and last character guarantees it won't match a boundary). It lets you use `\0` *internally* if you want to get *more* out of boundaries. The alternative of "the ends of the string are unmatchable as boundaries" is bizarre

but yeah, since this only applies at the ends of the string, it's not a bug that would interfere with another usage of `\0` - if you don't want the ends of the string to count, you can just wrap the function and discard those matches
