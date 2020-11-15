# Okay, ONE MORE teardown/rebuild

I realized in the process of [rewriting my cluster definition to embrace kustomize patching](x8056-v8wa8-gm8d0-kk7j5-jtjaw) that I accidentally didn't rename `throwaway-pool` to just `throwaway`

I also decided to rename `hornhorse-issuer` (or rather just `hornhorse`), and its staging variant, to `stuartpb-letsencrypt` (and `stuartpb-letsencrypt-staging`)

Anyway, I went ahead and applied a version of the kubectl manifests defining the system to point to the branch that uses patches.

And, wouldn't you know it, right when I did that, the rbd provisioner stopped working. Looks like upstream [might have broken something](https://github.com/kubernetes-csi/csi-release-tools/issues/105)

I've pushed a fixed version to the cluster definition, and I could do surgery on this grape to roll it out, but I am itching to see if my new teardown/rebuild procedure will be smoother...

yeah, I feel like it's too much of a chicken-and-the-egg problem to try to fix the rook-ceph container *and* surgically reset the throwaway pool. Just gonna reset and try again.

Across nodes

```
kubeadm reset -f
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/weave-teardown.sh)
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/rook-ceph-lvm2-teardown.sh)
```

## rebuild speedrun

I ran through a couple bum rounds before I remembered there was one hack I'd rolled out kind of haphazardly that I wanted to replicate with kubeadm init:

`kubeadm init --image-repository k8s.gcr.io`

I hit a brief snag because I forgot to roll out the hornhorse secret, but otherwise, everything went off without a hitch - no more needing to label the nodes manually
