# 2020-09-22 Overall Recap and Summary / State of the Cluster

Oh geez, it's a few weeks later and I still haven't filled this in. Uhh... I'll just jot down a few lines here, hopefully this isn't too much like the hardware-oriented recap

## Summary: Where We Are

- 4 RPi 4s with 4 gigs of RAM
  - one running as master (mpi-rose)
  - three running with one 120GB SSD and one 2TB HDD each (wpi-garnet, wpi-amethyst, wpi-pearl)
- 2 Mini-PCs also with 4 cores and 4Gi RAM
  - these are mostly here so workloads that aren't multi-arch can still function by pinning them to amd64 nodes
- everything is attached by Ethernet to an 8-port switch, which is plugged into my TP-Link Archer C7 home router

## History

I originally tried to run this off a single Chromebook running k3os, with a single USB 3.0 hard drive (which I had had for years) and some flash drives reserved for storage pools (which I would try to instantiate under Longhorn). The original plan was to add more Chromebooks (like the identical model I bought for my wife) and other laptops to build out the cluster over time, so hardware acquisitions were geared toward that, like USB hubs and Ethernet adapters.

this worked well enough to learn the ropes, but the k3(o)s-isms (like not having systemd, or the capacity to install packages) were a little grating, and I felt like I wanted something based on a real Linux distro, even if it meant using more than the bare minimum of system resources - slim-down testing can come later. (I also had problems with the system tanking under load - I was somehow able to get Prometheus running on it long enough to tell me it couldn't handle the Kubeapps load I'd put on it.)

at first, I tried adding a Raspberry Pi 3 to be a worker/master node, but it became painfully apparent very quickly that this didn't make anything better.

Somewhere around here I decided to dedicate a real budget to this project, so I bought a few Raspberry Pi 4s and a network switch.

The cluster kept falling apart every time something got scheduled to the Chromebook, and I realized that two cores is really not an adequate amount of CPU for Kubernetes to be able to adapt loads, so I improved the health of the cluster by taking the Chromebook out of service. I'm still considering using it as the basis for a staging cluster on underpowered hardware - I really think it should be possible to supplant k3os, and I really want to explore what'd need to change for that to work
