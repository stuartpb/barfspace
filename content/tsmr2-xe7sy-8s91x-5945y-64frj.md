# Modern mDNS resolution on Arch

https://wiki.archlinux.org/index.php/Systemd-resolved#mDNS

## Implementing this on my pet systems

- [stushiba](hs8v7-1s5bg-8y8nn-a0e32-gvh8c)

## understanding the /etc/resolv.conf thing

the arch wiki says there are 4 ways, and the stub is recommended.

~~that seems outdated: [the man page it links](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd-resolved.8) lists three ways, and it recommends *against* the stub, for reasons you'd expect (ie. resolution features that can't be expressed through DNS protocol).~~

oh wait that's for regular operation, the resolv.conf part is different and is documented later on in the page.

okay this is just a legacy thing that provides systemd-resolved's features via an emulated DNS layer for things that read resolv.conf and think they should implement their own resolution based on that

and okay, resolv.conf doesn't have all the complexity you'd need to specify a fully-versatile DNS configuration, it's one of those things that requires a big hairy apparatus to map to a fully-flexible model. here's my summary of the 4 modes:

- provides a dynamic stub-resolv.conf that reduces all DNS to a single server providing the full interface, and search domains for everything outside DNS
- provides a static stub-resolv.conf that just lists the stub DNS server and does no magic updating, meaning no search domains
- provides a full dynamic resolv.conf that directly lists all system-wide DNS servers (but no per-interface ones, which it sounds like only the stub can mimic)
- follows resolv.conf instead of leading. resolv.conf has all the problems it's always had and won't get any of the functionality added by systemd-resolved (like, say, resolving our `.local` domains)

this really ought to be a matrix. "how you can set up networking on (Arch) Linux"

(thought here on how Arch/systemd handle this stuff [split out to a subpage](mq3cm-mv2mr-rwact-dsxpc-27sy6))

## caveats about systemd-resolved

[the thing about openresolv](https://wiki.archlinux.org/index.php/Openresolv#Users) seems important. either you fix this by setting the resolv.conf-led version (in which case systemd-resolved will get those apps' changes from there), or you install `systemd-resolvconf` to route it all through the systemd-resolved model

the list of network managers this affects seems less significant than the lway that basically every VPN seems subject to this

I guess my question is: do both ways handle mDNS over a VPN?

## what about broadcasting our hostname?

is this something you need avahi for? I think so

https://linux.die.net/man/5/avahi-daemon.conf describes some of how the default system hostname gets put out there

https://wiki.archlinux.org/index.php/Avahi#Hostname_resolution

it seems like running the Avahi daemon but not including it in nsswitch.conf should be enough to prevent it being consulted for mDNS resolution?

## oh, now I understand hostname broadcast

this is handled by the network manager (ie. systemd-networkd or NetworkManager) on a per-network basis, which is right af

https://wiki.archlinux.org/index.php/Systemd-resolved#mDNS gives the links

https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.network.5 maps "true" to "broadcast and resolve", "resolve" to "resolve but don't broadcast", and "false" to "disable mDNS"

similarly, https://jlk.fjfi.cvut.cz/arch/manpages/man/nm-settings.5 uses "no" (0) for disable, "yes" (2) for broadcast and resolve, "resolve" (1) for resolve-only, and "default" (-1) for "use whatever the globally-configured default is".

the manual notes that this requires a plugin? gonna go ahead and assume that's implicitly handled by the packager under the hood

I think I'm gonna try a default of "resolve" for both my systems, and set "broadcast" for my trusted networks. maybe even have a "trust network" script that enables any other stuff you might want to reconfigure

or, really, what I'd like to do is just set `MulticastDNS=resolve` in [resolved.conf](https://jlk.fjfi.cvut.cz/arch/manpages/man/resolved.conf.5), and have the nm default fall back to that (so that I wouldn't have to change the value if changing the network management implementation, ie to systemd-networkd)? [NetworkManager's docs][] make it sound like that should work:

> connection.mdns
>
> If unspecified, the ultimate default values depends on the DNS plugin. With systemd-resolved the default currently is "no" (0) and for all other plugins also "no" (0).

[NetworkManager's docs]: https://jlk.fjfi.cvut.cz/arch/manpages/man/NetworkManager.conf.5

but the Arch Wiki suggests it won't? (emphasis mine):

> mDNS will only be activated for the connection if **both the systemd-resolved's global setting** (`MulticastDNS=` in resolved.conf(5)) **_and_ the network manager's per-connection setting** is enabled. By default systemd-resolved enables mDNS responder, but both systemd-networkd and NetworkManager do not enable it for connections

but that might just be a paraphrase of resolved.conf's docs:

>`MulticastDNS=`
>
> Takes a boolean argument or "resolve". Controls Multicast DNS support (RFC 6762) on the local host. If true, enables full Multicast DNS responder and resolver support. If false, disables both. If set to "resolve", only resolution support is enabled, but responding is disabled. Note that systemd-networkd.service(8) also maintains per-link Multicast DNS settings. Multicast DNS will be enabled on a link only if the per-link and the global setting is on.

## a thing I'm noticing, taking a look at that resolved.conf docs bit again

Hey, that implies that setting `MulticastDNS=resolve` would globally restict mDNS to resolution-only, even if the network supported broadcast, doesn't it

## how this would interact with a systemd-networkd installation

I *think* systemd-networkd would respect this value...

oh, okay, looks like you'd need to do something so that systemd-networkd could enable broadcast/resolution by default (if you want to be promiscuous like that), because [the per-link default is false](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.network.5.en). not gonna bother learning how that works right now, except to note that [the systemd-networkd man page](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd-networkd.service.8.en) says it sets default values based on [systemd.netdev(5) files](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.netdev.5.en)

in other words, NM has a fallback default value, and sd-nd has a default initialization value

## bottom line

so, to recap: yes, setting `MulticastDNS=resolve` would set a baseline of mDNS resolution, but it sounds like that wouldn't permit broadcast without changing it, even if the network supports it. Both NetworkManager and systemd-resolved need their own configuration (based in different models) to enable mDNS on their end

so, if you want to permit hostname broadcast on even *one* network, you'd want to configure systemd-resolved's `MulticastDNS=true`, and then configure your network management provider to handle which networks get which behavior

## systemd-networkd instead of networkmanager?

https://wiki.archlinux.org/index.php/Systemd-networkd

https://forum.manjaro.org/t/how-to-use-systemd-networkd-to-manage-your-wifi/1557

the "needs sudo to connect to wifi" thing is kind of a bummer

I might switch to this on stushiba, if it's as well supported by GNOME Settings as NetworkManager? In fact, if GNOME can give the same experience through sd-nd as it does for NM for wi-fi, I might just switch on Stuzzy. Would want to look into it first

## oh hey this is neat

https://wiki.archlinux.org/index.php/Alternative_DNS_services

I knew about 1.1.1.1 and 8.8.8.8, but I hadn't heard of Quad9 `9.9.9.9`

found on the line explaining default values on https://wiki.archlinux.org/index.php/Systemd-resolved#Fallback

# odd thought

wow what if you extended this to be able to read DNS from etcd? this seems lighter weight than CoreDNS, might be a cool way to implement kube-dns. that would also match my dream of being able to have a home DNS server resolve .local for machines that don't have a proper implementation

wait, the skydns model is totally different from the Kubernetes model, this'd totally be more complicated than CoreDNS as a

but yeah, the idea of interfacing mDNS with my household DNS system (both from a broadcast and resolution standpoint) is still something I'm interested in
