# Miscellaneous k8s links

[Demystifying container runtimes](https://lwn.net/Articles/741897/) is a great lodestone to consult for a quick review of everything between Docker and 2018

## projects I like

internal components:

- https://github.com/containers/conmon
  - conmon is part of CRI-O
  - you can run conmon without CRI-O (eg podman) but it's not recommended
- https://github.com/containers/crun
  - looks like it's runc without the go and LXC without the cruft(?)
  - right, now I remember, lxc was the original Docker backend, they decided it was inadequate
    - the LWN article says as much
    - [replies to jessfraz's comment](https://lwn.net/Articles/741983/) also discuss this
      - (it's how I found the article, searching for an lxc vs runc comparison)
  - how does it compare with https://github.com/lxc/crio-lxc though?
- https://github.com/lxc/lxd
  - like podman meets libvirt?
  - seems like probably the smoothest VM management?
  - will likely use this for the sandbox machines?

## stuff that makes the Plushu sandbox look dumb

- https://linuxcontainers.org/lxd/try-it/
  - https://github.com/lxc/lxd-demo-server
  - [reference frontend](https://github.com/lxc/linuxcontainers.org/blob/master/content/lxd/try-it.html)

## Cross-cluster tunneling

- https://www.projectcalico.org/advertising-kubernetes-service-ips-with-calico-and-bgp/
  - An over-my-head exploration of the internal/external service dichotomy I struggle with for my home setup
- [Telepresence.io](https://www.telepresence.io/) is some kind of cross-cluster tunneling thing as well

## see also

- [Old Idle Study Root](zrckg-chfzb-8ma8p-7c5hs-wqtek)
