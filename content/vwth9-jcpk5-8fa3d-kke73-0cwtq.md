# Abortive Attempt at Using systemd-resolved
```
transactional update # zypper install systemd-network
transactional update # systemctl disable wicked.service
transactional update # systemctl enable systemd-networkd
transactional update # rm /etc/nsswitch.conf
transactional update # systemctl enable systemd-resolved
transactional update # zypper rm nss-myhostname
```

Looking, I'm pretty sure this is safe:

```
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
```

Looking at https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/

> Some Linux distributions (e.g. Ubuntu) use a local DNS resolver by default (systemd-resolved). Systemd-resolved moves and replaces `/etc/resolv.conf` with a stub file that can cause a fatal forwarding loop when resolving names in upstream servers. This can be fixed manually by using kubelet's `--resolv-conf` flag to point to the correct `resolv.conf` (With `systemd-resolved`, this is `/run/systemd/resolve/resolv.conf`). kubeadm (>= 1.11) automatically detects `systemd-resolved`, and adjusts the kubelet flags accordingly.
>
> Kubernetes installs do not configure the nodes' `resolv.conf` files to use the cluster DNS by default, because that process is inherently distribution-specific.
This should probably be implemented eventually.

oh wait, even if I could get this to work, this bypasses the stub DNS server. Shit!

```
exit
transactional-update rollback
```
