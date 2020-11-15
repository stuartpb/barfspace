# Abortive early idea for a custom CoreDNS

I originally thought CoreDNS had a plugin analogous to external-dns. I had a note "TODO: go back and find CoreDNS doc links - was looking at [prs](https://github.com/coredns/coredns/pull/2379)"

[right around the same time I realized how bad k3s's built-in services were](a5a7h-cbmvc-tc9jj-8gafa-6n9mk), I realized I was wrong, and that the actual `k8s_external` plugin is pretty much only capable of a crappy limited subset of external-dns's [fqdn-template](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/faq.md#how-do-i-specify-a-dns-name-for-my-kubernetes-objects)

see [the docs](https://coredns.io/plugins/k8s_external/), which illustrate just how limited their implementation is. and looking closer at [its code](https://github.com/coredns/coredns/tree/master/plugin/k8s_external), it seems like Caddy is a core component somehow?? yikes

[here](ekme6-mhmzs-ytaej-g50g7-dhdtf) was the beginnings of an idea of how I would work with that, before I just accepted that the "bundle of dynamite" triple-container-pod approach would be much more straightforward.

The idea was, I'd have internal service records for all the services I wanted, and I'd give them hostnames by adding CNAMEs to those addresses exposed by `k8s_external` by adding them to a static part of the ConfigMap. For ingresses, I'd point them at the service for the ingress server managing their class of ingress.

The most awkward part of this is that it would have meant piggybacking off of the `kubernetes` plugin that's designed for serving the cluster DNS; like, really, I'm pretty sure `k8s_external` isn't really for "external names" so much as it is, like, a redundant form of service discovery (or not redundant? see the notes about [interst in mDNS](g8t4j-w7e5t-0g9rc-6h9p6-4y3wn) which intersects discovery)
