# Stubernetes plans for 2020-09-22

- Re-tear-down-and-rebuild rook-ceph
  - full disk wipes
  - should be able to delete the LVM mounts rather than restarting, though
  - also get rid of some potential lingering ceph artifacts?
    - pretty sure /dev is ephemeral on Kubic so this is probably OK
- Gotta resolve this hostname thing on Kubic
  - Might setup TheLounge as an IRC client
  - Maybe also message the mailing list?
  - How do other Kubic users deal with this? Is this normally VM-managed?
- Set up notes workspace behind OAuth2Proxy
  - can just use my GitHub user for now
  - A nice little Dex for my own authority / auth factors might be fun some time later
- Set up Heimdall as the horn.horse root
- Bring back .internal?
  - I'll consider this after looking into nsd (see sidebar on Docker images below)
- helm chart for [perkeep](mr4wk-y9m0m-48bw1-w7bz4-kxsmj)
  - storage class: we'll call it "work" for now
- start looking at updating charts to [Ingress v1](https://kubernetes.io/docs/setup/release/notes/#api-change)
- update cluster uniformly to v1.19
  - I looked, the ingress thing is the closest anything I'm currently using comes to a breaking change
  - not running a bunch of mini-Debians would be REAL nice, though
    - the [ephermal volumes][] thing looks neat too
  - the [death of hyperkube](https://github.com/kubernetes/kubernetes/pull/88676) is interesting
    - especially since being an all-in-one binary is one of k3s's big selling points
- update stushiba
- all that other media stuff

[ephemeral volumes]: https://github.com/kubernetes/enhancements/tree/master/keps/sig-storage/1698-generic-ephemeral-volumes

## sidebar: making Docker images

Is it buildah? I can write something like a Dockerfile and buildah can build and upload it? Multi-arch?

Like, I can then just do that, rather than figure out a whole proper CI chain, to get stuff like the nsd image

In fact, if I start going for code-servers, I can have one workspace on ARM64 machines and one on X8664 machines

## observation

I figured out "thelounge" by searching for "irc client helm chart". Searching for helm charts is a great way to say "show me something that has likely already been containerized cleanly, and someone has already done the work to make it run on Kubernetes, because it's a nice UX"
