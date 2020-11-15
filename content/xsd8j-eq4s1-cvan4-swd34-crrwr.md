# Stubernetes storage idea

I'm gonna keep the plain flash drive that's in there for now for "play"-class storage, which serves state like my position, maybe minecraft worlds if I'm not tracking them in Git as Work, I don't know

but yeah, this is an awesome example of how Longhorn and storage classes can handle separating your data worlds in a cleaner and more natural fashion than trying to shuffle a bunch of thumb drives around. they're still there, just you don't have to think about them

this works even better for node affinity when you've got a separate device in the cluster for your torrenting / gameplay streaming / whatever

## side thought for Longhorn

is there a way to, like, permit another class of storage on a device? like, just momentarily, until a suitable device is connected to the network and the emergency pressure that forced it onto the non-suitable device is lifted

or is this pretty much a thing you're expected to hook into Longhorn to manage for yourself, your own Emergency Reprovisioner
