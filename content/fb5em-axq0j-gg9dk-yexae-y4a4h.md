# K3OS Alternatives in an Emergency

Here are things I'm looking at to make a new K3OS image without having to use K3OS:

## Kubic

This is currently the one I'm looking at closest:

- [uses CRI-O by default](https://kubic.opensuse.org/blog/2018-09-17-crio-default/)
  - actually found it by just going to https://cri-o.io/
- Comes with a few different CNI options
  - Used to use flannel but mentions
- Provision it with kubeadm like a normal person!

The more I look at this ,the more I like it, the more it sounds like the kind of distro I've really been looking for

## MicroK8S

(Not to be confused with OpenSUSE's MicroOS)

Everything sounds nice until you realize that it's Canonical trying to sell you on Snaps.

## Things that run Cockpit

This is another characteristic I'm looking for in a "hypervisor" level: an OS that has clear support for Cockpit

https://cockpit-project.org/running.html

## Fedora CoreOS

This seems nice and all, but, like:

- a lot of the docs / tech are tied to the now-defunct CoreOS org:
  - https://coreos.com/ignition/docs/latest/examples.html
  - This makes it hard to tell what's relevant and what's obsolete
- It's not clear how to make this into a K3s-style Kubernetes node easily

## Flatcar Linux

Kind of the same deal as Fedora CoreOS: not clear how much of the legacy is worth maintaining in the face of a rapidly-changed world.

## Talos

https://www.talos.dev/

https://www.talos.dev/docs/v0.5/

- in terms of bare metal, it looks like this one is designed to run inside a virtual environment
  - if you don't have a robust enough bare-metal environment to set up an in-house PXE backbone
- so yeah, it seems like this might be "above your pay grade"
  - but also, it's a VERY smooth abstraction
    - looking specifically at https://github.com/talos-systems/arges
      - uses your kubernetes cluster definition to provision the VMs of the Node
      - DEFINITELY cool for aa Clusterhood / bootstrapping your own "container engine", I'd bet
  - if you can make that virtual PXE layer happen...
    - looking into https://www.talos.dev/docs/v0.5/en/guides/local/firecracker
      - ...nah this is too complicated
        - maybe if there was a layer like Arges managing this

[Understanding Talos Better](gaxy0-psq4m-85an8-fe154-qnqg0)

## Clear Linux

Kind of like MicroK8S: Sounds like it has some really neat bundles, but ooh wee, you're trying to hook me on a proprietary C compiler. No thanx

## Other notes / research that fell out of this

- [Off into the woods with Firecracker](7q276-xyr4e-my8jx-bzar7-k01cr)
