# exploring if there's a better way to do images

https://kubernetes.io/docs/concepts/containers/images/ indicates that kubernetes doesn't really disrupt the docker image-registry paradigm, which sucks, and makes one of the current open questions with Plusku ("how should I do build images") all that much harder

cri-o suggests the possibility of other image formats at some point in the future so that's probably a point to watch

Might be possible to just run a registry "in-cluster" a la https://medium.com/@jmarhee/deploying-a-docker-registry-with-persistent-storage-and-local-only-access-on-your-kubernetes-1c6470d3611c

could also do "pre-pulling" for running an image built on the host which just sounds dicey and difficult https://kubernetes.io/docs/concepts/containers/images/#pre-pulling-images

https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod is definitely the way to interface

## something I get now

https://github.com/containers/skopeo/ lists a bunch of container locations: Buildah can build directly into these

Is it possible to serve directly from the local node's container image store, so, like images can be built on the master node and fetched/mirrored from there?

or, even better: pods can push to the container registry after building an image internally, keeping any container artifacts that aren't meant to be cluster-wide images contained

like, if I were in a workspace and I wanted to take an image I'd made and make it available for general cluster use, I'd deploy to the internal API endpoint that serves the cluster's images

## building in a CI-like way

- https://opensource.com/article/19/3/tips-tricks-rootless-buildah
- https://developers.redhat.com/blog/2019/08/14/best-practices-for-running-buildah-in-a-container/

## related

- [Understanding the Post-Docker Ecosystem](n63bz-4evm6-r6acn-zq3q7-zehgy)
  - [Understanding the Runtime Side](zjbpr-vc1rp-cr9j6-vdqav-h61r3)
  - [Notes Specifically on Image Building](sg1zb-h05yh-46a95-ze3z8-z6g2h)
- [Revisiting a 12-factor-model system (ie. Plusku v2)](xz8qa-scha3-mfa8h-8nf0h-vvp4z)
