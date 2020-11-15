# Notes from learning Rust and WebAssembly and stuff

Went ahead and installed `rustup` so I could build Xi on Stushiba, so, hey, might go and try learning Rust. Might do that as part of my general looking-into of WebAssembly.

https://github.com/mbasso/awesome-wasm saves me a ton of time here

## misc rust links

- [primer on how WASM is good for more than just the web](https://www.javascriptjanuary.com/blog/webassembly-neither-web-nor-assembly-but-revolutionary)
- [Isomorphic Rust compiling Bash](https://neosmart.net/blog/2020/self-compiling-rust-code/)
  - this is actually a neat Bash trick: since it's interpreted and parsed line-by-line, you can end the script with an `exec` and anything after won't get read by Bash

## WASI stuff

This was a thing I was thinking around the Windowsystem Metabrowser, the "engine" processes could work like this, idk

https://hacks.mozilla.org/2019/03/standardizing-wasi-a-webassembly-system-interface/ [(Hacker News comments)](https://news.ycombinator.com/item?id=19501614)

https://github.com/CraneStation/wasmtime/blob/master/docs/WASI-documents.md

https://github.com/CraneStation/wasmtime/blob/master/docs/WASI-api.md is a good explainer on the API itself

https://github.com/CraneStation/wasmtime is cool but I remember documenting something about the kernel implementation - is this buried in my old Quadration quest notes?

it links to https://wasi.dev/polyfill/ as a polyfill but the project infrastructure around it looks p weak

thoughts on my ideal compiled language [here](w1yww-w2cvf-c4ak1-cay9n-xtxg7)

## out-of-browser wasm

https://github.com/wasmerio/wasmer seems best

actually, https://github.com/WAVM/WAVM

## odd thought

I wonder if it's possible to compile these wasm engines to [RISC-v][] - I mean, I'd think so, because that's a Rust target

but that'd mean you'd have intentional, safe code, runnable in a trusted kernelspace, on a well-designed open architecture, which'd be sweet

[RISC-V]: https://en.wikipedia.org/wiki/RISC-V

## related

- [Deno](737wh-kdexr-zkay0-mvkwt-1dawe)
- [Deep Metacompiler idea](w1yww-w2cvf-c4ak1-cay9n-xtxg7)
- [Redox](https://github.com/redox-os/redox)
