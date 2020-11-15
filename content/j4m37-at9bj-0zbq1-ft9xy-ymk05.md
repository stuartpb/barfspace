# A Route-Based Controller for Abstract Server Setups

looking at [Gloo's Dex Setup](https://docs.solo.io/gloo/latest/guides/security/auth/extauth/oauth/dex/) gave me the idea

## user story

I have a website, and I want to make a subsite, but share the authentication structure of the main site: you still have to log in for a subset of pages, but you'll go through the same auth server as the main site.

Later, I want to configure this auth site to have a new logo, then a new theme. at first, these are just applied at the auth server as a configuration layer, then later they're moved to a dedicated pod/deployment (by the administrator, let's say).

(that last thing I'm thinking would be facilitated by Globerlays in whatever the auth-presenting server is - this overlaps with a whole idea I've been cooking up like Cockpit for printacle)

All the config objects, [Service API/Gateway/Routes](https://kubernetes-sigs.github.io/service-apis/concepts/), stuff like that are handled by the Composition Operator
