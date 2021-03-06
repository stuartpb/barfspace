# household-dns 2: Finishing This Fight

hopping back to stushiba

`cd workspaces; git clone git@github.com:helm/charts.git helm-charts`

Okay, so, I want to split the Service file into two documents. I was thinking I'd like to do this with a `---`, but noticing how Helm charts are usually one-file-per-template, I realize I'm not certain Helm actually supports that.

As such, I pull up the [Helm Chart Template Guide](https://helm.sh/docs/chart_template_guide/) and start reading. (this was all last night, before going to sleep)

After a few pages, this is all an interesting introduction to Go's standard template system and everything, but I feel like skipping ahead to answer my question

the [Yaml Techniques Appendix confirms](https://helm.sh/docs/chart_template_guide/yaml_techniques/#embedding-multiple-documents-in-one-file) this is valid, so I go ahead and dive in to `service.yaml` all eager to get down to business--

## oh god

[the way the chart defines ports for services is hopelessly complicated](https://github.com/helm/charts/commit/045066374096e377731d54a78842a8880652d1de#diff-2d0dda4338d9a0a46d6107b42b488c84), especially since the patch that broke this

[fuck it, y'all can clean this up yourselves](https://github.com/helm/charts/issues/22578)

okay, so

## from the top

making all the changes I made to the KubeApps values [yesterday](b66ya-c3y6d-8b87k-q1bvf-kmn05) (like *six times*, after all the errors and port-forwarding tunnel failures) to the `values.yaml` here:

- changing the `serviceType` to `LoadBalancer`
- `loadBalancerIP: "192.168.42.53"`
- set rbac.create=false
- `isClusterService: false`
- replacing the `kubernetes` block with the `etcd` one
- changing the forwarding parameters to `. tls://1.1.1.1 tls://9.9.9.10 tls://8.8.8.8` instead of infinite-looping

now `helm install --dry-run -n household-system household-dns helm-charts/stable/coredns` (wow this takes a lot longer than you would reasonably expect, there's a noticable pause)

copy-pasting the YAML bits from terminal into gedit, adding the `metallb.universe.tf/allow-shared-ip: "true"` annotation to the Service, making a duplicate of this section, changing the names to add "-udp" and "-tcp", deleting the opposite port from each, and saving as "resources/household-dns.yaml" in my `stubernetes-setup` folder

```
$ cd stubernetes-setup/resources/ ; kubectl apply -f household-dns.yaml
configmap/household-dns-coredns created
service/household-dns-coredns-udp created
service/household-dns-coredns-tcp created
deployment.apps/household-dns-coredns created
```

whale whale whale

[let's take this baby for a spin](46ds7-xher7-429v2-z2j6a-1fjwk)
