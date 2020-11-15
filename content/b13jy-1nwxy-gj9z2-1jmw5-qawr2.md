# Next Wave

continuing [this setup run](az0vm-dh75w-g8b2b-qt5rb-4e66q)

## okay, well, so now

I roll out prometheus-operator and metallb like [the last time I got to this point](0kz44-6z2tt-h08q4-qj7w2-7b3cr) and here are the logs I end up seeing from the operator:

```
ts=2020-07-03T10:14:36.286343524Z caller=release.go:75 component=release release=prometheus-operator targetNamespace=prometheus resource=stubernetes-system:helmrelease/prometheus-operator helmVersion=v3 info="starting sync run"
ts=2020-07-03T10:14:36.287436593Z caller=release.go:75 component=release release=metallb targetNamespace=metallb-system resource=stubernetes-system:helmrelease/metallb helmVersion=v3 info="starting sync run"
ts=2020-07-03T10:15:06.311606305Z caller=release.go:81 component=release release=prometheus-operator targetNamespace=prometheus resource=stubernetes-system:helmrelease/prometheus-operator helmVersion=v3 error="failed to prepare chart for release: chart unavailable: looks like \"https://kubernetes-charts.storage.googleapis.com\" is not a valid chart repository or cannot be reached: Get \"https://kubernetes-charts.storage.googleapis.com/index.yaml\": dial tcp: i/o timeout"
ts=2020-07-03T10:15:06.320495133Z caller=release.go:81 component=release release=metallb targetNamespace=metallb-system resource=stubernetes-system:helmrelease/metallb helmVersion=v3 error="failed to prepare chart for release: chart unavailable: looks like \"https://charts.bitnami.com/bitnami\" is not a valid chart repository or cannot be reached: Get \"https://charts.bitnami.com/bitnami/index.yaml\": dial tcp: i/o timeout"
```

since these ping just fine from the host, I'm not sure what the problem is here...

I decide, screw it, I'll go ahead and edit `studtop.nodes.403.stuartpb.com` to add `st8s.stuartpb.com/zone: "403"` and remove the master NoExecute taint

now I'll go ahead and deploy with

```yaml
  nodeSelector:
    kubernetes.io/arch: amd64
```

but still the raspbernetes image, and we'll see if anything changes

it could also be that the default `50m` core is too little to do tls on ARM, but, like, yikes

## anyway

switching the helm operator to `amd64` worked

but now, once I try rolling out the rest, I still get this error:

```
  Warning  FailedReleaseSync  11s (x2 over 2m43s)  helm-operator  synchronization of release 'household-dns' in namespace 'household-system' failed: failed to prepare chart for release: could not find valid chart source configuration for release
```

okay, this weird, because I'm pretty sure I had this working before

I try switching back to the fluxcd image

no, still not working. hm.

ok, looks like the problem was we had to specify `path: /`

ok, well, household-dns is now working enough to resolve DNS requests...

but will it resolve local apps?
