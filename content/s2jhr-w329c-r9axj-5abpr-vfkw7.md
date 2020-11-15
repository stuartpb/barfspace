# kubernetes for clusterhood

split off from [my notes on Kubernetes](yynnd-jg6vf-4p813-td1c7-e8y0s) toward [The Clusterhood](jsjbb-4jsxp-r5by5-cvczv-7nw8h)

each server should have a different runtime/top-level distro, which probably maximizes feature support?

a frakti server seems like the way to allow for traditional VMs running arbitrary machine images, idk

- alternately, you can just provision VMs under KubeVirt https://kubevirt.io/user-guide/docs/latest/administration/intro.html#cluster-side-add-on-deployment
  - it's not clear how smoothly these VMs can then integrate as cluster nodes? or if that's particularly useful in any way?

ah, k, yeah okay so every user gets their own Namespace, and maybe we pre-populate that with a "starter" sub-namespace that has a registry pod for the user and other addon stuff like that (like a Heroku clone UI)

hmm, it seems namespaces can't nest? but one can make namespaces that are dotted, if I understand properly, meaning that you can still effectively subdivide a namespace?

this also touches on the [ops in a box vision](0dehw-8kxsa-81amj-gp4kk-td8cw)
