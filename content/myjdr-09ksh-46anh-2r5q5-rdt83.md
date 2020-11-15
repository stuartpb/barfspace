# Actually Hosting Directly from Here

This was one of the [early ideas](ntjq2-z1nf2-wka0w-3pezh-pp784) from the cluster: not pushing my services out to an endpoint like `address.exposed`, but actually having sites point to a CNAME that points directly to my DDNS address.

Also, I could theoretically host a DNS server exposing records for my exposed network like this. (There's also the matter that I might want to flash an open-source firmware to my router so I can use a DDNS service for my own domains that doesn't make me re-up manually every 30 days)

This'd all require setting inbound routing entries in the router (which overlaps with one of the ideas in the HuveBug-Home-Network-Node model)

We'd probably want [Auth layers](6x1cd-7jq0x-5ta4f-5eavs-9649m)
