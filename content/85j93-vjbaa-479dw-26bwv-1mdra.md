# Parked Project (Redux)

So, the idea behind Parked Project was to make a server that'd let you gradually configure a form for your web page, through one magic DNS configuration.

However, now I'm thinking: why not skip all that and just let the whole thing live in the DNS configuration? Why not make a special web server that changes its behavior for a template based on TXT entries (rather than getting clever with CNAMEs)?

This is also inspired in the same vein as some of these ideas I'm proposing for the [stateless Let's Encrypt server thing][SLET].

[SLET]: nxgz4-vt82d-4k9am-6c0e6-yepc5

So like you'd probably have something like a text record for "_parkedproject.domain.com" or whatever, however TXT records go, and I guess the content would be a JSON object with certain veriables set?

[better idea](47nd8-svyfy-z0bk9-yavqs-f29rh)
