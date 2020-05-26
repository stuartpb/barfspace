# file ownership in a PersistentVolumeClaim

this is a thing I've been sweating after seeing `fixuid` in a "Kubernetes-ready" image:

- https://github.com/boxboat/fixuid
- https://boxboat.com/2017/07/25/fixuid-change-docker-container-uid-gid/
- https://github.com/moby/moby/issues/7198

I'm pretty sure it was just an oversight? but I'm not 100% sure how ownership works in PVCs.

the only thing to come up Googling "fixuid kubernetes" (that wasn't just about Docker) is https://github.com/projectatomic/atomic-system-containers/pull/134 which looks unrelated

## another approach

https://github.com/bitnami/charts/blob/master/bitnami/etcd/values.yaml (And probably other Bitnami charts) looks like it has the most-right approach to implementing this: making it an optional part of the Helm chart, which will adjust the mountpoint according to the Pod securityContext in an init container (using a minimal image, though I think you could afford to go simpler than "minideb", if you're not following some Bitnami house style)

(I of course encountered this in the process of building my external-skydns chart)

So yes, to conclude, an image "for Kubernetes" shouldn't include fixuid: that should be left up to the Pod implementation.

Similarly, creating the user to run the container as should probably be a duty of the Pod as well? or at least of further container image levels (like you could start FROM the basic image which doesn't do this stuff)

My reason being, I have some workspaces that expect that user to be named `ubuntu`, and some that expect it to be, like, something else (and, y'know, I might want it to be called "stuart" in my personal pods)
