# accouch note nexus

https://unusual.studio/projects/#24e79e56-17f9-447e-918b-ee1815154443

This is my project to implement a general-purpose drop-in server for everything I've always described in my more concrete [security thoughts](9qb42-94e42-81ans-2rerv-1nq45).

I've been looking at Hoodie's implementation (which is really just a slightly-dressed-up PouchDB), and I remember another server having something like this, but ultimately, Hoodie's technique gives me the API I could target, even if I do the backing implementation a completely different way.

https://github.com/hoodiehq/account-json-api

## key/session db "account" model

So, the idea is that every CouchDB "user" is really going to represent a *session* - they'll be created on the fly with roles representing the user, as well as whatever access roles the user *has authorized* (so, like, the user might have a "high security", you know, "sudo mode" that only lasts half an hour after giving three forms of authentication and approval from another user - this allows them that)

one aspect of this that I think makes sense is that adding roles to a session should be on-demand - like, I might not need a password to start working on my team stuff, but I should still need to go through an "OK, I'm opening my team stuff" audit-log-entry phase to show I was accessing it

if I understand correctly this also lets the session use Bearer tokens (though it could also generate a password that is forgotten after issuing the login? I think that's a suitable way to do it, seeing as how there's one endpoint)

ooh, you know what could be cool as a built-in Pouch/Couch feature? deletion scheduling, like, built into the daemon, instead of needing a sidecar to handle it

and, like, do Bearer tokens have that kind of expiration? is there a refresh/heartbeat mechanism? is that refresh password based? ratcheting window?

(at this point I went down a rabbit hole [reinventing Wire](bere8-rfp2c-w68b1-mz114-n8008))

## thought looking into Mastodon

It'd probably make sense for accouch to work as a backend to WebFinger for the namespace (ie. could be mounted on a subpath via ingress) to serve fediverse apps like Mastodon

## see also

- [My Dream IAM](7xr1k-yvmxb-f9bzc-9sgqg-bf542)
- [Portable and Fractal Identity](cjjjj-8ccj8-6va1s-8p856-cjv8r)

## other open IAM API type platforms

- Dex
  - https://coreos.com/blog/announcing-dex.html
  - https://github.com/dexidp/dex
