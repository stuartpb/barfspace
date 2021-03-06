# Retracing household-dns

Reviewing the notes from May 27-29 to reconstruct what the reimplementation strategy should be for DNS:

- [The SkyDNS half of household-dns](b66ya-c3y6d-8b87k-q1bvf-kmn05)
- [Finishing the CoreDNS half](gjz6j-9sfy9-gv90y-46tcf-9yd89)
- [o brave new world, that has such servers in't(ernal)](cbepz-whfkc-8cap1-8c26n-ws9wb)

going to kubeapps and creating a household-system namespace

## Installing bitnami's etcd chart

- calling this `household-dns-etcd`
- keeping `allowNoneAuthentication`
  - (even though that won't mean anything outside of Bitnami's image, it prevents the chart from erroring)
- not changing `clusterDomain`, that just seems like a recipe for trouble
- setting `persistence.enabled=false` since persistence will be coming from the control plane

### new since Take 1

- enabling metrics (`metrics.enabled=true`)
  - I can figure out all the `serviceMonitor` stuff some other time
  - probably the kind of thing you only need for more important pods

### stuff that didn't pan out

- setting upstream image:
  - per https://github.com/etcd-io/etcd/releases, `gcr.io/etcd-development/etcd` is the primary upstream image source for etcd
  - might need to be careful that it [doesn't try any etcdctl trouble](https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/container.md#docker)
  - also note this entails changing the tag to start with "v"

looks like they change the run structure too much - the stock image will require a more extensive rewrite for an nph chart

## Installing Bitnami's external-dns chart

- calling this `household-dns-announcer`
  - this way components will look like `household-dns-announcer-external-dns` which is right
- Setting provider to "coredns"
- setting coredns.etcdEndpoints to "http://household-dns-etcd.household-system.svc.cluster.local:2379"
- annotationFilter: `st8s.stuartpb.com/internal-name=coredns`
- setting `triggerLoopOnEvent` to `true` and `policy` to `sync`
- setting `registry` to `noop`

## aborted plans

- Looks like upstream [also releases images on GCR](https://github.com/kubernetes-sigs/external-dns/releases)
  - though I gotta say "k8s-artifacts-prod" does not feel like a super stable location
  - considering how etcd failed, I'll hold off until making an nph chart for this

## Installing CoreDNS

from stushiba's stubernetes-setup checkout:

- copied helm-charts/stable/coredns/values.yaml to stubernetes-setup/values/household-dns.yaml
- reviewed latest version of values and backported diffs in (no real difference fwict)
- `cd ~/workspaces/stubernetes-setup`
- `helm repo add stable https://kubernetes-charts.storage.googleapis.com/`
- `helm install --dry-run -n household-system household-dns -f values/household-dns.yaml stable/coredns > resources/household-dns.yaml`
- making changes to that file:
  - removing the opening block and closing notes
  - adding the `metallb.universe.tf/allow-shared-ip: "true"` annotation to the Service
  - making a duplicate of this section
  - changing the names to add "-udp" and "-tcp"
  - deleting the opposite port from each
  - saving as "resources/household-dns.yaml" in my `stubernetes-setup` folder
  - `cd stubernetes-setup/resources/ ; kubectl apply -f household-dns.yaml -n household-system`
  - all this was to, basically, bump the coredns chart version in use for all the annotations, and that's about it

## Not rolling out names

I *was* going to have the internal services (ie. Dashboard and Kubeapps, currently) named and exposed as LoadBalancers, but since I'm looking at Pomerium setup soon, I actually think I'll hold off on configuring these names until that's in place

(Echo from the future: same deal applies if you've implemented Ingress for the cluster)

So for now I'll just let this hang

```yaml
    annotations:
      external-dns.alpha.kubernetes.io/hostname: dashboard.stubernetes.internal
      st8s.stuartpb.com/internal-name: coredns
# etc...
```
