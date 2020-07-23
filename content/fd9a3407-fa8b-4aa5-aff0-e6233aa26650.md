# Direct DDNS

installed `ddns-scripts_cloudflare.com-v4` and changed the DDNS provider to Cloudflare after it looks like our IP changed last night and I started getting this notification back from DNS-O-Matic via email every 10 minutes:

```
CloudFlare response for '403':
--------------------
err Invalid request headers (6003)
--------------------
```

changed username to s@stuartpb.com and pasted in a new API key for a password

still getting errors... oh, apparently the syntax is `403@testtrack4.com`? weird af but ok, I get why they'd do that

considered going back and seeing if this could work okay for DNS-O-Matic, but, honestly, it's probably better to have one less third party in this critical path, especially one that doesn't seem to have sensible authentication

## okay, figured it out

I'm still having a problem:

```json
{"success":false,"errors":[{"code":6003,"message":"Invalid request headers","error_chain":[{"code":6103,"message":"Invalid format for X-Auth-Key header"}]}],"messages":[],"result":null}
```

looks like it's because I'm trying to use Tokens where this is only designed to work with an API Key

[same goes for DNS-O-Matic](https://support.cloudflare.com/hc/en-us/articles/360020524512-Manage-dynamic-IPs-in-Cloudflare-DNS-programmatically#h_161458650101544484552881)

I don't really feel comfortable using my account's Global API Key so I gotta wait until https://github.com/openwrt/packages/pull/12762 lands
