# Cluster DHCP / Node Name Resolution DNS Server

All the nodes can ship pre-configured to look for a specific DHCP server, or to use a server for DNS, for names in a cluster node name zone

You can also do it so each node is preconfigured with its own IP - this actually seems the most straightforward, the way this is being designed

Anyway, the best way to handle node DNS would be to ship them out as part of the image routing to a fixed IP address

from the definition of the nodes in the cluster, from the Kubernetes API, pushed like External DNS to a configured nsd (and unbound maybe?)

anyway, this DNS server can then be configured as the search path for names under the cluster node namespace (something like `nodes.cluster.local` by default)

### more on systemd-networkd capabilities

https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.network.5

remember, DHCPServer to run a DHCP Server for an interface is an option

damn, you can even set explicit ARP neighbors!

### what about mDNS et al?

idk, they seem really complicated, I haven't quite grasped how they'd fit into my existing setup, and I can figure out more clearly how this would work without them.

Is it less cooperative than one of those solutions might be? Maybe. Is there anything to be lost in being so?
