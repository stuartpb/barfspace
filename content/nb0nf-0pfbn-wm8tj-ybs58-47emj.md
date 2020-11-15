# A Million Ways to Set Up Kubernetes

A Kubernetes node is a system that can run containers in a runtime like Docker, and manage the network for all those containers.

## minikube

https://kubernetes.io/docs/setup/learning-environment/minikube/

Minikube uses Docker Machine to provision a new VM via:

- VirtualBox
  - This is the default, pretty much just because it works on all 3 platforms
- KVM
  - This is the most efficient VM solution for Linux

It can also use the host OS, but you don't generally want to do that unless your machine is dedicated to Kubernetes, [for all the reasons laid out in the docs](https://github.com/kubernetes/minikube/blob/master/docs/vmdriver-none.md#can-the-none-driver-be-used-outside-of-a-vm):

- [Needs to be run as root](https://github.com/kubernetes/minikube/issues/3760)
  - but not always
- Puts binaries directly into `/usr`, the land where only your package manager should work
  - As far as I can tell this is the only reason for the need to run as root
  - I guess moving things into a subdirectory is too much to ask?
- Everything binds to all the system's network interfaces
- No resource encapsulation
- Injects its DNS server into your system resolver configuration
- minikube assumes it's the only thing managing containers
- A bunch of minikube stuff doesn't work
  - Some of this makes sense (there's no need to tunnel or mount, for instance)
  - Some of it's just because of broken assumptions (I can't see why dashboard shouldn't work)

## kubeadm

https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm/

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/#synopsis <- great synopsis of what's involved in setting up a node

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

## The Hard Way

You can do each step of the stuff that kubeadm does manually:

https://github.com/kelseyhightower/kubernetes-the-hard-way

## Many, many more

See https://github.com/kubernetes/community/tree/master/sig-cluster-lifecycle
