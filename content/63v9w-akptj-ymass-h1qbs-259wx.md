# deno as an alternative user agent format

this would be kind of like the midway point between ServiceWorkers and a full-fledged native app: a process that needs filesystem and network access, but other than that can serve its UI over HTTP

I use "Deno" here to describe a Node-like engine with real client-esque ES6 module inclusion

so, the idea is, you'd "package" your app as a Deno script, and that provides its frontend over HTTP on port 80 (and WebSocket and WebRTC and whatever proxy services to the browser it might use, a la Hubs)

or, hmm... maybe you do it as a Helm chart, and you can specify whatever containerized resources you want

but, hmm. can you extend Deno with other protocols?

anyway, the idea here was that you could write a Deno script that bootstraps a Dat node to retrieve and rehost the app (frontend files) while it is "open"

but yeah I guess you could also so that as a containerized microservice, which would allow it to be written with a more purpose-fit tooling

but yeah, this'd be for stuff that's trusted enough to have full network access, a la native apps

like, honestly, this seems like a sensible way to do a lot of that class of app that, for example, doesn't even ask for permissions on Android any more.

a Kubernetes layer would also allow for Android-like file storage

okay, now we're coming back around to what I was going for with that first line (which I only just now finished spelling out): this is meant to close the gap between the advantage the browser has around easier-than-NPM-style distribution and packaging (ie. for ServiceWorkers), and the extended capailities afforded by Node that you see in stuff like Electron (namely, the ability to run as a daemon, and process traffic to disk), under the restricted privilege model outlined by Deno.

It'd be the backing layer for, like I was saying, Dat and IPFS and stuff.

Like, maybe that's what I'm going for here: a next-level Beaker Browser, where all non-HTTP transports are implemented on HTTP...

unless the previous version of a transport handler can handle retrieving the next version? idk

## oh wait, hurr durr

A much simpler way of describing all this:

Make a way for ServiceWorkers to request Deno privileges.
