# kubernetes ingress and the outside world

https://kubernetes.io/docs/concepts/services-networking/ingress/ is the way HTTP(S) maps from edge servers to app servers in k8s

https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/ are the bits that set up those edges

simpler constructions (and non-HTTP applications) can use NodePort - indeed, the default configuration for the Getting Started deployment uses a NodePort to expose the actual edge service (see the section in the "baremetal deploy" docs below)

there's also LoadBalancers which are over my head rn tbh

## getting by with nginx

https://github.com/kubernetes/ingress-nginx/blob/master/README.md

which links to https://kubernetes.github.io/ingress-nginx/ for real documentation

https://kubernetes.github.io/ingress-nginx/deploy/

https://kubernetes.github.io/ingress-nginx/deploy/baremetal/

## encrypting via Let's Encrypt

One nice thing about Kubernetes' whole magic-ops design should be that it'd be straightforward to make HTTPS authenticated with a trusted cert via [Let's Encrypt](9tj8g-28tkm-ppaxf-12j0p-r6704).

There's the traefik IngressController which isn't in-tree, but seems to have this kind of certificate management built in?

anyway, there's bolt-on scaffolding that's alluded to in various parts of the tree in the form of [cert-manager](https://github.com/jetstack/cert-manager/), which presumably uses Kubernetes' certificate infrastucture for compatibility with all kinds of ingress controllers

getting cert-manager bolted on involves [helm](q1dhx-pw9bn-rpad8-k56f9-gpb43)
