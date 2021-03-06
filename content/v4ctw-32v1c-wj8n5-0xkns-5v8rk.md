# Meet the horn.horse support team

https://projectcontour.io/guides/cert-manager/ guiding me most here

## setting up cert-manager

I've installed the CRDs as a new directory in stubernetes-system (from the URL in the docs); ideally, they'd be part of the chart via Helm's CRD mechanism, but I guess jetstack isn't into that?

https://helm.sh/docs/chart_best_practices/custom_resource_definitions/

I guess they don't need to go in the chart's CRD dir because the chart doesn't use them? Still

I've gone ahead and set up cert-manager...

okay, went ahead and just rolled out the whole shebang.

deleted the household-system namespace before deleting the stubernetes-system charts trying to deploy to it... bad idea.

## external dns woes

ran into trouble via [not getting all zones](https://github.com/kubernetes-sigs/external-dns/issues/1127)

getting the zone ID was a bit tricky: I ended up making a new token for read access to my whole account, pasting the "check OK" curl command in, rewriting the URL so it was getting `https://api.cloudflare.com/client/v4/zones`, then pasting the blob of JSON into a text editor and searching for "horse". there's probably a beetter way

https://community.cloudflare.com/t/bug-zone-detail-by-name-requires-zone-list-permission/128042/19 describes how it could be winnowed, at least; one could probably submit a patch to use this

anyway, after spinning all the staging stuff up:

`kubectl -n cert-manager logs -l app=cert-manager -c cert-manager`

```
I0921 09:44:38.376361       1 setup.go:270] cert-manager/controller/clusterissuers "msg"="verified existing registration with ACME server" "related_resource_kind"="Secret" "related_resource_name"="hornhorse-staging-issuer-account-key" "related_resource_namespace"="cert-manager" "resource_kind"="ClusterIssuer" "resource_name"="hornhorse-staging-issuer" "resource_namespace"="" "resource_version"="v1"
I0921 09:44:38.417058       1 setup.go:170] cert-manager/controller/clusterissuers "msg"="skipping re-verifying ACME account as cached registration details look sufficient" "related_resource_kind"="Secret" "related_resource_name"="hornhorse-staging-issuer-account-key" "related_resource_namespace"="cert-manager" "resource_kind"="ClusterIssuer" "resource_name"="hornhorse-staging-issuer" "resource_namespace"="" "resource_version"="v1"
I0921 09:44:43.101551       1 setup.go:170] cert-manager/controller/clusterissuers "msg"="skipping re-verifying ACME account as cached registration details look sufficient" "related_resource_kind"="Secret" "related_resource_name"="hornhorse-staging-issuer-account-key" "related_resource_namespace"="cert-manager" "resource_kind"="ClusterIssuer" "resource_name"="hornhorse-staging-issuer" "resource_namespace"="" "resource_version"="v1"
E0921 09:45:14.274753       1 controller.go:158] cert-manager/controller/challenges "msg"="re-queuing item  due to error processing" "error"="Operation cannot be fulfilled on challenges.acme.cert-manager.io \"kubernetes-dashboard-hornhorse-cert-td5bc-3056130718-4153945855\": the object has been modified; please apply your changes to the latest version and try again" "key"="kubernetes-dashboard/kubernetes-dashboard-hornhorse-cert-td5bc-3056130718-4153945855"
E0921 09:45:14.625774       1 controller.go:196] cert-manager/controller/challenges "msg"="challenge in work queue no longer exists" "error"="challenge.acme.cert-manager.io \"kubernetes-dashboard-hornhorse-cert-td5bc-3056130718-4153945855\" not found"
E0921 09:45:15.180385       1 sync.go:155] cert-manager/controller/orders "msg"="failed to update Order status due to a 4xx error, marking Order as failed" "error"="404 urn:ietf:params:acme:error:malformed: No order found for account ID 15742275" "resource_kind"="Order" "resource_name"="kubernetes-dashboard-hornhorse-cert-td5bc-3056130718" "resource_namespace"="kubernetes-dashboard" "resource_version"="v1"
I0921 09:45:15.306434       1 conditions.go:162] Found status change for Certificate "kubernetes-dashboard-hornhorse-cert" condition "Issuing": "True" -> "False"; setting lastTransitionTime to 2020-09-21 09:45:15.306401888 +0000 UTC m=+24016.920706959
I0921 09:45:15.336613       1 trigger_controller.go:162] cert-manager/controller/CertificateTrigger "msg"="Not re-issuing certificate as an attempt has been made in the last hour" "key"="kubernetes-dashboard/kubernetes-dashboard-hornhorse-cert" "retry_after"="2020-09-21T10:45:15Z"
I0921 09:45:15.392196       1 trigger_controller.go:162] cert-manager/controller/CertificateTrigger "msg"="Not re-issuing certificate as an attempt has been made in the last hour" "key"="kubernetes-dashboard/kubernetes-dashboard-hornhorse-cert" "retry_after"="2020-09-21T10:45:15Z"
E0921 09:45:19.275281       1 controller.go:196] cert-manager/controller/challenges "msg"="challenge in work queue no longer exists" "error"="challenge.acme.cert-manager.io \"kubernetes-dashboard-hornhorse-cert-td5bc-3056130718-4153945855\" not found"
```

uhh... I might have disturbed it by jiggling something, let's try killing the pod and restarting

`kubectl -n cert-manager delete pod -l app=cert-manager`

huh, the log output doesn't look any better...

`kubectl describe certificate kubernetes-dashboard-hornhorse-cert -n kubernetes-dashboard` still shows it errored...

what the heck, `kubectl delete certificate kubernetes-dashboard-hornhorse-cert -n kubernetes-dashboard`

okay, looks like that regenned it...

hmm... still saying "client sent an HTTP request to an HTTPS server"

https://github.com/kubernetes/dashboard/blob/master/aio/deploy/helm-chart/kubernetes-dashboard/templates/ingress.yaml

reminder that this Ingress API needs to be brought up to the release version

...okay, revisiting [the Helm chart docs](https://hub.helm.sh/charts/k8s-dashboard/kubernetes-dashboard)... this can be fixed by setting `protocolHttp: true`, which will make the ingress backend connect to the dashboard via HTTP. I don't feel there's really that much significant value to encrypting behind Envoy? Maybe later?

pushing all the production issuer stuff

well, I'm deleting a bunch of secrets and stuff in the cert... made a big mistake by not changing the cert name for staging/prod

## bingo bongo, except

Well, this works when it's in hostnames, but I still can't get the name to resolve locally - the address comes back when I `dig +trace`, but not just `dig`

Gonna try updating unbound...

```
 * resolve_conffiles: Existing conffile /etc/config/unbound is different from the conffile in the new package. The new conffile will be placed at /etc/config/unbound-opkg.
```

Oh shit, now all my name resolution is broken, stuff like this in the unbound log:

```
Mon Sep 21 19:14:09 2020 daemon.info procd: Instance unbound::unbound s in a crash loop 6 crashes, 0 seconds since last crash
Mon Sep 21 19:21:50 2020 daemon.err uhttpd[1298]: [1600716110] unbound-control[27476:0] error: connect: Connection refused for 127.0.0.1 port 8953
Mon Sep 21 19:33:12 2020 daemon.notice unbound: [29110:0] notice: init module 0: iterator
Mon Sep 21 19:33:12 2020 daemon.info unbound: [29110:0] info: start of service (unbound 1.11.0).
Mon Sep 21 19:33:33 2020 daemon.err uhttpd[1298]: [1600716813] unbound-control[29188:0] warning: control-enable is 'no' in the config file.
Mon Sep 21 19:33:33 2020 kern.info kernel: [2914863.089397] do_page_fault(): sending SIGSEGV to unbound-control for invalid read access from 00000000
Mon Sep 21 19:33:33 2020 kern.info kernel: [2914863.104767] ra  = 77e123f9 in libunbound.so.8.1.9[77dd6000+c7000]
```

Okay, looks like stopping/disabling Unbound for a sec has DNS resolution working again. Installing libunbound-heavy and unbound-control (wow, I really can't believe these aren't managed as some kind of peer dependencies...)

oh herp derp. [why I couldn't resolve my local addresses](vmbma-00jj4-0k8t8-3da5h-1b0rw)

I deploy a new release of the kube-prometheus-stack, and [the cert-manager issue briefly presents itself again](1t74j-d1f9h-bab11-hvz1a-1h3e5)
