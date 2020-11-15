# Setting up Stuplink

Taking the most recent snapshot and renaming it `firmware.bin` per https://openwrt.org/toh/tp-link/archer-c7-1750

Going to http://192.168.1.1/ and getting redirected to http://192.168.1.1/cgi-bin/luci/ to set a password

Setting a password like the old one, but without the length limits that prevent

(this didn't appear to work, so I do it again later? oh wait, was this just the login)

Heading to http://192.168.1.1/cgi-bin/luci/admin/network/wireless to set up the wireless networks in a way that they both connect devices to the lan, for both radios

setting up WPA2-PSK

changing hostname in http://192.168.1.1/cgi-bin/luci/admin/system/system to "stuplink"

## and we're mostly there

at first I'm like "it's not working" but then it's like "oh, my subnet is just wrong again, lol"

fixed at http://192.168.1.1/cgi-bin/luci/admin/network/network

## setting up DHCP reservations

oh damn, the DUID lets Stushiba and Stutendo have different IPs

in deciding to give it a hostname... `stushiba.testtrack4.com`. The Test Track 4 brand is back, babey

## Okay, so, what *is* Test Track 4?

Test Track 4 is My Lab.

## anyway

adding luci-theme-material

https://openwrt.org/docs/guide-user/additional-software/opkg says that they don't recommend upgrading everything at once

upgrading `luci`

## upgrading luci-base

hmm

> Collected errors:
>
> * resolve_conffiles: Existing conffile /etc/config/luci is different from the conffile in the new package. The new conffile will be placed at /etc/config/luci-opkg.

## fuck

I think it didn't like the password I set.

Resetting, and using my old router password that I think was just too long for the dumb TP Link firmware

## anyway, upgrading luci-base

other than some clumsier quoting and a clearer definition of the UI's default theme, this is the only thing in the existing luci conf not in the new one

```
config internal 'diag'
	option dns 'openwrt.org'
	option ping 'openwrt.org'
	option route 'openwrt.org'
```

## back in DHCP

removed the "local domain" since we're providing FQDNs for all DHCP reservations

added forwarding for /internal/192.168.42.53
