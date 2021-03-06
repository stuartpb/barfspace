# Understanding the Auth Outlay in the Kuberntes Ecosystem / Landscape

So, [bitly's oauth2_proxy](https://github.com/bitly/oauth2_proxy) appears to have spawned three main successors:

- [a hard continuation of the exact same project by Pusher](https://github.com/oauth2-proxy/oauth2-proxy)
  - seems like a smaller component that needs something larger to make something of it
  - [the docs do not impress me](https://oauth2-proxy.github.io/oauth2-proxy/)
    - I believe it's possible that the docs got WAY better since I said this originally
- [Buzzfeed's "S.S. Octopus"](https://github.com/buzzfeed/sso)
  - where you need to prove you have an email on a given domain to get in?
  - fwict, this is a small, opinionated gateway that's better than nothing but not great
- [Pomerium](https://www.pomerium.io/)
  - this appears to have been forked from buzzfeed sso after noting that it [had a bunch of issues](https://github.com/pomerium/pomerium/issues/1)
  - pomerium is indeed listed as a fork of sso at the bottom of the latter's readme
  - kind of like the OpenEBS to buzzfeed's Longhorn here

Based sheerly on [how fucking on point their recipes are](https://www.pomerium.io/recipes/), I'm going with Pomerium.

## an interjection 2020-09-23

Considering how I ended up ditching OpenEBS (for what is currently shaping up as [The Storberry rook-ceph cluster iteration](8h54a-knyqd-w7by1-tvp07-h2dmx)), I do almost kind of wonder if I may have written off oauth2-proxy prematurely (much as how I originally regarded rook-ceph as "too complicated")

## okay, but what about Dex?

So, with Pomerium especially, it looks like you need some kind of user construct to auth with over OIDC. And a lot of third parties don't do that, so you need an adapter layer? I think I read that somewhere

Anyway, I want that

So, like, among all the options here, the next closest to Dex appears to be Keycloak

and I've seen Keycloak win on a few features in comparisons...

but it's Java. Yikes. Versus Dex being a Go thing run by CoreOS. On tech-stack merits alone, Dex trounces Keycloak (which seems very "heavyweight enterprise thing" to me).

## the doc that tied this all together for me

https://banzaicloud.com/blog/pomerium-authentication/

I think I searched for "prometheus dex" and found this which pointed me to Pomerium

Doesn't really cover adding Dex to the cluster or configuring, but I think I remember Dex's docs being clear enough on that

Continued: [Pomerium and Dex](meskp-gdg9b-mv8ad-jnn3z-9ctc7)
