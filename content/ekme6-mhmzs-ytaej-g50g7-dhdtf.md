# early household-internal-dns notes

[this page](ys7kj-hzhct-mkawp-2bvnw-s1g8c) describes the life and death of the design I had in mind when this was written originally

## outlay

First steps are going to be a server that will be internal-only to serve routes to internal services.

## Providing DNS for Exposed names?

Until a "public DNS infrastructure" is set up, this can resolve public services, too - that should get blacklisted later, but in the meantime, this is a nice way to get around "I set up the site but I can't view it because of DNS" issues

## Securing Internal Names

- [Let's Encrypt Internal Traffic](fhknf-d3whg-ysacs-0s3da-8tegm)

## once set up

We can change it to be the DNS server recommended by DHCP from the router

the backing servers... I guess we can't have the server get the DNS server from DHCP at that point, so... can we configure it to use DNSSEC or whatever that HTTPS DNS thing Cloudflare's running is? On top of being effectively a 1.1.1.1 setting, it also gets the whole network tunneled encrypted DNS requests, so, like, bonus
