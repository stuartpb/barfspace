# The New systemd-resolved plan

Based on the promising-but-not-promising-enough experience of [Switching Stunster to systemd-networkd](g3fcm-gdc4s-r4a1e-0c4f9-w26xp)

Want to tear down the cluster (especially Rook, ugh) and redo it with bare hostnames and a Search Domain.

The redoing is necessary for two reasons:

- the node names need to be changed within the cluster
- kubeadm needs to figure out the systemd-resolved adaptation when configuring the kubelet

gonna want to set this up by creating a script of some kind to switch the network manager - I'll tweak the hostnames manually - and set up the network config file

I realize now that this is the normal behavior, and it's just the sad sorry not-automated-enough state of affairs that most systems don't follow it automatically (including Wicked?)

also needs support from the network via [403 Network Setup for October](cwt92-9k4sd-es85j-9swb0-2f8jj)

see also [notes on systemd-resolved and Kubernetes](7z64p-wedvp-q2ahv-68jds-phgmw)
