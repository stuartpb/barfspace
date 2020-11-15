# May 16 State of the Cluster

As of May 15, 2020, my cluster is mostly like a stock k3s installation:

- A static hostname has been set.
- My GitHub user has ssh key access.
- Deployment of servicelb is disabled, and `metallb` is installed.
- kubernetes-dashboard and kubeapps are installed.

(This list should get updated to summarize other changes that have been made.)

## Rework plan

I'm planning to rework the system:

- Gonna disable the local-volume provisioner in favor of setting up Longhorn.
- Gonna re-upload the traefik resource with my own `ingress` version that doesn't use Rancher's image.
  - Might also jump to Traefik v2 or Nginx.
- Gonna re-upload the CoreDNS defintion as `cluster-dns` which is, you know, confusing next to `kube-dns`, but, whatever, we'll fix it later
  - this also makes it less ambiguous if/when I insert another DNS service meant to be for internal DNS resolution

At some point I'll probablty want to do this for metrics-server too, but I'll tackle that later

## Name thinking

Thinking about these names a bit... actually, let's start identifying a set ie. ingress/dns/lb, as "household". I was blanching at using that as the name instead of "internal" or local, but, like, those can be ambiguous as "cluster-internal" or "machine-local": this serves as the same level of scope identifier as "corporate" or "team"

Also helps me to really conceptualize the zones better

So yeah, I'll actually be starting with "household-ingress" as a potential Ingress redeployment later

## So, updated plan

- Remove the stock `traefik` ingress stuff altogether - new ingress apps will need more configuration, which can be devised later.
- Replace the `nodeploy` for servicelb with `disable` since that's the world we're moving toward: one where, if something goes wrong and it gets re-provisioned, it'll get de-provisioned just as quickly.
- Move (ie. redeploy) the MetalLB stuff to `household-lb`
  - Eh, since this is in its own namespace it's safe enough for now imo

