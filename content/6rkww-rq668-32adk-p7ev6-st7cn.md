# on self-returning "chaining" object methods

it's fine to chain. `left.right` just means "continue to right from the context of left". it's basically a sync version of `then`.

think of it like the VM pointer's version of `location = "./right"`

you're not making or wasting new values, you're just cycling your context

like, I'm pretty sure this same kind of chaining can be done in C and it's totally valid (though it'd probably look like nodebacks due to C's lack of error catching, IIRC)

hey, there's a neat idea for a C programming paradigm. Use some agreed-upon typed structure like MsgPack for the possible Error callback, and return your continuation as a function pointer with the same structure. is this already a thing?

oh shit, was this one of the golden shit promises of java? the idea that each "word" could return its own "context" for the "next verb"?

or it's just a lost paradigm of brilliance, smothered by Java's inane fetishization of hierarchy

whoa, and now I'm thinking about how this sequence of calls with the same "name, other value" pair (where `err` or some kind of state could maybe be tacked on there), one, is a cool idea for a resumable coding paradigm (and, again, kinda feels like Promises)

but also, that this seems symmetric to the processing of input in this [grarg](h9ba2-1dsfk-8ja7t-0c08f-kzgmb) system

like, you could do both of them just returning a function that takes a function, or a name condition, or an array, or `null` to get the final app

or these functions could also take two strings, at which point they would return pass them in for processing from the root?

eh, I don't know that there's a need to get so abstract so early on

oh, some of this also feels like generators
