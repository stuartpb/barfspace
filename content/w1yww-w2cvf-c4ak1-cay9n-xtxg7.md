# Deep Macro Symbol Introspecting Metacompiler

https://github.com/CraneStation/cranelift, plus an s-expression based language with symbols that resolve down to assembly structures (ie. WAT), plus a simpler indentation-based representation for those (which I think I've slated to be imported to these notes under the June Judgment, and I think was the only work I'd made in a repo called "Crane" but haven't yet), boils down to a JIT compiler you should be able to rewrite in your codebase

I'd want it to be somewhat like Nim, or [Prepack](https://prepack.io/)

https://github.com/kanaka/wam also kind of gets it, as does https://github.com/lys-lang/lys (the %stack and %wasm seem right the [blog post](https://menduz.com/posts/lys-language-project/) is also worth a read)

one idea I have with this is the "context stack", which is kind of like the prototype chain, but it lists the different levels of specialization for the code represented by a symbol... or tree level?

maybe this is a typical construct in JIT? or LLVM but my idea is, you give access to it to the developer at compile time, as part of the language - those optimizations are developed in the same introspectable runtime amd dependency tree that developer code has access to

https://github.com/tmcw/wah gets it from the "infix shortcuts would be cool" point of view

https://github.com/ballercat/walt might also get it, at least in the spirit of "write a traditional imperative-style program and have it compile down to an assembly tree" - the thing is to see if its syntax maps into the "simplified tree symbol collection" syntax spec I think I'll be importing at some point
