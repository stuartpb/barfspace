# Pre-configuring installation media / images

## Etcher-like app

You'd have some kind of kiosk that can build and flash an image with everything set up and preconfigured - forget Ignition sticks, that's for chumps.

This would also track the local config in a file / push it out to the live cluster

Like, yeah, ideally this can, essentially, do kubeadm init before flashing the image

## Pre-joining images?

To elaborate, what if you never had to SSH in to kubeadm token create or copy-paste a link or any of that - you just flash the image, put in the card, and the node immediately connects to the host, it's pre-authorized, just like if you'd plugged it in and run `kubeadm join` and unplugged it
