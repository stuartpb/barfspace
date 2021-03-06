# A Few More Thoughts Before Starting the Rollout

following from [Stubernetes System Chart Initial Development Log](tj0yq-8232z-rrbef-rv0n6-thpm8)

I've decided that, this time, I *will* actually set up and use a household Ingress system (instead of setting up LoadBalancer IPs for web apps), and am working on a Project Contour HelmRelease that will deploy Envoy to every internal machine to be able to serve internal services as appropriate.

This should automatically take care of one of the details I thought was dumb about just deploying Traefik: if four services are spread across four different nodes, they don't all have to point to the same two nodes that are serving the ingress. Envoy + external-dns can point the record for the service directly at the machine it's running on. Right?

## aside on the "heterogenous network cluster" idea

I've been thinking that'll be how I'd route traffic, but...

## a solution on how to address nodes

OpenShift has a CoreDNS plugin for translating mDNS records to a given domain (ie. so "stuchip.local" becomes "stuchip.example.org").

I'm thinking I'll introduce a `st8s.stuartpb.com/zone` label where everything in the household is `st8s.stuartpb.com/zone=403`, and then the public-facing internet would be `st8s.stuartpb.com/zone=exposed`

this is different from topology.kubernetes.io because those could overlap if the cluster were to expand out to cloud providers.

anyway, you'd have a DNS server then providing all the addresses internally under an (ACME-certifiable) public name like `stuchip.403.stuartpb.com`

and so then that'd be the hostname, `studtop.403.stuartpb.com`, and that's how nodes would associate to the network / discover each other

## and this comes back to the heterogenous-cluster thing

this works within one zone, but these addresses wouldn't be routable outside our network - and I don't think any amount of Weave (or Flannel or any other CNI) can fix that, because it's the level the CNI is established at.

so there'd have to be some setup where there's only one master node representing 403 to the public Internet, and it's exposed through the router

and I don't even know if that would actually work without still basically needing all the network's nodes to be accessible

this is probably where looking into cluster federation matters but whatever. bottom line is, this is promising but still kind of a half-baked seed idea

## more about that DNS idea

- Is there a way to plug additional zones into the kubeadm-provisioned CoreDNS?
  - Just replace it with a HelmRelease where you change `servers:` in the values?
  - You could have a ConfigMap that's managed by an operator, I know that's sort of the hacky way k3s shares host names to the cluster
- See, I'm thinking I'd want to work these zones into the Household DNS, too

## looking a little more

It looks like I could maybe set up a second Contour that gets forwarded to `address.exposed` via the Dumb Tunnel plan, and then configure `ingress-status-address` to point to that? Can I even set the dumb tunnel up as an out-of-cluster Envoy thing?

## anyway, for now

So, we'll roll out Contour (as household-ingress) right after MetalLB (and maybe after OpenEBS and Prometheus, for CRD purposes), then we'll roll out the Dashboard with an Ingress and see if Household DNS points us to it

After that, I'll look at [Pomerium and Dex](meskp-gdg9b-mv8ad-jnn3z-9ctc7)

and then I'll see if we can bring back household-notes
