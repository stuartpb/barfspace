# next steps with stukrates

## external ingress

- [inlets etc](jj6kc-7ktk0-w09qb-9qqh7-zk0rc)

## multi-ingress

If possible, I'd like to make the ingresses for all but local traffic (which I'd probably make a different class) come out on a different port. Then, I'd set up our home router to redirect outside 80 and 443 traffic to those ports, and internal requests can hit names pointing to the local box.

This might be as simple as just changing the port on the traefik service once it's installed by Helm

Need to understand how this "load balancer" thing in k3s works, with its shell scrips

## multi-node?

once we have multi-ingress, I wouldn't mind setting up another machine to handle the public ingress

## internal DNS

something better than hacking the hostfile: expose a DNS server that can point to our Ingresses

## external DNS

hooking into CloudFlare etc

could be useful for Let's Encrypt for internal domains

possibly also pointing to our own nameserver for more complicated structure?

## authentication layer for Kubeapps / Dashboard

the Kubeapps and Dashboard login process is miserable, and the Kubernetes Dashboard only remembers sessions for like fifteen minutes

Can we maybe make something like "Log into the server via SSH and enter this code to authenticate you as authorized until further notice"?

reading:

- https://kubernetes.io/docs/reference/access-authn-authz/authentication/
- https://kubernetes.io/docs/reference/access-authn-authz/authorization/
