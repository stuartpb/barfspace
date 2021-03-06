# mDNS for Studtop / k3OS

https://www.centlinux.com/2019/05/configure-network-on-k3os-machine.html doesn't impress me much:

- it's running these `connmanctl` commands? and then restarting? does connmanctl really persist data?
- it describes how to change the hostname, but not, as I realized after I'd done it a couple times, how to migrate to the new server name
  - even just telling the server its old name is no longer a node to track, as I did
  - but you could probably achieve this by "draining" the old name and somehow recognizing yourself by the new name?
    - A new running instance of kubelet/`k3s server`?

but anyway, it feels like it's pointing me in the right direction: this was one of the top search results for "k3os mdns".

Looking into it a little more:

- [connman documentation root](https://01.org/connman/documentation)
  - [config format documentation](https://git.kernel.org/pub/scm/network/connman/connman.git/tree/doc/config-format.txt)

Okay, so it looks like Connman's mDNS thing is just for hooking into systemd-resolved.

[and yet the Arch Linux people don't even think of connman as being compatible with systemd-resolved](https://bbs.archlinux.org/viewtopic.php?id=253717), though that might have something to do with the Avahi context this was initially brought up in?

also, [this mailing list post from a couple months ago couldn't figure it out](https://lists.syncevolution.org/hyperkitty/list/connman@lists.01.org/thread/SONLZBBHWPBGQ3ELUFACED2G3FAISNJN/)

I'm okay putting this to the side for now

## one thought does occur

Is it possible to just install mdns into the cluster? like, can I just have MetalLB or whatever find a HostPort for it and broadcast out into the LAN?

Deeper into this: [Kubernetes and mDNS](g8t4j-w7e5t-0g9rc-6h9p6-4y3wn)

## another thought about mDNS and in-cluster/household service

this does kind of overlap with my idea to have a local-network DNS server that queries mDNS for .local addresses, serving as a polyfill for systems that don't support mdns natively

I feel like this generally isn't handled by a dedicated service these days? like, Avahi is WAY complicated.

but then, maybe that's appropriate here. Heck, maybe we want some kind of complex declarative Avahi declaration for a bunch of our local services? I mean... hmm

Man, actually, is this a default k3os feature? feels like that'd be pretty cool, and like something I might have seen in the setup, for your k3os node to respond to `hostname.local` by default

## another thought

How does pwnagotchi do it? probably by `systemd-resolved`

## totally(?) unrelated thing that came up in Googling

apparently there was a point where kube-dns might be running systemd-resolved?

https://rancher.com/docs/rancher/v2.x/en/troubleshooting/dns/#check-upstream-nameservers-in-kubedns-container

## a heads up I'm seeing

Looks like connman might do the same thing as systemd-resolved or whatever re: starting up a local DNS server to emulate higher-level name resolution

https://wiki.archlinux.org/index.php/ConnMan#Avoiding_conflicts_with_local_DNS_server

this probably wouldn't affect an in-cluster mDNS server, though? does our server have to run on the same interface as whatever thing connman would spin up would be on?

## other conflict notes

- [seven-year-old mailing list thread](https://connman.connman.narkive.com/4bgmauQY/connman-avahi-conflict)
