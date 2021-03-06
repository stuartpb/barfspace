# setting up kubectl for stubernetes on stushiba

## a brief sojourn with kubectx

I basically just installed it because it was in the Arch repo and came up in a search for "kube"

I get what the context thing would do, but it doesn't explain how to set them up.

https://github.com/ahmetb/kubectx/issues/42 isn't more illuminating

the dev recommends https://medium.com/@ahmetb/mastering-kubeconfig-4e447aa32c75, which is interesting but doesn't tell me much about *contexts*

diving into the script, I see a line that I Git blame back to [this PR](https://github.com/ahmetb/kubectx/pull/93), and the fact that this dude can't tell the difference between cache and config made me go right ahead and uninstall it from stushiba. it looks like kubectl handles context itself, I don't get why you'd have this whole other script to mess with it (and make tab completion worse)

## configuring the stubernetes context for kubectl

opened up an SSH terminal to rancher@192.168.0.35 and `cat /etc/rancher/k3s/k3s.yaml`

copying the `cluster` and `user` entries as `stubernetes-studtop` and `stubernetes-admin`, respectively

## minkube address rabbit hole

noticing that my minikube server address is listed as https://192.168.39.186:8443, which lands it within the planned Stubernetes range.

Am doing a little looking into this - don't want to conflict with any defaults

`virsh net-list` produced nothing... ah! but sudo worked

okay, there's a "minikube-net"...

that's got me doing a search for "192.168" on the Github repo for minikube...

ah, okay: https://github.com/kubernetes/minikube/blob/ce7babf78c09026ef7f5f41d01c97ed4864b2f55/site/content/en/docs/Reference/Networking/proxy.md

so it's just that they picked 39 a a block, as well as 99 and the block they use for internal networking

Thinking about this, I realize that taking the range 192.168.32.0-192.168.63.255... is probably overkill. I don't think I'm going to be doing anything that would necessitate 256 addresses, let alone 8192 of them. if minikube can get by with the 192.168.39 block, I can reduce the planned Stubernetes internal range from a 19/ to a 24/. heck, now that I say it out loud, I feel like someone who has purchased cartoonishly large pants, out of fear that they never want their pants to be too small

forking off to document [stustudio numbering plan](2ehz6-qdw71-178bs-sgst1-n5req)

## more stuff

I've changed studtop's IP reservation to 192.168.0.23

I'll change the MetalLB configuration later, once I've set up loadBalancerIP values within the new range
