# On lexical scope in Unusual Studio

The visual metaphor for scopes was described in a Trello comment transcribed in [the notes on functions](ypqj4-z5n8d-g18sx-jshhs-p5qwj).

## Cards and Comments from the Trello list "Functions and Outside Scopes"

### Function definitions are in a new "scope"

### Locals only last within that scope

### Name clobbering

> The old value gets knocked down one level and another one comes up in the same spot. (not how it works register-wise but how it works from a lexical standpoint)

---

> Actually, no, I think it's easier to understand if I put each new local to the right of the last (so new-level locals are always contiguous- this is also more register-accurate), and labels just work, like, I can't make two of the same label, so I just pull it on a string from the old pedestal to the new one, and when the locals drop away the name snaps back

### Going out of scope

> Every local we instantiated at this level falls to the floor. (references will live on in functions we return, but we'll get to that denoument in a later chapter, after we've explained basics like how to get libraries)

## Moe comments from the GitHub issue iteration of these notes

You know, I think it might make sense to cover a construct that creates a lexical block, like conditional statements or loops, before going into functions and the awesome ways they interact with scope.

Also, I think it makes more sense for the chair to go *up* as we put things on the stack, not down (in other words, the *world* goes down - Wikipedia uses the example of a cafeteria tray dispenser to describe stacks, and that makes sense to me).

Also, the name clobbering thing where the clobbered name *isn't* pushed down makes sense to me, but it takes a little more explanation: see, the idea is that the *label* (ie. the little placard) for the local's name would be *dragged off* of the old slot, and *onto* the new one - and then, when that slot goes away (as any slots right of the division line for "slots added at this level of scope" go), the label "snaps back" to the last spot it was stuck to.
