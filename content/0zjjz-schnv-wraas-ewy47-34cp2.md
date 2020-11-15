# address.exposed setup

https://crm.vpscheap.net/cart.php?a=confproduct&i=0

setting up with Arch Linux

## the plan

After laying out all the characteristics of my original [aborted plan](v0e1q-wbhjt-cfajg-tfw4y-edjgm) to connect the outside machine to the cluster, and what I would have preferred, after taking a shower and thinking about it a bit I went "oh, wait, duh", and decided to have the remote node be much simpler: an SSH tunnel.

UPDATE: [I am still churning on this idea](d2mme-sky57-p78tk-0rm3k-vtdg5)

anyway, I've got some cluster changes to make

## revisiting the cluster

My tweak to the DHCP reservation didn't seem to have registered 100%: just SSHing in and doing a `sudo reboot` didn't fix it either, but tricking a system update (by setting that one rancher.io label to "true") did the trick

Now I'm `kubectl proxy`ing in to the Kubernetes Dashboard

## reducing the ip block

going to the metallb namespace and editing the configmap

Actually, though... I'm noticing that the Ingress for Kubeapps seems to have given the app its own load balancing IP for internal use... and if every app I put ingress on would need an IP, then actually, I'm cool giving it that massive block for now.

Oh, wait, no, that's just the IP of the Traefik instance - yeah, I'm gonna go ahead and change the block. (in fact, I'm reducing the pool to `192.168.42.0-192.168.42.250`)

[deleting pods to reload](https://github.com/metallb/metallb/issues/348)

## changing that kubeapps Ingress

Changing the URL to a much more manageable `kubeapps.stubernetes.internal` at the new load balancer IP of `192.168.42.0` in stuzzy's `/etc/hosts` (this is now the only entry)

Had trouble connecting before I realized, oh, hurr durr, I need to change the subnet mask the router advertises to 255.255.0.0 to get machines to ARP for 192.168.42.x
