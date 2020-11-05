# Thoughts on handling / sidestepping DNS/DHCP

So, one of the big defaults of this is to present the user with "Look, we're gonna be claiming ownership of the 192.168.69.0/24 for this system"

I guess the subnet mask thing might be an issue? Need to think about this

Anyway, the point of this is to sidestep the need for the existing setup (which might be a cheap home router) to host the DHCP or DNS in a way that works for us

But of course anything between "I have a shitty $12 clearance router" and "I have a $1000 OpenWRT behemoth" should be adaptable as well (ie. "I have to use my lab's DHCP, but they have no DNS")
