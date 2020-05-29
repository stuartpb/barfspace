# Deno

found via https://github.com/sindresorhus/ky

https://deno.land/

Well, that's neat

## News covering / introducing Deno

- https://stackoverflow.blog/2020/05/22/deno-v1-0-0-released-to-solve-node-js-design-flaws/?cb=1

## Ideas I've gotten after seeing Deno

note that these were both just vaguely remembering the concepts I'd seen, not actually reconciled with how Deno does it

- [a new approach to package management?](30f69e2a-76d4-4bb4-ace6-21baf222a75d.md)
- [npm-style management for Deno-style includes](ff05a4a1-65bd-494a-85cc-10a40da8bef5.md)

## WASM

It supports WASM, right? [yes](https://deno.land/std/manual.md#wasm-support)

What about WASI?

Isn't there another thing that was doing WASI? wasmtime / wasmer? Could these projects be altered to be compatible?

## native plugins

I can't quite tell how native packages are supposed to work? I guess https://deno.land/x/plugin_prepare/ is how? (found via https://deno.land/x/webview/plugin.ts)

looks like the API is [up in the air](https://deno.land/typedoc/index.html#openplugin)

## see also

- [Rust and WASM](a0efb9a5-5ec8-4ced-8c1b-6b6a338277ce.md)
