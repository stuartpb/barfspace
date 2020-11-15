# mDNS and Kubernetes

I'm starting by Googling "kuberntes avahi"

## from the top

- https://discuss.kubernetes.io/t/mdns-avahi-on-k8s/10377/4
  - this discussion goes nowhere
  - it does gesture at the idea of an operator, but only lazily
- https://stackoverflow.com/questions/53115257/mdns-broadcast-from-within-kubernetes
  - this asserts that running Avahi on the host is easy?
  - it does seem like this would be one thing we maybe could let run on the host's network with a node affinity

## more kubernetes projects

- the kops project has an experimental [kube-discovery](https://github.com/kubernetes/kops/tree/master/kube-discovery) thing
  - Builds a Go binary and a Docker image
    - Both with [Bazel](7eath-3wn6f-tc8sy-706bh-byf01), which is interesting
  - Says they're pulling it out of [Protokube](https://github.com/kubernetes/kops/tree/master/protokube)
    - So, at some level, this is considered ["should be part of kubelet"](https://github.com/kubernetes-retired/kube-deploy/issues/149) level functionality
      - mDNS discovery for the local cluster would be a cool idea for [home cluster](xft7t-am737-c681k-evqax-fk0b5)
- there's a [k8s-mdns on GitHub](https://github.com/flix-tech/k8s-mdns) that I'm not positive actually works / does anything of value (there's no README)
- there was [an unloved issue to add this to minikube](https://github.com/kubernetes/minikube/issues/3821)
