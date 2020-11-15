# Overlay Mounting for Workspaces (and other VM-like experiences)

https://itnext.io/using-overlay-mounts-with-kubernetes-960375c05959 describes how you can do overlay mounts

so the idea is you'd provision a PVC for the "top-level overlay", and then have a privileged sidecar to init the overlay view

Not sure how the sidecar accesses the base image... oh, it doesn't, this just installs a Conda package

## other VM experiences

Maybe one of the container runtimes that incorporate [Firecracker](https://github.com/firecracker-microvm/firecracker)
