# Ohh, I get kustomization now

Okay, so kustomization is really a resource orchestration format, for anything beyond direct file manipulation. it doesn't require a separate set of resources to maintain in the cluster, because all it is is a declarative structure invoked at will, like plain resource YAML files

but yeah, this is the answer to "how do I include a directory of files?" and you have to include all of them

## on numbers

oof, I did all my ordering based on the idea that there would be recursive globbing that does sorting...

ah well, what the heck, we can go ahead and just write redundant kustomization YAMLs that will ignore the numbering, and that'll just serve as a "double-check", and we could hypothetically auto-generateo the kustomizations later.

anyway, nice to know we can do that hierarchical numbering idea...

in fact, now that I think about it, that should be how most of the kustomization works, by default - we auto-generate the kustomization file along with "auto-generating" the YAML.

in fact, this would be how I'd teach deploying a Kubernetes cluster these days. Kubedee and kustomize - so, like, when we add Weave as our CNI, we'd do it by adding a reference to the kustomize.yaml

## oh! in fact!

https://toolkit.fluxcd.io/components/kustomize/kustomization/#generate-kustomizationyaml

> If your repository contains plain Kubernetes manifests, the kustomization.yaml file is automatically generated for all the Kubernetes manifests in the spec.path and sub-directories.

so there you go: kustomization.yaml is just for if you want to have an overlay modifying your files - ie. I could precisely use it to just download all the CRDs, and I might do so.

and, based on the way the default repo is set up by gotk, it looks like it only sets up kustomizations to point to directories, so that's how you do sub-kustomizations
