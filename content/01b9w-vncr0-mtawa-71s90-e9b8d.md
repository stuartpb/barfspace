# systemd-networkd + systemd-resolved

I think these can cover for a lot of the shortcomings of other solutions in the space, and a lot of the problems that would hence go unsolved

- Switching to wireless, but only when Ethernet isn't available
- A search domain that can only be accessed on the host network

This is very much a "for people who can run on metal" - but if you can run outside that, you're using the base image (or preconfigured-for-VMs) anyway

I guess VMs would probably need some variant on this design with a different set of Network configurations

The stuff with Domains= and search domains is the stuff that dovetails nicely with the "Node Name Resolution DNS Server" thing below

[systemd-resolved and Kubernetes](7z64p-wedvp-q2ahv-68jds-phgmw)

### Wireless

Just a reminder you need to make wpa_supplicant configurable

### Side thought re: systemd-networkd's definition capabilities

You could use this to make a physically-isolated cluster network, where only the control nodes / API servers / load-balancers are bridged to the Internet

You'd need a few USB network adapters, of course
