# Node Documents and Host Setup / Configuration

Like, you should be able to pre-configure all a node's metadata, set all its labels, etc- not just pick a hostname and (automatically/randomly by default) an IP

There's all this stuff that's been mentioned with the host environment, and then there's stuff that's a subset of the things that go on the Node document in Kubernetes. I think the abstract node should be the base document, and then all this stuff like the host stuff would be further levels of abstracted document

Though, really, I don't want to go too far down the rabbit hole with this: really, the Transactional System on the nodes themselves is capable of handling most of these kinds of changes? And the daemons can just be in rolling it all out over SSH? idk, food for thought

