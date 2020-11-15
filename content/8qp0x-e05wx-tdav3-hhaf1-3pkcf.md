# Installing better monitoring

2020-06-01: need to figure out why everything is just suddenly slowing to a crawl

might not have to pursue this if [the cron job staggering works](32jav-e13x7-w9avt-np3a6-gezmv)

nah, they still bite it

## Prometheus Operator?

This seems like a real popular Kubernetes thing:

- https://github.com/coreos/prometheus-operator/
  - [kube-prometheus](https://github.com/coreos/kube-prometheus) puts it in a Helm chart
  - https://github.com/helm/charts/tree/master/stable/prometheus-operator
    - used to be at https://github.com/coreos/prometheus-operator/tree/master/helm
  - not mentioned: https://github.com/bitnami/charts/tree/master/bitnami/prometheus-operator/

Hmm, reading https://coreos.com/blog/the-prometheus-operator.html... it sounds like this and etcd-operator are, like, pre-Helm, back when it looked like "roll your own packaging solution for your app's resources" was a good idea ([though that's not to say there's no place for operators](https://cloudblogs.microsoft.com/opensource/2020/04/02/when-to-use-helm-operators-kubernetes-ops/))

## screw it, I'll go with Prometheus Operator

It sounds like Prometheus Operator is a sensible way to have one "metrics gathering timeseries system" for your cluster (the "metrics-server" that's built into k3s is just the core performance monitor for live metrics for scaling, though come to think of it that's probably where Kubernetes Dashboard gets its data)

If this is overkill I can dial it back later

creating a `prometheus` namespace

installing `prometheus-operator` into it, literally not changing a single default value. I'll mess with that later

this takes SEVERAL minutes, during which time kubeapps just shows a pulsing circle. switching to the Dashboard at least shows *something* is happening

a lot of image pulls are timing out. man it really sucks how much stuff times out on this system! I really hope prometheus can explain what the fuck!

## kubeapps does eventually finish:

```
The Prometheus Operator has been installed. Check its status by running:
  kubectl --namespace prometheus get pods -l "release=prometheus-operator"

Visit https://github.com/coreos/prometheus-operator for instructions on how
to create & configure Alertmanager and Prometheus instances using the Operator.
```

sheesh... running `top` shows `k3s-server` is taking a LOT of the CPU

Oof... it's making it hard to connect to stuff. I go ahead and switch my desktop back to using Automatic DHCP; hopefully, that'll reduce load on the server (as well as make it so I don't have name resolution issues). I'll just have to enter the IPs directly (it's not like they're switched by hostnames yet).

## okay, you know what, screw this

if nothing else it'll stop it from trying to resolve on itself:

`ssh rancher@192.168.0.23 sudo reboot`

## after reboot

https://192.168.32.1/#/overview?namespace=prometheus is showing all green

I'm gonna go ahead and turn my Nameserver back to the Internal one after setting `hhk8s.stuartpb.com/internal-name: coredns` and `external-dns.alpha.kubernetes.io/hostname` on the following services I converted to LoadBalancer:

- grafana.prometheus.internal for Grafana
- operator.prometheus.internal for prometheus-operator-operator
  - this was rolled back to a ClusterIP after realizing it has no UI
- bob.prometheus.internal for prometheus-operator-prometheus
  - changed to just prometheus.internal after getting clear what this does

## logging in to Grafana

http://grafana.prometheus.internal as "admin" with password "prom-operator"

Oh wow, this is *nice* nice
