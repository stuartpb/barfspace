# A thought on the exec-chain format

I'd tack this on to whatever document describes the idea for a plumbus interface that is managed by the script taking the list of all hooks, then execing into the first one and letting it take over

the thing where it's

## on (not) allowing arguments

I momentarily thought there could be a way for this method to take arguments before the list of files, but that would make it so you couldn't just have `exec "$@"` be the standard passthrough

## on state

if I'm not mistaken you can pass parameters to future steps by exporting environment variables in this variety? would that require not using exec?

## related concepts?

oh man this is a lot like Connect 3-and-4-arity middleware where you can either respond to the request or pass it off to `return next()`

## functionjality served

I was thinking "what if there was a hook type that let you define your hook's position in the chain dynamically, or, like, just prepend or append", and then I realized that's what this type of definition allows.

## an overall thought here

This is kind of like Lua, where we try to fit as many different capabilities into as few abstract types as possible

## pipeline thought

is this where [the weird offshoot about Kubernetes](k7j86-ye9bv-cbad4-fj5mb-90ty1) came from - that this could be another export format from the [Acebins / Magickshop / Blockly Pipeline Thingy](amyvx-h7853-878ea-s47wv-a18p1)?
