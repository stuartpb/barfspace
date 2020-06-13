# Module Tree Core Concept: Overlay-Like Wildcard Construct

Okay, so, Module Tree programs don't actually use Overlays, but they go through a given set of Layers to construct the set of files that match, shadowing later (earlier?) files in the

And it can be like Systemd, where you can splice in temporary edits under /tmp or another /etc tree

And you have symlinks to /usr mixed in with files mixed in with, I guess a mount to /tmp?

These are all cool patterns, and they should have supporting tools to make them easy

and the ultimate idea is that, in terms of overlay order / "shadowing" they'll go in lexical order so they'll match whater would happen if overlay were called with them

one all the files have been collected, their origin paths' order (from the original wildcard, mind, so you can still put /run before /etc before /usr) are ignored unless they're at identical  (stable sort)

## how it integrates into other stuff

it can get read as Podman definitions?

## handling this

my advice, if you're in a namespace and you need to bump/sink a layer's priority, is to add/remove characters to the beginning of the name like I did with Trello

I think this is ome of the things underscore prefixing gets you?

## how I'm more confident in this model

I saw openSuse's best practices for /etc/ and /usr/

## more names for this?

now that it'd definitely glob-based and that's the core thing

globlayer?

globerlays. definitely globerlaying. that's the technique

## also

remember you'd want not just a Shell reference/portable implementation, and not just Go binaries for stuff like plumbus (though, like I'm saying there'd be "plumbus" and "plumbus-sh"), but also language libraries like globerlay-js
