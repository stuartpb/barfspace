# An Image for Making Images

part of a series on [Pre-configuring installation media / images](tjap5-0a79a-csat1-rm0vz-dhscy)

## Maybe make this an OS image, and the "native app" is a VM

This actually seems like it's probably the safest approach: run the whole thing in a kiosk in a VM, and then you could ship a laptop with the "image pre-heater" OS as native

Also insulates from the host distro...

How much of this would still be doable as an AppImage? Electron?

You could then also use it as a dashboard for the nodes

this starts to resemble Arges and the [Sturling Arges](9tvhs-2fhtq-cr86r-ryq7j-wr351) idea

## x86?

I'm thinking this should be made for x64s that can boot from SD cards. Like, really, if you want to image a disk that's not SD with this, you can - but don't play like that's going to be some big hassle. I mean, come on, this setup kiosk I'm designing here is basically the installer CD

oh yeah, that was another thought, this is a lot like the YAST installer - just primarily geared toward image building

something like this could even theoretically also be used for building docker images? idk, parts?
