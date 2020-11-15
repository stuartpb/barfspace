# Frontend Build Tool Thoughts

going by https://x-team.com/blog/rollup-webpack-parcel-comparison/ and https://medium.com/js-imaginea/comparing-bundlers-webpack-rollup-parcel-f8f5dc609cfd it sounds like the best approach is to write something compatible with Parcel (which seems more or less like [Evergreen Targeting](kr1bf-p2qkh-0qbff-8r8yq-ktj6z)), especially for development where you can take advantage of its hot module swapping and such, and then probably compile that with rollup

that also seems like something that could be developed: something that can take a look at the current directory, figure out what rollup plugins would be needed and install them, and then just builds and previews like parcel (autousing rcs, etc)

## Also cool, but doesn't seem to be widely used

https://prepack.io/

also suggests type annotations using [Flow](https://flow.org/en/docs/types/primitives/) which I guess is nicer than typescript? seems like this might be a bit NIH, not clear which is more like ESnext type annotations
