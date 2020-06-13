# A remote setup mechanism?

You can set up a new machine in your house with a given SSH key, then create a tunnel to one of our machines to connect to that machine with the given SSH key to set it up

It's "safe" as your trust in us to not misuse your machine, since you're only providing us with a tunnel to that machine's SSH, and all we have is an SSH key that can access it for setup (after which we can remove our own credential).
