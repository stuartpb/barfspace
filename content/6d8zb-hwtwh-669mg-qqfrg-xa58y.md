# DNS Thoughts

https://cloud.google.com/kubernetes-engine/docs/tutorials/configuring-domain-name-static-ip has the weird ways you provision IPs in Google Cloud

I'm thinking, for home hosting, what ou really need is a thing that can figure out your external IP, and a thing that pushes this to a dynamic DNS service

like, I believe DNS-O-Matic lets you do custom domains

Anyway, it might also make sense to make a DNS server that can provision DDNS records, if there isn't already one, for letting hosts...

okay yeah, I guess that's maybe what I'm trying to figure out, how can I plug "set these ingress names to these world-routable node IPs" into a cluster? especially if I'd like that DNS service to be external

I think another angle was "I want this to be a matter of fixed CNAMEs for if I'm, like, setting up a record in an outside service that I can't push a DDNS record to"

but I'd like them to also be functional as the canonical records, like the ingress nodes are pushing their IPs right to the DDNS service
