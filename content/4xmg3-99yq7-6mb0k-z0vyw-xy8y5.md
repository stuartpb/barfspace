# Revisiting the DNS setup, 2020-09-20

I was talking last night about how the dnsmasq page, unsurprisingly in hindsight, wasn't directing requests to my internal DNS server

I think http://192.168.1.1/cgi-bin/luci/admin/services/unbound/zones is what I was looking for

Can't get it to forward requests to .internal: looking at the documentation, it seems like I might have a problem with having not set up the proper start-of-authority records?

https://nlnetlabs.nl/documentation/unbound/unbound.conf/

## thinking on design more

Anyway, you know what? I think I'd rather just have my internal DNS run on the cluster...

but trying to get the zone to forward *there* doesn't seem to be working, either. There might be some way to fix this by, like, writing a SOA record for .internal, but, the more I think about it, the more I'm thinking...

screw it, I'll put "internal DNS server" on the future list. If I want TLS forwarding, I'll configure it for stuplink's unbound configuration (and if that doesn't work, I'll go back to thinking about running it on the cluster), but, like, I'd still consider an external-dns + nsd + unbound pod instead of the CoreDNS + etcd instance multi-pod monstrosity I've thrown together now.

it'll be simpler, infrastructure-wise, to just put this on a public domain that can be easily validated via ACME, and have the DNS for that domain on a free CloudFlare plan. Some day, that might not be possible, but it's possible right now, and it'll let me focus on bootstrapping 

[the horn.horse plan](r4qh5-wkxca-gb8xc-p6ks3-wps07)
