# The Evergreen Targeting Manifesto

Web apps should support two environments:

- The very latest stable version of all evergreen browsers, and
- Every other browser possible.

The codebase should be written to target the former, and tooling should be used to generate a code path for the latter.

There's a flip side to this, though, which is that you *don't* predicate your platform on unstable features that are *only provided* by tooling, as they might get abandoned and bitrotten in a way that features of the Web Platform don't.

TODO: elaborate more on what I was going for with https://github.com/stuartpb/tracercore/commit/3d11cd930329336d120194f0e49646fa06323f4c

## Examples of this principle

- [Best Practices for Modern ES Projects](b57nn-27xma-g9axf-r6dhz-gmg0g)
