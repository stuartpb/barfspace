# Stupid Simple Editing Server

This'd be a server that just straight up serves file content to a GET request, which'd give compatibility with [MD Wiki](http://dynalon.github.io/mdwiki/#!index.md)

You could then hack a real stupid "Edit this section" function into MDWiki that spawns an Ace control in-place and does a PUT of the new file content

I think this kind of PUT is covered by stuff like Nginx's WebDAV module?

Also POST for new files, but then we get into "hyperlink management" and this is really just about having a dead simple server to run on my PocketC.H.I.P. to make note editing feasible

Would also be nice to introduce Horus functionality for navigating but whatever

## Extension for .git?

Since it'd be a pain in the ass to emulate Git functionality over HTTP (like, for the stuartpb noteball, that'd entail several thousand requests just to do a `git status`), you can extend the `.git` path with query string support...

oh my god, you could just make it `.git?command=` as an incredibly lazy and insecure catch-all API

but ofc you can also do stuff like `GET /.git/HEAD` and `PUT /.git/refs/heads/master`
