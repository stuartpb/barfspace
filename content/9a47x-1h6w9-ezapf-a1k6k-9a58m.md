# SUMAF Init

Running `hostnamectl set-hostname $(cat /etc/hostname)` where applicable to set all nodes to their FQDNs

running `kubeadm init` on sturl and `kubeadm config images pull` on the rest

I briefly pause to note that I maybe should have let sturl's DHCP lease cycle, considering that the hardware has changed and the IP is liable to move when the lease gets recycled, but whatever I'll figure that out later

I do have to copy from `cat /etc/kubernetes/admin.conf`, the cert has changed

doing `kubectl create ns stubernetes-system && helm install -n stubernetes-system stubernetes-core stubernetes-core/`

running the join command on the other nodes

running `kubectl apply -f kube-prometheus-stack.yaml` et al all goes swimmingly

## storage stuff

huh, running `fdisk -l`, it seems one of the flash drives (I think the new one) has slightly more space than the other two? 61983424512 bytes versus 61933092864? huh weird whatever

## oh shit right labels

I spend something like an hour on [the great stupid label misadventure](4j6tm-hqye8-kbayf-8gjsn-9phmf) before I properly label the nodes to work

oh great wow what do you know, I've got Envoy pods failing to boot because it's not ARM-compatible. Oh well, time to roll out an even more elaborate selector

after giving it a little more time:

```
[stuart@stushiba ~]$ kubectl get ds -A
NAMESPACE          NAME                                             DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                                           AGE
household-system   household-contour-envoy                          2         2         2       2            2           kubernetes.io/arch=amd64,st8s.testtrack4.com/zone=403   4h23m
kube-system        kube-proxy                                       5         5         5       5            5           kubernetes.io/os=linux                                  4h42m
kube-system        weave-net                                        5         5         5       5            5           <none>                                                  4h34m
metallb-system     metallb-speaker                                  5         5         5       5            5           kubernetes.io/os=linux                                  4h24m
prometheus         kube-prometheus-stack-prometheus-node-exporter   5         5         5       5            5           <none>                                                  4h24m
rook-ceph          rook-discover                                    4         4         4       4            4           <none>                                                  4h23m
```

okay... I'm still not getting the DNS resolution...

okay, so now that envoy's actually running, I can reach grafana by putting the hostname into `/etc/hosts`.

screw it this is good enough for now; I'll change the ingress names to be just `grafana.internal` etc, and then if the DNS still won't work I'll just drop a wildcard resolution for `*.internal` to... I'll also go ahead and move that to 192.168.42.80

I also go ahead and reduce the annotation filter to just reuse the ingress class annotation, rather than have the redundant 403-zone annotation on ingresses

## oh wait

actually, it's kind of a pain in the ass to make a wildcard resolution... feels like it might just be easier to fix this

```
[stuart@stushiba ~]$ kubectl get ingress -A
NAMESPACE    NAME                            CLASS    HOSTS                   ADDRESS   PORTS   AGE
prometheus   kps-alertmanager                <none>   alertmanager.internal             80      4h19m
prometheus   kps-prometheus                  <none>   prometheus.internal               80      5h1m
prometheus   kube-prometheus-stack-grafana   <none>   grafana.internal                  80      5h1m
```

See, that "address" column should have something

hey there https://github.com/projectcontour/contour/issues/403

okay so https://projectcontour.io/docs/v1.8.1/configuration/#configuration-file

> ingress-status-address: If present, this specifies the address that will be copied into the Ingress status for each Ingress that Contour manages. It is exclusive with envoy-service-name and envoy-service-namespace.

so I gotta overhaul the contour config... I can live with that

[For 2020-09-20 Morning](p1pme-rpwfn-47842-hrdv6-prrm1)
