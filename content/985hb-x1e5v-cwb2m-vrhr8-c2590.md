# Investigating the DHCP thing

```
stumethyst:~ # grep -r dhcp /etc/
/etc/sysconfig/network/ifcfg.template:## interface independent configurations files (config, dhcp, wireless) also in
/etc/sysconfig/network/ifcfg.template:## Type:    list(static,dhcp,dhcp4,dhcp6,autoip,dhcp+autoip,6to4,none)
/etc/sysconfig/network/ifcfg.template:# - dhcp:        Start a dhcp client (IPV4 and IPv6) on that interface.
/etc/sysconfig/network/ifcfg.template:# - dhcp4:       Start a dhcp client (IPv4 only) on that interface.
/etc/sysconfig/network/ifcfg.template:# - dhcp6:       Start a dhcp client (IPv6 only) on that interface.
/etc/sysconfig/network/ifcfg.template:# - dhcp+autoip: Try dhcp4 and use autoip if dhcp fails.
/etc/sysconfig/network/ifcfg.template:# If you use dhcp or autoip you may additionally specify static address(es).
/etc/sysconfig/network/ifcfg.template:# See /etc/sysconfig/network/dhcp file for details.
/etc/sysconfig/network/dhcp:# facility names supported by the dhcp4 client modifying the default
/etc/sysconfig/network/dhcp:# Request broadcast responses from dhcp-server.
/etc/sysconfig/network/dhcp:# facility names supported by the dhcp6 client modifying the default
/etc/sysconfig/network/dhcp:# to 'dhcp' (and possibly set STARTMODE='onboot').
/etc/sysconfig/network/dhcp:# When multiple copies of dhcp client run, it would make sense that only
/etc/sysconfig/network/dhcp:# Specifies the vendor class identifier string. The default is dhcp client
/etc/sysconfig/network/dhcp:# Specifies the user class identifier (array) to send in dhcp requests.
/etc/sysconfig/network/dhcp:# This setting controls whether dhcp client should try to use DHCP settings
/etc/sysconfig/network/dhcp:# provided in its last lease when the dhcp-server is not reachable and
/etc/sysconfig/network/dhcp:# This setting causes a sleep time before dhcp clients are started regardless
/etc/sysconfig/network/dhcp:# Note: RFC 2131 specifies, that the dhcp client should wait a random time
/etc/sysconfig/network/dhcp:# not get a reply from the dhcp server. Before you set this variable, take a
/etc/sysconfig/network/dhcp:# client when the BOOTPROTO is set to dhcp or dhcp6, and overrides
/etc/sysconfig/network/dhcp:# The dhcpv6 client will stop processing / fail after this time when it does
/etc/sysconfig/network/dhcp:# not get a reply from the dhcp server. Before you set this variable, take a
/etc/sysconfig/network/ifcfg-enp0s20u1u4:BOOTPROTO='dhcp'
/etc/sysconfig/kdump:# that contains the network device and the mode (static, dhcp, dhcp6, auto6),
/etc/sysconfig/kdump:# separated by a colon. Example: "eth0:static" or "eth1:dhcp".
/etc/dbus-1/system.d/org.opensuse.Network.conf:           send_interface="org.opensuse.Network.Addrconf.ipv4.dhcp"/>
/etc/dbus-1/system.d/org.opensuse.Network.conf:           send_interface="org.opensuse.Network.Addrconf.ipv6.dhcp"/>
/etc/iproute2/rt_protos:16      dhcp
/etc/YaST2/control.xml:        <!-- FATE #303875, see /etc/sysconfig/network/dhcp:WRITE_HOSTNAME_TO_HOSTS -->
/etc/YaST2/control.xml:        <!-- bnc#870896, see /etc/sysconfig/network/dhcp:DHCLIENT_SET_HOSTNAME -->
/etc/YaST2/control.xml:                    <name>setup_dhcp</name>
/etc/apparmor.d/abstractions/winbind:  /etc/samba/dhcp.conf        r,
/etc/apparmor.d/usr.sbin.dnsmasq:  /{,usr/}bin/{ba,da,}sh ix, # Required to execute --dhcp-script argument
/etc/wicked/extensions/ibft:	# Note: kvm/gPXE is using 0, even it is from dhcp
/etc/wicked/extensions/ibft:	nic_dhcp_server=`ibft_getattr "$nicpath/dhcp"`
/etc/wicked/extensions/ibft:	if [ -n "$nic_dhcp_server" -o "$nic_origin" -eq 3 ] ; then
/etc/wicked/extensions/ibft:		  <$nic_family:dhcp>
/etc/wicked/extensions/ibft:		  </$nic_family:dhcp>
/etc/wicked/server.xml:     addrconf supplicants like dhcp.
/etc/wicked/server.xml:       data obtained from addrconf services, such as dhcp -->
/etc/netconfig.d/dns-resolver:        # strip trailing dot added by dhcp 4.x dhclient(6)
/etc/iscsi/ifaces/iface.example:# "dhcp" and "static"
/etc/iscsi/ifaces/iface.example:# iface.bootproto = dhcp
/etc/iscsi/ifaces/iface.example:# iface.bootproto = dhcp
```

