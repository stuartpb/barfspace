# Deno-style package management for an npm-compatible world

ie. how do we make frontend package management look like backend package management with npm, as browsers introduce their own version of ES6 modules that uses fully-qualified http paths to included sources instead of symbolic names like how Node does it?

I think that Deno has the right idea on that front - here are the things I'd do (going by my own mismemory of how Deno currently works)

## the idea

What you'd do is have dependencies specified at static URLs in source files, and then they'd be updated by a package manager that looks for the module exporting some kind of symbol that specifies compatible semvers for each root dependency, like "cdnjs.example.org/whatever/pug"

maybe that could be specified by a tree that's like "cdnjs.example.org" - ie. maybe it's split per-host - or by prefix? so like I have one object for all my packages under the `/whatever/` path and don't have to keep repeating it

or maybe there's just a `$prefix` field in the object or something

but then that might go against something like GitHub Pages where user authorities are per-host?

anyway, you'd specify your registry format via a JSON (or maybe even YAML?) document under .well-known

Maybe it's just straight-up the registry is expected to be under a path in .well-known - maybe it's even like a shadow root, where I get the registry information for a package under a path in .well-known

or maybe it can be mirrored somewhere else with some kind of external configuration

ooh, but this is an interesting idea: start using .well-known for configuration namespace the way home uses .config and .local/share and such

## oh man

you know what? fuck it, the home page for the library can link to the registry file (ie via `<link>`). and you're expected to have an object that, like, lists home pages if they're not index.html?

but yeah, you want Deno's style of sha256-locking
