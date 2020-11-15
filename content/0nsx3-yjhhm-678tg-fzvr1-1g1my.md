# miscellaneous free Shenzen I/O Thoughts

here's some stuff about possible "sandbox things"

see also [lcd screen design thoughts](s5qe0-9h2bn-8ear5-5ve0m-ary0n) (though a lot of that page's content might be unrelated right now? I should put that somewhere else and link it in from Linux OS notes)

## division

I'm realizing how much headache I could have saved design-wise, even if it's a perf nightmare, if I made a division module for the mc6k, maybe two of them?

## gate booleans

you can construct a boolean variable with a flip-flop pair of gates for 2/3 the cost of another micro (if you use a design that doesn't need a Not), if you've got the simple address space (ie. p0, p1, or a free bit on an i/o pair of DX300s)
