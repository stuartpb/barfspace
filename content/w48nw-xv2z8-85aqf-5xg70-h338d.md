# Diagnosing cluster perf issues

And other Prometheus endeavors

## suggested dashboards

http://grafana.prometheus.internal/d/200ac8fdbfbb74b39aff88118e4d1c2c/kubernetes-compute-resources-node-pods?orgId=1&refresh=10s

## stuff I need or want to set up

- Should have monitoring for household-dns (not just kube-dns), to figure out [if it's safe to potentially roll out again](pwsfq-4r7tk-41a1r-9gds5-ck2hn)

## things I'm noticing, looking just after midnight 2020-06-02 Pacific

Oh damn, Prometheus is a RAM pig - the Notes workspace takes up a bit, the Kubeapps Postgres is notable, but Prometheus taks a solid half gig

kubeapps only has one huge bubble in this list, which I guess is interesting

Prometheus and Longhorn's provisioner both seem to be using more CPU than they have to, but it doesn't look like too much?

http://grafana.prometheus.internal/d/fac67cfbe174d3ef53eb473d73d9212f/use-method-node?orgId=1&refresh=10s makes it look like at least one core is pegged?

## hardware solution

I'm thinking I'll provision a Raspberry Pi 4 with 4G RAM for Prometheus and other bulk-data stuff (ie. torrents). Not sure if I'd add a strict affinity for it?

## implementation bugs?

http://grafana.prometheus.internal/d/fa49a4706d07a042595b664c87fb33ea/nodes?orgId=1 looks like node-exporter is sending the same stats twice for CPU usage here?

## anyway, Prometheus RAM

https://www.google.com/search?q=reduce+prometheus+memory+usage

TODO: Take a look at the Helm chart options (I could provision some Bulk, if persistent storage would help offload)

- https://prometheus.io/docs/prometheus/latest/storage/
  - https://prometheus.io/docs/prometheus/1.8/storage/#memory-usage
  - via https://github.com/prometheus/prometheus/issues/1881
- https://stackoverflow.com/questions/56115912/why-does-prometheus-consume-so-much-memory
- https://www.robustperception.io/optimising-prometheus-2-6-0-memory-usage-with-pprof
