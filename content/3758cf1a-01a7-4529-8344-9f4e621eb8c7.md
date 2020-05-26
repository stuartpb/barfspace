# Setting Up household-ingress

Starting from https://docs.traefik.io/getting-started/install-traefik/#use-the-helm-chart

https://containous.github.io/traefik-helm-chart

installing that repo into Kubeapps

wow, their Chart/repo really sucks on kubeapps! (logo broken, it lists all old versions as dated to the last release, etc)

## trying to understand the config options

the bit for additional deployment annotations "(e.g. for jaeger-operator sidecar injection)" doesn't seem like it'd apply here

https://www.jaegertracing.io/docs/1.18/operator/#auto-injecting-jaeger-agent-sidecars is what that's all about

also pod annotations "(e.g. for mesh injection or prometheus scraping)". sounds like a thing we can change in post

(while we do plan on adding a sidecar for port forwarding, that probably won't be via annotations)

I'm just gonna go ahead and be like "sure" for the dashboard IngressRoute annotation?

## a quick note

a lot of these CRDs (like "TraefikService") seem to be, like, redundant to Kubernetes constructs (like... "Service")

I don't plan on really using any of them, since the big idea here is that the ingress server should be easily replaceable with a different implementation

Like, TBH, if I could use these to set up Ingress support, like, if I could use an IngressClass to define a template IngressRoute to apply to Ingresses

## on that note

looks like I have to uncomment `"--providers.kubernetesingress"` for `additionalArguments` to get proper Ingress support in 2.0

## also, on ingress class

it appears IngressClass isn't truly merged yet: https://github.com/containous/traefik/issues/6690

as such, per https://docs.traefik.io/reference/static-configuration/cli/ we'll also need to set `--providers.kubernetesingress.ingressclass=traefik-internal`

## anyway, back to the configuration

skipping over env and envFrom

ports looks fine to me

## service configuration

under service, gonna give it a `loadBalancerIP: "192.168.42.80"`

Not gonna bother with `nodeBalancerSourceRanges` since, among other things, I don't think MetalLB supports it

## Wait, why is `externalIPs` here?

(for these first couple paragraphs I forgot what `externalIPs` was for - imagine I'm talking about some other field)

The `externalIPs` thing, like, https://kubernetes.io/docs/concepts/services-networking/service/ says "`externalIPs` are not managed by Kubernetes and are the responsibility of the cluster administrator." so does that mean I can implement them however I want? because I totally want to make an operator that spawns sidecars to hook those up to forwarding nodes registered via a CRD (and then I could have another operator that spawns those nodes like inlets-operator)

or maybe we do this with an annotation that tells said operator to attach the sidecar to everything described on the Service resource (or a subset, selected by another annotation). and then that provisions and sets the `externalIPs` accordingly

oh, right, `externalIPs` is for defining *out-of-cluster resources* - it's there so you can define something in place of a Kubernetes asset, when hooking Services into a Pod or whatever. Weird that this config has an option to set them?

## anyway, more config

yeah, leaving horizontalpodautoscaler off

not enabling persistence

## not using hostNetwork

this `hostNetwork` thing, if I understand correctly, would be a *terrible* idea, and as such I'm amazed k3s isn't using it

like, even k3s has `servicelb` to take care of this. hooking a pod straight to the host network is such a bad idea

## more config

not putting any resource requests/limits on this, screw it

also no affinities/nodeSelectors/tolerations

not setting a priorityClassName, not changing the securityContext stuff

## in summary

here's the patch as Kubeapps presents it:

```diff
@@ -50,10 +50,11 @@
	  # Configure Traefik static configuration
	  # Additional arguments to be passed at Traefik's binary
	  # All available options available on https://docs.traefik.io/reference/static-configuration/cli/
	  ## Use curly braces to pass values: `helm install --set="additionalArguments={--providers.kubernetesingress,--log.level=DEBUG}"`
	- additionalArguments: []
	- #  - "--providers.kubernetesingress"
	+ additionalArguments:
	+   - "--providers.kubernetesingress"
	+   - "--providers.kubernetesingress.ingressclass=traefik-internal"
	  #  - "--log.level=DEBUG"

	  # Environment variables to be passed to Traefik's binary
	  env: []
	@@ -117,11 +118,11 @@
	    # Additional annotations (e.g. for cloud provider specific config)
	    annotations: {}
	    # Additional entries here will be added to the service spec. Cannot contains
	    # type, selector or ports entries.
	-   spec: {}
	+   spec:
	+     loadBalancerIP: "192.168.42.80"
	      # externalTrafficPolicy: Cluster
	-     # loadBalancerIP: "1.2.3.4"
	      # clusterIP: "2.3.4.5"
	    loadBalancerSourceRanges: []
	      # - 192.168.0.1/32
	      # - 172.16.0.0/16
```

agh! it failed because I didn't change out from "All namespaces"

Really, though, which namespace should this be in? I know "kube-system" has some special properties that make it a good pick for the cluster DNS, but, like...

I'm looking into what makes kube-system special, and it seems like it's the default permissions given to ServiceAccounts in it? And, like, can't we get those permissions in other namespaces (like how Longhorn be)?

anyway, I've decided to create a `household-system` namespace, and we'll jsut see where this goes.

also, looking closer at the chart, it appears kubernetesingress has been enabled by default! I've [submitted a PR to remove the suggestion]

## it is done

Now to see if I can an app going through it...
