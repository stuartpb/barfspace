# Tables as Scope Blocks in Lua

Okay, so, I was thinking about table constructors in Lua, and the global environment and stuff, and I was thinking:

Scopes should be a special case of tables, where if the parser determines a section doesn't need to be tablified, it just runs its stuff in registers, and it's very much like the array mode of a table. tables are instantiated as stack frames

so basically every block is a "table constructor", and tables can basically be used as lambdas if they don't take a value

"return" in a table lets you replace the value the block evaluates to

_ENV I feel should be a more concise token to mean "the innermost scope", like I'm thinking `$`

oh hey, if `$` represents the "value of this block", maybe `return` can be replaced with `$=`?

`[whatever]` without any preceding text refers to an indexing of `$`, because of the whole blocks-are-now-table-constructors thing

## oh but, like, wait

if I'm setting a vlue in a table, and then I set the value in an inner scope, I'm setting a token from an outside scope, which means I can't just say `{width=30}` if `width` is from an outside scope?

and then it's like "oh, well, we'd have it so indexing always refers to tokens in the innermost scope", and then, no, you've just destroyed the concept of "scope".

maybe if index-fallthrough was a more surface concept? like there's an indexing operator for "table's parent" (let's call it `^`), which is used for both fallthrough indexing and metatable-key lookup. I mean, that's pretty much how scopes are.

and so if you want a table to not include a reference to the parent table it was defined in, you have to explicitly detach it with `$^ = nil`

okay but so now... do you keep the "local" keyword, but it now means something of the opposite, where "local" means "uses of this token/symbol in inner scopes refer to the variable at this scope, do not create an inner shadow"

and, by the same tack, you could maybe have `do` and `end` still as tokens, but they now have an inverted meaning in that they do *not* introduce an inner block scope

## on the subject of lambdas

Can you cleanly make `(x){$=x*x}` the representation for `function(x) return x*x end`? I think not with the current rules, because that would currently evaluate to "call the value of x with a table containing the key `$` with the value of x multiplied by x", which could even be meaningful with the right metamethods

## practical example

this:

```lua
local function digitize(digits)
  local d, n = {}, {}
  for i=1, #digits do
    n[i-1] = digits[i]
    d[digits[i]] = i=1
  end
  return {d=d,n=n}
end
```

could become this

```
digitize = (digits){
  d,n = {}, {}
  for i=1, #digits do
    n[i-1] = digits[i]
    d[digits[i]] = i=1
  end
}
```

hmm, I guess `for` still introduces a scope... but so like yeah, the parser reads this and recognizes the scope is ephemeral

yeah so I guess you'd have it so `do end` are now the "ephemeral scope" tokens...

there are Lua rules about parenthesized expressions... maybe, if you want to actually start an expression with a parenthesized item, you just have to start it with `nil or`

oh man, what if you stop calling them tables. tables are now blocks

## stuff that might not be compatible from new Lua

so apparently variables have attributes like `const` and `close` now?
