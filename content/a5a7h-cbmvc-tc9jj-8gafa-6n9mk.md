# making changes to Stubernetes

Following the [latest plan](5ev3h-pts9d-4dacg-wrhfm-rtrac)

## setting up the DNS

Opening up Kubeapps via the Ingress I have set up for it

## ah heck

Okay, it looks like CoreDNS's `k8s_external` is pretty much only designed to work alongside a cluster DNS? that's dumb but OK, sure whatever

So here's my new plan:

- add the `stubernetes.internal` zone to my existing CoreDNS
  - checking how k3s does CoreDNS deployment to make sure this is fine
- add a new CoreDNS instance that basically just proxies the internal zone and falls back for everything else
- make changes for better internal DNS entries to the configmap there

## slight hitch

oof: looking [here](https://github.com/rancher/k3s/blob/master/pkg/server/server.go) and [here](https://github.com/rancher/k3s/blob/master/pkg/deploy/controller.go), it looks like k3s will clobber any service that resembles the one it would set up by default unless you use `no-deploy` for it 
