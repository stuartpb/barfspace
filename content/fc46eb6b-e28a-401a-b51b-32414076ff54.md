# The future of inhouse-dns

I'll remake it as a chart for a single-Pod deployment with external-dns and nsd, and then this chart can be combined with CoreDNS, PowerDNS, unbound, dnsmasq, etc, whatever - you can integrate the authoritative nameserver however you want

## whoops

looks like NSD supporting DNS updates was bad intel - I found a citation for that, I've got a link for it somewhere.

I've been thinking that an implementation could use PowerDNS for that role instead, though.
