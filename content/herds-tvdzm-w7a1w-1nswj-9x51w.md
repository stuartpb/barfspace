# a vision for address.exposed

users could just register subdomains of address.exposed, and it automatically sets that to A/AAAA to a server that is designed to handle traffic for that name.

by whatever means, we make one server able to handle many incoming connections, but the idea here is that both the incoming traffic from outside and whatever it is that's providing the endpoint for that traffic would both find their endpoint by looking up a (scalable) subdomain of address.exposed

maybe you can let them be two different names? like maybe I target "stuartpb.address.exposed" from in my cluster, but externally I'm pointing stuff to, like, "wayside.address.exposed" and "pluskube.address.exposed"

I kind of want to keep address.exposed just for myself as a totally badass find? But I think it would be cool to offer this as a service under some almost-as-neat name, prorated

would be a great service for kateskit

also, like, hell, you don't need to even make this per-user, just go with Cloudflare's "here are your two allocated nodes, their names are Coco and Jeff" model
