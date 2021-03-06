# systemd-resolved and Kubernetes

- https://godoc.org/k8s.io/kubelet/config/v1beta1
- https://github.com/kubernetes/kubelet/blob/master/config/v1beta1/types.go#L296

> clusterDNS is a list of IP addresses for the cluster DNS server. If set,
> kubelet will configure all containers to use this for DNS resolution
> instead of the host's DNS servers.

- https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/

> Comma-separated list of DNS server IP address. This value is used for containers DNS server in case of Pods with "dnsPolicy=ClusterFirst". Note: all DNS servers appearing in the list MUST serve the same set of records otherwise name resolution within the cluster may not work correctly. There is no guarantee as to which DNS server may be contacted for name resolution. (DEPRECATED: This `--cluster-dns` parameter should be set via the config file specified by the Kubelet's `--config` flag. See https://kubernetes.io/docs/tasks/administer-cluster/kubelet-config-file/ for more information.)

- https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/#known-issues

> Some Linux distributions (e.g. Ubuntu) use a local DNS resolver by default (systemd-resolved). Systemd-resolved moves and replaces /etc/resolv.conf with a stub file that can cause a fatal forwarding loop when resolving names in upstream servers. This can be fixed manually by using kubelet's --resolv-conf flag to point to the correct resolv.conf (With systemd-resolved, this is /run/systemd/resolve/resolv.conf). kubeadm automatically detects systemd-resolved, and adjusts the kubelet flags accordingly.

oh okay, they're talking about using the resolv.conf fallback implemented by systemd-resolved, because the stub resolver definition ("ask the DNS server running on yourself") doesn't work in most containers (and the ones it would need to be able to resolve outside domains as well). okay cool yeah I want to do this now

> Kubernetes installs do not configure the nodes' resolv.conf files to use the cluster DNS by default, because that process is inherently distribution-specific. This should probably be implemented eventually.

Ohh, I... get it? the node's own resolv.conf isn't tweaked to resolve names within the cluster? because, like, editing resolv.conf isn't the smoothest way to get data back into systemd-resolved, and it's probably even worse under NetworkManager et al? but distro authors should consider it? huh.

but yeah, following [the whole Next-Gen Distro Plan](p3rh2-96gvn-rmb39-rg74d-tcbjj), that probably would be a thing to include under systemd-networkd's Routing Domains
