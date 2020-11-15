# Studtop Kubic Installation plan

Since the [Studtop Mk I-and-a-Half Plan](ksm42-1xpwv-rn9ag-a1vdt-cswcw) to remake the old K3OS cluster has momentarily hit a wall, I'm now looking into alternatives.

[K3OS Alternatives in an Emergency](fb5em-axq0j-gg9dk-yexae-y4a4h) covers the search for a replacement

## The plan

This is halfway between the "original MKII plan", which used the onboard disk for recovery and installation media (running ISOs directly from the on-board storage), and a [Possible Studtop v3 Model](sf9ft-yv1ry-8fbnv-aaw0n-8rhwx), which would keep a lightweight hypervisor on the machine itself, and run virtual machines with inserted storage as the backing volume for each installation.

I still think that's a cool idea for "component testing" (and definitely cause to consider [More Flexible Definitions for Longhorn-Friendly Volumes](gz4n8-e9vrw-478rc-8smp0-5hk08)) - like, if I want to try out a new container distro implementation, I don't have to dig up a new machine for it (and this is definitely something I'll be looking into for CNCF purposes), but:

- it's overkill for what I need right now
  - the old plan was right on, re priority one being "bring back the Notestack Workspace"
- I'd have to do more work to figure out exactly how I want to structure this
  - especially wrt how connected I want the Kubernetes Control Plane to be to it

Anyway, here's my plan:

- I'm gonna change the root filesystem label to "GLIM".
  - I'm gonna install [GLIM](https://github.com/thias/glim/) from the SystemRescueCD environment.
    - [GLIM and Friends](vvvb1-s6gz0-42bhh-7yd2v-6kz4t)
    - I'll probably port multibootusb's OpenSUSE rules
      - [install media](https://github.com/aguslr/multibootusb/blob/master/mbusb.d/opensuse.d/install-generic.cfg)
      - [live media](https://github.com/aguslr/multibootusb/blob/master/mbusb.d/opensuse.d/live-generic.cfg)
    - [(Not) Getting Fancy with OpenSUSE's menu entries](cf122-yjkb8-yx8me-e6k5y-8w08e)
  - I'm gonna download the Kubic install media
    - from https://en.opensuse.org/Kubic:Installation#Installation

From there:

- https://en.opensuse.org/Kubic:KubicD_and_kubicctl
  - > Please Note: the whole kubernetes and tooling stuff on openSUSE Kubic is under heavy active development.
  - so I'll probably give it a miss for now
- https://en.opensuse.org/Kubic:kubeadm
  - sounds like this is a decision I'll make during setup
- https://en.opensuse.org/Kubic:Update_and_Reboot
  - beautiful and fine
- https://en.opensuse.org/Kubic:Upgrading_kubeadm_clusters
  - hmm I guess
- https://en.opensuse.org/Kubic:Telemetry
  - ??? maybe at some point

## Rollout

[Installing Kubic on Studtop](apqev-my4ak-mzbtq-09rsa-dcac5)
