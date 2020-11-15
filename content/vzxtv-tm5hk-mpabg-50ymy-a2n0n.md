# Conditions, comparisons, and primitive operations

Equivalence

A quick aside about type coercion: when Lua performs a number operation on a string, it tries to convert it to number before raising an error (so you don't have to worry about whether something that reads strings has parsed it to a number for you). There's no real way to turn this off, but you can use `tonumber` and `tostring` to do the conversion intentionally and make this explicit when you want it. (Those functions come from the environment, which is explained in chapter whatever)

Addition subtraction, etc

Exponentiation

Modulo

And, or, not

See [this note](n9dp2-3pz03-419ab-rcb8s-4w94y) for thoughts on bitwise operations.
