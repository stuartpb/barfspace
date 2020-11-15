# My understanding of best practices for architecting modern (Node)JS codebases

[This old article][giltayar] kind of makes sense, except I think the bare-import advice (regarding extensions) is wrong today.

[giltayar]: https://medium.com/@giltayar/native-es-modules-in-nodejs-status-and-future-directions-part-i-ee5ea3001f71

Anyway, looking at [the current documentation](https://nodejs.org/api/esm.html) and trajectories around [what's newest][newest], it seems like this is the safest bet for how to code going forward:

[newest]: https://medium.com/@nodejs/announcing-a-new-experimental-modules-1be8d2d6c2ff

- Only use the .js extension if you're not going to be hosting your module through a modern CDN (but you are planning to be the one hosting it: anyone vendoring it into an older web server can rename it anyway).
  - Even if your script doesn't have dependencies, you'll want it served as a module so it can have `"use strict;"` by default and other such forward-features in browsers.
  - I'm not sure if this causes your script to not block the render
- If you can, write all your files in module format, with `.mjs` extensions.
  - Import all your files within the package as relative paths.
  - I don't think you can trust that node_modules will exist as a sibling on most CDNs, but who knows?
- If you have a legacy codebase, rename all the files you control to `.cjs`.
  - While you're at it, make sure all your internal imports use full filenames with extensions.
    - This was a Node feature that's due to require a flag to re-enable, and will make browser-compatibility worse.
- For the sake of unextensioned files in your repo (ie. executable bin scripts), or any .js files you couldn't rename (especially per the ininital note about situations where you might need to keep the extension ambiguous for legacy reasons), specify if your package's default `type` is `commonjs` or `module` in its `package.json`
- If you need to vendor in an old script in a new environment, you can name it with a `.cjs` extension, and if you want to modernize in piecemeal refactors, you can opt-into module-style by changing the filename to `.mjs`.

## if you are working on CommonJS:

You don't want to introduce anything that'll make it harder to modernize, so avoid stepping on [the differences](https://nodejs.org/api/esm.html#esm_differences_between_es_modules_and_commonjs):

- Don't use `NODE_PATH`.
  - It's forgotten in lots of tooling
  - it's not respected by Module loading
  - it doesn't have an analogue in browsers
  - [the documentation proposes using symlinks][encnpc], which you can have some kind of build tool figure out in your pipeline
  - in Node's case, I believe that'd just be a matter of putting symlinks to modules into `node_modules` from wherever (the Nix package store?)
- Don't use `require.extensions` or `require.cache`.
  - If you've got an idea that'd work well with those, maybe chill out for a few years until a spec shakes out for that kind of introspection on the standard import model.
  - You can even [get involved on the experiment for loader hooks](https://nodejs.org/api/esm.html#esm_experimental_loader_hooks), if you don't mind your code needing to be maintained heavily to avoid bitrot.
- If you want to start transitioning to a `.mjs` world, you can insert a `const require = module.createRequire(import.meta.url)` at the top and seeing if it'll still work when you change the filename

[encnpc]: https://nodejs.org/api/esm.html#esm_no_code_node_path_code

## Spanning style

If you have a package that can be imported synchronously, you can make that available in a `.cjs`. (This will probably be a bundle produced by Babel/Webpack/Rollup/Parcel/whatever for browser environments anyway.)

if it's not a bundle, them you might just want to make it so that your returned module signature API for require consumers is a Promise, which can be awaited.

[This Node plan page][plan] says that dual modules should make the CJS their default and have clients explicitly select the .mjs when importing... this does fit the "much more aware of file paths" import model, but I don't know.

[plan]: https://github.com/nodejs/modules/blob/master/doc/plan-for-new-modules-implementation.md

## in-language style

You can follow these modern ES practices when writing CommonJS (as advocated [here](https://flaviocopes.com/commonjs/) for example), but it should be as a transitional phase. I mean, you're already revisiting a legacy codebase that'll likely be integrated in an async environment on the browser: you can't also make the modules jump?

- avoid var in any new code
- use arrow functions unless you're explicitly defining an object-oriented prototype that uses the `this` interface
- things that will especially help for "use strong" / "use stricter" style optmizations:
  - note that engines could still implement an optimization path where they detect if this is workable
  - use `Map` for any arbitrary-string containers, not objects
    - pre-initialize any fields that may be assigned on an object in its lifetime
    - using string keys is okay, but should be regarded as a reflection feature, with all the overhead of dropping a debugger
- Use template literals liberally. hyperHTML is beautiful.
- Don't use symbols unless you're emulating a proposed language feature.
- Language features you should use instead of externalities:
  - Use the trim and pad functions.

## more thoughts for the sake of browsers:

- Not sure how Node's module imports can be made to work in a browser environment yet, is there a way to do it the other way round for Node?
- Importing all your local scripts as relative paths should be cool for browsers loading a no-deps module
- Hey, how much trouble would it be for browsers to handle cjs imports?
  - Is it not really possible to assemble the module in, like, a web worker, asynchronously, for all the blocking calls to yield back to the event loop?
  - is this polyfillable without having to rewrite the scripts (or at least, rewrite in a build phase - could be rewritten at runtime)?
  - I mean, what's Node doing that's so special they can figure it out in-engine?
  - okay, looks like you'd just introduce `module.createRequire`
  - and you could maybe have a function that produces the right "require" origin, HTTP or file, based on which environment it's running in
  - but `createRequire` doesn't make it async.
  - so I guess you'd polyfill an sync version?
  - and possibly some kind of intercepting / rewrite rule that treats commonjs modules as importable

polyfills for require:

http://stuk.github.io/require1k/

https://github.com/montagejs/mr

can these work on scripts defined by elements having type = "commonjs"?

https://github.com/WebReflection/common-js seems like probably the best way to interface

## side thought

the "what's up with this 'import from' thing" kind of bugged me (versus the normal old "here's module.exports, go nuts"), but now that I think about it, I think this might be a way to let different parts of a file be evaluated and imported if the files mutually require things from each other? it's a way to disentangle that?
