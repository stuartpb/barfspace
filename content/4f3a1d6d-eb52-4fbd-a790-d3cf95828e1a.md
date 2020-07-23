# More Stuplink hijinks

following https://github.com/openwrt/packages/tree/master/net/unbound/files#unbound-and-odhcpd

at http://192.168.1.1/cgi-bin/luci/admin/system/opkg#

Installed odhcpd and checked "Overwrite" so it'd install over the ipv6-only version

installed unbound-control and ca-bundle

## also

installing luci-app-acme, why not

also luci-app-ddns

```
Installing luci-app-ddns (2.4.9-7) to root...
 223131  WARN : Service section disabled! - TERMINATE
Downloading http://downloads.openwrt.org/releases/19.07.3/packages/mips_24kc/luci/luci-app-ddns_2.4.9-7_all.ipk
Installing luci-lib-ipkg (git-20.182.58453-b573f10-1) to root...
Downloading http://downloads.openwrt.org/releases/19.07.3/packages/mips_24kc/luci/luci-lib-ipkg_git-20.182.58453-b573f10-1_all.ipk
Installing ddns-scripts (2.7.8-13) to root...
Downloading http://downloads.openwrt.org/releases/19.07.3/packages/mips_24kc/packages/ddns-scripts_2.7.8-13_all.ipk
Configuring ddns-scripts.
Configuring luci-lib-ipkg.
Configuring luci-app-ddns.
 223131  WARN : Service section disabled! - TERMINATE
```

??? interface considers it installed

luci-app-uhttpd

rebooting

added stushiba's pubkey

installing nano via luci

editing unbound config to match readme:

- add_wan_fqdn
- link odhcpd
- slacc6 1
- setting domain to 403.testtrack4.com
- unbound control

editing the dhcp settings

- I'm moving the lease time to 2 hours because come on
- adding the dhcpv4 server
- maindhcp for odhcpd

stopped and disabled dnsmasw in http://192.168.1.1/cgi-bin/luci/admin/system/startup

going into DHCP config and setting the local domain to 403.testtrack4.com
