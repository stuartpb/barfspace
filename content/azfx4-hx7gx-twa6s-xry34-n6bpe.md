# plumbus serve

Okay, so, this would probably be more like a tool that calls plumbus, but this is, like, a really simple framework for developing a modular REST-based RPC server, or something

you could have routes for:

- headers.serve.plumbus.org
- get.serve.plumbus.org
- post.serve.plumbus.org
- put.serve.plumbus.org

where `serve.plumbus.org` is whatever this project gets called

and each of those is interpreted as a first-level route

and everything under the route (which can be added by overlays) will be called with the body coming in over stdin if it's a get...

hmm, I guess you do still need some kind of selector... maybe if it's in something like a directory that ends in a question mark? what about hashes? what's a good not-url-friendly character that wouldn't be outwardly hostile to Windows devs

maybe the "headers" sequence needs to get called... maybe that needs to be one convention... yeah I'm just reinventing CGI aren't I

[Code Narrative Order](ae5d3-g6gtd-ed90v-bd7p1-k7g2n) suggests collisions should not be allowed, and should be checked for at startup

## the git version?

I guess a git-wrapping version of this would work kinda similarly, actually!
