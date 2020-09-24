# why I couldn't resolve my local addresses: Rebind Protection

The whole reason I was having trouble on the internal name system, and still had trouble after switching to horn.horse, was because this is what it looks like when Rebind Protection is on ("Filter Private Rebind" on http://192.168.1.1/cgi-bin/luci/admin/services/unbound/configure)

It'd be cool if I could toggle rebind protection on a per-zone basis? or at least not protect against responses to addresses on the LAN from an upstream server *that is also on the LAN*, come the fuck on

reviewing `private-address` in https://nlnetlabs.nl/documentation/unbound/unbound.conf/... ohhh, I need to add "private-domain" records to get around rebind protection

adding this to `/etc/unbound/unbound_srv.conf`:

```
domain-insecure: internal
private-domain: internal
private-domain: horn.horse
```

https://github.com/openwrt/packages/blob/master/net/unbound/files/README.md lists `rebind_protection 2` (labeled in luci as "Filter Entire Subnet") as "Above plus GLA /64 on machine" (where "Above" denotes "RFC 1918 and 4193 responses blocked"): it's not quite clear what that means, but it sounds like [an IPv6 Unique Local Address thing](https://en.wikipedia.org/wiki/Unique_local_address)? I'll put this back to 1
