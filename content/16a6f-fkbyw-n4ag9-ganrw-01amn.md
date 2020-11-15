# Post-Helm-Controller-revamp Stubernetes spinup checklist

```
kubeadm reset -f
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/weave-teardown.sh)
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/rook-ceph-lvm2-teardown.sh)
```

if you forgot to copy this, here's what's important:

- ensure all appropriate teardown has been done:
  - `bash hack/teardown/weave-teardown.sh`
    - or at least `rm -rf /etc/cni/net.d`
  - `bash hack/teardown/ceph-teardown.sh`
    - or at least `rm -rf /var/lib/rook`
    - all the other device teardown is only necessary if rook-ceph progressed that far
  - reboot, or at least reset iptables with `iptables -F`

## after node rebuild/teardown

- `kubeadm init --image-repository k8s.gcr.io` on mpi-rose
- `bash hack/cluster-setup/yoink-admin-credentials.sh mpi-rose`
- `kubeadm join` on other nodes while copying that into the YAML
- roll out weave-net
  - `kubectl apply -f core/weave-net.yaml`
- **wait for all nodes to join**
  - you don't want to overwhelm the control node while nodes are joining
  - also, you want the next step to roll out to all the nodes at once
- roll out core gitops toolkit and **secrets**
  - `kubectl apply -f core/gotk-system.yaml`
  - `kubectl apply -f secrets/actual/hornhorse-cloudflare.secrets.yaml`
- roll out file to deploy rest of the system
  - `kubectl apply -f core/stubernetes-system.yaml`

## consequences to not following this

- if you forget to deploy the secrets
  - cert-manager will make garbage artifacts you have to manually delete
    - and potentially bust your request limits with Let's Encrypt
- if you forget to label the nodes
  - contour's envoys and rook-ceph won't roll out
    - which will make prometheus slow to init
    - and ingresses absent
- if you don't deploy weave-net promptly (like, within 45 minutes)
  - nodes will be tainted as unreachable, and from what I can tell they won't reconcile, even six hours later
