# My take on containerd (as used by k3os) vs CRI-O

honestly, the more I look at [diving into the containerd stuff on studtop for my personal k8s cluster](wp9bz-01xt9-m996k-s3ejj-8ec4d) the more CRI-O looks like the only sane base for a Kubernetes installation - containerd just gets weirder and weirder and more and more insular and bespoke, and seems to have a lot of the same Docker guys behind it making all the same internal-fiefdom structures that made Docker such an impenetrable nightmare

https://medium.com/cri-o/container-runtimes-clarity-342b62172dc3 kind of gets it just right:

> Containerd on the other hand has multiple masters. It services the needs of the Docker daemon for running traditional Docker containers. It services docker swarm for running Docker container orchestration. It services Mesosphere orchestration for running containers, and finally it also can be used for running kubernetes container workloads. Containerd however does not implement the CRI.

yeah so like, containerd is just a weird new backend for "reformed Docker", like whatever that Moby crap was

and like, yeah okay CRI-O is for Kubernetes only - but if you want to build an alternative? You shouldn't be using a primitive that was based around serving Docker's purposes, that was designed to build "a modular interface for reimplementing all the functions of the Docker daemon" like this appears to. It's a lot smarter to use, like, systemd units or some other simpler primitive, and then call out to the buildah/skopeo/podman stuff (which was *also* built for a Kubernetes-first world, and also supports the OCI specs natively)

this leads me into [All I Want From a Kubernetes Distro](dxr0n-wt6kr-we853-x0h4m-04yvt)

## Another way to think of it

The OCI is meant to be a minimum shared territory between Docker / Swarm and Kubernetes.

everything matching the OCI runtime spec eventually goes through runc, I think, more or less

containerd makes a world where you can extend it along a model that makes sense for the extension points that'd be useful for the users of Docker and/or Docker Swarm.

CRI-O is extended along points that make sense for users that are Kubernetes-first, and allows full-on different container runtimes, which can even include full VMs through QEMU or even a microVM like Firecracker

Is CRI the spec that Podman and CRI-O both follow, and, like, all these other runtimes, they have a CRI bridge (and hence it's called CRI-O because you swap between them?)

## another iteration of why I have this opinion

http://crunchtools.com/competition-heats-up-between-cri-o-and-containerd-actually-thats-not-a-thing/

## TL;DR

the OCI spec, partly by virtue of being newer, is better organized and interoperable by tools that just cooperate on a common format than containerd, which still follows Docker's model of one massive daemon with plugins handling all the functionality at once

OCI stuff composes better, imo

## LIGHTBULB GOES OFF HERE

(where "here" is right before the TL;DR, which was added in post)

Oh damn, is there an established way to switch k3os to CRI-O? And then I could use that to introduce the new 64Gig flash drive filesystem mount, some kind of transition mechanism?

Ehn... I think I'll hold off on that until I'm running a distro that's really built for CRI-O.

Like, I don't see anything suggesting it in the docs, and I'm not going to go trying to perform surgery to introduce it on studtop. (Maybe in a sandbox on Packet?)

As I said, it seems like a good thing to build a new system on, so I'll just direct an eye toward systems built for cri-o for future extensions to this

## here's where this starts to get drawn into the Container System Application Image Context Vortex

what if the MicroVM provides a frontend via internal HTTP or something like that where the VM
