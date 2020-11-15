# Sturling Arges

What if I could boot things so that any computer is booted into a temporary Kubernetes node, and then bootstrapped from my laptop or something with the service configuration I want (kind of overlapping with the "Kubic Kiosk" idea, but let's say this is a whole desktop environment)? And my laptop provides a node that maps the local disk via iscsi/nfs for use by the services on that desktop, and then I can turn off my laptop to disconnect my home directory from the system, like removing a flash drive from a computer

Oof, though, that'd entail downloading all container image slices to RAM... you'd need to be able to keep the images uniformly light to pull this off

Anyway this would come from that whole blog post part 2 about bootstrapping a Talos installation