`/etc/sysconfig/network/dhcp` looks good enough per [2020-08-10 Kluster Rollout](7cxyj-mc2rk-jh88q-tx2nw-t8c2b)

but it doesn't appear to make it do what I want

trying setting `add_local_fqdn` to `3` on the router per https://openwrt.org/docs/guide-user/base-system/dhcp

oh wait that's for publicizing the router's address - found further documentation to that effect

## a pivot on the DHCP strategy

So, I wasn't able to get the static DHCP leases to set the fully-qualified hostname on stumethyst, no matter how much experimentation I did.

However, the more I think about it, the more I realize the way I'd been approaching DHCP had been founded on a router that doesn't have proper DNS resolution based on DHCP leases from received hostname.

I still think it's cool to have nodes use pre-assigned boutique IP addresses (at least for now), but I'm going to approach this a sensible way: I'll flash hostnames for each device's image, then have the router hand out static lease assignment based on recognition of those hostnames, rather than try to assign names externally via MAC address (which was too hardware/interface specific, anyway: I want these IP assignments to move with the hostname, not the hardware).

As such, I go ahead and unset the MAC fields in these DHCP reservations, and rearchitect the numbering plan so our static leases now look like this:

- stumethyst.kluster.testtrack4.com: 192.168.86.23
- stuby.kluster.testtrack4.com: 192.168.86.25
- stuphire.kluster.testtrack4.com: 192.168.86.27
- sturl.kluster.testtrack4.com: 192.168.86.29

Actually... it looks like the unbound/odhcpcd combination I'm using doesn't resolve names except for the couple hosts I have that expose just flat hostnames

looking at /usr/lib/unbound/odhcpd.awk to understand

## update later

I've filed a pull request upstream: https://github.com/openwrt/packages/pull/13096

I'll need to write up what I've summarized

## agh. anyway

Okay, so, each node has its FQDN in /etc/hostname, and I've disabled setting the hostname from DHCP...

and yet they still only get set to the first part. I check journalctl, and it looks like this gets set early in boot [by systemd](https://github.com/systemd/systemd/blob/619720ba0ac76da81e94497fba19a77f803a4d93/src/core/hostname-setup.c), but I can't see where in the code it would get truncated: I even set up [a playground implementation to double-check the cleanup behavior](https://cplayground.com/?p=pig-chameleon-dove).

I saw a suggestion that this is somehow baked in by dracut? but, like, looking at systemd's source, the only place I would expect that would be the kernel command line, and I don't see it in `cat /proc/cmdline`

## bottom line

I've decided that I'm gonna give up fighting this behavior of the system: Lennart originally objected to the notion of FQDN hostnames in 2013, pointing out that it makes it so the system can't be known by multiple FQDNs, ie. if it's on multiple networks (each network can have a domain, but the machine should have a common name).

What matters is that I've got a working DNS system that can route between the 4 full node names; I can set the transient hostname to the static before I run the `kubeadm` commands, and after that I shouldn't need to ever worry about this (and, indeed, one could argue I should set the static hostname back to the single-level name).
