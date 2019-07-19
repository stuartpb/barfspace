# Networking in Kubernetes

Okay, this one is kind of a critical concept to defining a Kubernetes cluster, and why heterogenous clusters are so tricky:

https://kubernetes.io/docs/concepts/cluster-administration/networking/

> Kubernetes imposes the following fundamental requirements on any networking
> implementation (barring any intentional network segmentation policies):
>
>    * pods on a node can communicate with all pods on all nodes without NAT
>    * agents on a node (e.g. system daemons, kubelet) can communicate with all
>      pods on that node
>
> Note: For those platforms that support `Pods` running in the host network (e.g.
> Linux):
>
>    * pods in the host network of a node can communicate with all pods on all
>      nodes without NAT

Also, I just realized that this would mean heterogenous clusters ought to be way simpler under IPv6
