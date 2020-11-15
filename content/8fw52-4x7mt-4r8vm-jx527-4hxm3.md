# Probably a good network idea for Stubernetes nodes

I should make the Stubernetes switch its own isolated network, where I can reach nodes on port 22 for SSH via the Wifi, but inter-cluster communication only binds on the Ethernet. That way it wouldn't be a thing where I need to trust my Wi-Fi to keep internal traffic secure.

Would this be feasible to do using [a Raspberry Pi acting as a router](r9d1p-tm7bg-0y9dg-4r8s2-h25rb)?

see also [Rethinking the CNI](tc9kh-s97am-c48vh-2ybba-p20m3)

## Fine-tuning the CNI?

https://docs.projectcalico.org/getting-started/kubernetes/installation/config-options lists that IP-in-IP can be disabled if all nodes are on the same Layer 2 network: food for thought
