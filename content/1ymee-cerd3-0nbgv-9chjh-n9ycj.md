# Gibernetes

The core idea: a combination of `kubectl` and `helm` designed for manipulating a Git repostory of charts and manifests (ie. to be deployed via Flux/Argo)

so you'd have `gibe{,ctl} install` to add a Helm chart to `charts`, with a `values` entry for any `--set`

and also `gibe{,ctl} create` and/or `apply` to add a manifest to `templates`

could have [Cluster Explorer](k2ecq-hqxgs-ccax1-s1p85-59s4s) as some kind of API, though you'd kind of need [Better Helm](14qpm-yzb8m-9nbrw-j3bcw-7wwg3)
