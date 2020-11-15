# Why UUIDs and not public keys?

Like, if Bagtent identifiers for documents were a unique GPG keypair for that document, you could have content inherently signed by one party, which would probably make it possible to have individual files in your tree follow a Dat-like MErkle chain pattern

The thing is, you really can just have it as "this file contains metadata for which authors are authorized to edit it", and then go back and check the commit history to make sure all commits were signed by someone authorized to edit the file when accepting a merge

and you can even suspend the rules if a file would have been otherwise locked out - like, you can opt into a n "unauthorized fork" of an abandoned node.

you can even have expiration policies that need to be re-upped, where if nobody's renewed an expiration declaration for page ownership

## Other ways to think of the Bagtent content/tree/"key/value model"

This is where I started looking toward [the bagtent data model](d5mvk-nhyex-jd89r-53q5e-jd1c6), and how it overlaps with Module Tree, where you use paths for classification

## compare and contrast

- [Brainstorming Possible Alternatives to UUIDs](c4g5h-7tqnh-8j8gd-eaqvs-sxh8j)
