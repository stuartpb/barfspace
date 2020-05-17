# Understanding inlets and other such designs

[the Show HN post for Inlets 2.0](https://news.ycombinator.com/item?id=20410552) pointed me in the direction of [sish](https://github.com/antoniomika/sish), a purpose-built SSH server to do exactly what I had in mind for my "wait, why don't I just do it with SSH tunneling" phase

I'm still not clear that this isn't subject to TCP-within-TCP performance issues?

https://github.com/fatedier/frp sounds way more right

## dumb inlets stuff that makes it popular

Inlets has this weird Operator that is designed to take a hosting provider resource you've allocated, and handle all the setting up to expose traffic, if you add "InletsLoadBalancer" records...

Like, do people really find that useful? It just seems like a bizarre conflation of concerns that looks impressive in a tech demo

From [Inlets' first Show HN](https://news.ycombinator.com/item?id=19189455), https://github.com/jpillora/chisel handles the "I can't get through over SSH" side of things

## frp dockerfile

[the author's image](https://hub.docker.com/r/fatedier/frp/dockerfile) builds from source and hasn't been updated in years
