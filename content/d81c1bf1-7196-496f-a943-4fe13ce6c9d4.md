# aborted plan for address.expose

I don't like the idea of my outside server having to connect to my local machine to get the cluster state, so I was considering trying k3s's experimental high-availability mode

Then I realized, wait, if I do that, I'm giving write access to the control plane - a plane that can control *a machine on my home network* - to an internet-exposed server. That could be potentially catastrophic.

What'd be great would be if I could make it so the server initiates a connection to the *agents*, but I don't think that's in the cards

wait... what if I had `k3s agent` as a port-activated service or something like that? some kind of daemon that initiates the tunnel to the "server", then the agent establishes the connection

maybe Project Calico can do this?

Anyway, I'm going to expose the Kubernetes port to the Internet and set up ipsec as the Flannel backend

## command line

`k3s agent --flannel-backend=ipsec --with-node-id`

the `with-node-id` ensures this can potentially scale to multiple ingress servers for the same "host"
