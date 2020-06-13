# A Realization I've Had re: Host Names for Nodes

That one configmap I had to remake on k3(o)s to intercept the coreos config? was for adding nodes to the hosts file for pods. so that's how it got around the problem I was having setting up Kubic that I want to see if that's what the shim layer around kubicctl does, and if so I think I get it and I might start over using that instead

I'll need to tree that last run-on, but the gist is, k3s had a thing in its guts that patched the IPs for each node it was on into the ConfigMap for the cluster DNS server.

and, like, see, I think that's, like, okay so they're saying you need some fancy thing beyond the core kubeadm stuff to facilitate that, and in lieu of using the hosting-provider's infrastructure we're going to roll our own, and that's niche

but it's also bespoke, and it was one of the components k3s integrated. and I guess it's what kubicctl uses Salt to provide(?)

anyway I'm sticking with kubeadm for now, but now I have a clearer picture of one of my questions around kubicadm, which was "what would I need to handle if I wanted to build a network where one of the components can't use kubicctl and has to join with raw kubeadm? or what if I have to wire it up myself?"

## side thought about "core services"

Also, since that service is, like, part of what'd get administered under kubeadm, maybe I was a little hard on how k3s models its core services? Like, maybe in hindsight, their model is actually easier to work with than kubeadm?

nah, I don't think so. k3s is still pretty much "run kubeadm update every time you start kubelet because it's not like that's a problem right guys", and also, you know, it hijacks for Rancher images (the way Bitnami's charts hijack for bitnami)
