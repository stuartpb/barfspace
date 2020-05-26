# Possible household-dns implementation

This was the possibility I saw for Stubernetes and went "nah" thinking I'd use k8s_external instead

https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/coredns.md

another similar tutorial that references that one for KubeFed (in alpha): https://github.com/kubernetes-sigs/kubefed/blob/master/docs/ingress-service-dns-with-coredns.md

## on etcd

https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/

https://hub.helm.sh/charts/incubator/etcd or https://hub.helm.sh/charts/bitnami/etcd seem less elaborate, and less deprecated

## probably gonna go with this serving a .internal zone

I was also thinking about using the old technique to connect directly to hosts that'd otherwise be hosted externally by having them be CNAMEs to LoadBalancer, which this wouldn't support...

Eh... that might be something External-DNS can handle, whether to prefer the DNS entry suggested by LoadBalancer or Ingress (maybe with the help of some labels/annotations)?

## anyway, implementation

I'm thinking this'll be a Chart at `pluskube/external-coredns` or something like that that deploys a Service that makes however many Replicas of a Pod with containers for `etcd`, `external-dns`, and `coredns`. The function of the chart is the core thing: the images inside it, like, having to spawn a throwaway `etcd` as a communication channel for a service that's just pulling its data from a control plane that's already probably `etcd`, that's not great - but they can be swapped out for any cleaner implementation that provides the same functionality.

## on naming

I was originally thinking of calling it `ingress-dns`, but it also does Services, and `service-dns` doesn't make sense

I was also thinking of calling it `external-dns-server` because it ties a server to `external-dns`

Maybe `standalone-dns` or `external-hostname-server`?

The pod can expose a Service for CoreDNS (just in case any outside pod wants to piggyback)

Or, really, there should be a Pod that ties external-dns to an etcd, and then another pod that runs CoreDNS that can pull from that etcd instance

call it `external-skydns`

or, hell, I don't know

## wait, yeah, back to that thing about not having Ingresses

That could actually be kind of cool: isn't this also supported with external-dns?

That's the issue, actually: I don't know a Resource type in Kubernetes other than Ingress that defines a Service with an external hostname

Ah, okay, this is what I was trying to figure out: what it is is external-dns has an annotation `external-dns.alpha.kubernetes.io/hostname` that you can put on Services (and Ingresses) to tell it "this is the external name for this Service"

Found looking at the documentation for [ExternalName][], which is essentially just "how you set up CNAME/AAAA records" when paired with this annotation

[ExternalName]: https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/externalname.md

It'd've been more obvious if I'd just [read the FAQ](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/faq.md#how-do-i-specify-a-dns-name-for-my-kubernetes-objects), though

The FAQ also illuminates that there's an [annotation filter](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/faq.md#running-an-internal-and-external-dns-service)

It's dumb that you'd put the `ingress.class` annotation on a resource that's not an Ingress, but [there doesn't seem to be multiple annotation support on the horizon](https://github.com/kubernetes-sigs/external-dns/issues/709)

What I think I'd do is just use a different annotation altogether to signify "expose this item's DNS internally/externally", since Ingress is moving toward IngressClassName instead of this annotation (and I could still specify two annotations)

Okay, so yeah, if I use this external-dns approach, I don't even need the "k8s_external" CoreDNS plugin, which is garbage

This even goes in tandem with Ingress hosts: https://github.com/kubernetes-sigs/external-dns/issues/1053

## A key thought

- If I were to use external-dns for *external* sites...
  - I think the Ingress server would need to be on an in-cluster node
    - This does overlap with the Early Ingress Ideas, though
  - I can't just sidecar it out and use external-dns to set a bunch of CNAMEs to `address.exposed`
    - ...or can I?

## more thoughts on naming and factorization

Let's see, it's like a proxy DNS resolver that answers internal names... that routes to services...

service-dns-proxy, service-name-resolver?

this is the big reason I'm thinking it'd make sense to have the pod with the external-dns/etcd be separate from the CoreDNS definition. there are potentially a lot of CoreDNS pods that could be interested in this CoreDNS, or even just, you know, a normal need to scale CoreDNS, or lifecycle stuff where it has to do a failover. the DNS server's lifecycle shouldn't be tied to the

another way to conceptualize Pods: they're like a little machine, and the Container is a module of that machine

you could also make it so the etcd scales as its own cluster separate from the external-dns operator and all that shit

actually... don't we want, like, one external-dns operator, and then one connected etcd instance on every node that might have a CoreDNS?

if I can figure out a *normal* way to make that kind of put-a-connected-instance-on-every-node-needing-the-service scaling happen - like it can be a ClusterService that doesn't get provisioned to nodes that don't need it, and it's clear how to connect all the etcd instances - then I might do this, but otherwise it's `external-skydns` pods and, you know what, you want them to scale you just have to duplicate the controller a bunch. you've already got the control plane doing the heavy lifting for distribution, why bother throwing extra overhead at the network to sync a redundant subset

## You know what?

After seeing that bitnami has charts for both external-dns and etcd, I'm just gonna try bootstrapping this with a few standalone Bitnami charts
