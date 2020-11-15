# Ingress Controller Shootout

This was a bunch of "thought" I was going to put into reconsidering my choicec of ingress controller before I ultimately cheesed it and decided I'm [Moving to ingress-nginx](8hs34-qrjyd-04a0f-ms2cp-y214p)

## sources

- https://medium.com/flant-com/comparing-ingress-controllers-for-kubernetes-9b397483b46b
  - https://docs.google.com/spreadsheets/d/1DnsHtdHbxjvHmxvlu7VhzWcWgLAn_Mc5L1WlhLDA__k/edit#gid=0

## Background

Initially, I was on k3os, so I used Traefik, even though they tried to roll it back to nginx.

A few things about Traefik skeeved me out (like any ingress class using it needing to end with "-traefik"), so when I jumped to Kubic, I decided to go with something else. The nginx one seemed just as bad, so I picked Contour.

## A momentary aside about Traefik and its ilk

so also Caddy, Kong...

having built-in Let's Encrypt support is something I now regard as a misfeature. cert-manager should be handling that for you, especially considering that you might need to use DNS-based challenges if your app is internal - and you should be setting your email address! And you need clear centralized quota management to ensure stuff like that you don't request the cert for a domain more than five times a week!

it's not like (Cluster)Issuer is a hard CRD to write

## Why Contour?

I'm not sure what it was that drew me to Contour, but I think these were some of the main factors:

- Envoy-based.
  - When you look at the landscape of what's out there relative to this purpose, it becomes really clear that Envoy is the future, and the plethora of alternatives that are also Envoy-based
  - a Deployment for a controller to endpoints that are defined as a DaemonSet really makes a lot of sense
- Originally made by Heptio, a company made to support Kubernetes, started by [two of the creators of Kubernetes](https://www.vmware.com/company/acquisitions/heptio.html), now owned by VMware (who have a good enough track record with stuff like Redis)
- Designed for Kubernetes, instead of being something that was made for OpenShift or whatever
- Now maintained by an independent project group [under the CNCF](https://www.infoq.com/news/2020/07/cncf-contour-kubernetes-ingress/)
  - one of the leads(?) is Dave Cheney of github.com/pkg fame

## What else is out there?

- https://medium.com/swlh/kubernetes-ingress-controller-overview-81abbaca19ec
- https://www.reddit.com/r/kubernetes/comments/9jaqfz/what_ingress_controller_are_you_using_and_why/

## HAProxy Ingress

https://haproxy-ingress.github.io/

not sure how one sets ingress.class here
