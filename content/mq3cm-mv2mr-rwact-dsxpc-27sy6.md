# a brief thought explaining systemd-resolved, and systemd in general

split off from [the overall notes on systemd-resolved](tsmr2-xe7sy-8s91x-5945y-64frj)

(note: I don't know the specifics here, this is just a common enough pattern I've seen in other places where Arch punts instead of inventing provincial distro crap, like, you know, the whole run script system)

resolv is a historical artifact from before a lot of DNS stuff had settled. it allows flexibility where you don't need it (and, indeed, where flexibility will likely introduce headaches due to consolidation around the common base), because at the time that kind of modularity was useful for extending whatever new DNS features were emerging (like mDNS)

today, that kind of expanded functionality (like DNS-over-HTTPS) needs to be widely agreed upon, and integrated into your stack properly: site-specific customizations to the common DNS base will just get you in trouble. it's a vector for bugs as parts don't get upgraded in lock-step, and it introduces overhead and slowdown and spooky action at a distance and other such crap.

this also reflects, like, every Debianism: contrast with some of the stuff I've been observing in using the PocketC.H.I.P.
