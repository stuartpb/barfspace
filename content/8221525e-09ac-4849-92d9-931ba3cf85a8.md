# 2020-10-04 Stubernetes spinup checklist

- `kubeadm init` on sturl
- post-init cluster recognition
  - copy `cat /etc/kubernetes/admin.conf` values into local kubeconfig
  - paste `kubeadm join` on workers
- first sanity check
  - ensure all nodes are listed in `kubectl get nodes` (status doesn't matter, see note below)
- core setup
  - label nodes (zone=403 and storage-group=storberry)
  - create namespace stubernetes-system
  - helm install -n stubernetes-system stubernetes-core
- smoothing pre-installation
  - apply crd files
- initial first-level system setup
  - apply metallb hr
  - apply cert-manager hr
  - apply internal-ingress hr
- hornhorse prep
  - apply hornhorse-external-dns hr
  - apply hornhorse-cloudflare secret
  - apply hornhorse-issuer issuer
- first sign of life
  - apply kubernetes-dashboard hr
- check that https://kubernetes-dashboard.horn.horse is working
- hold your breath (these do need to go in order):
  - apply rook-ceph hr
  - apply cluster cephcluster
  - apply throwaway class+pool
- hopeful next step
  - apply kube-prometheus-stack hr
  - (write and) apply pomerium hr
  - (write and) apply node-feature-discovery hr
- hardware necessity
  - deploy fan manager for stuphire (matching nfd if possible)
- future fixes
  - tweak Prometheus / dashboard ingresses to be behind Pomerium
- non-system
  - notestack code workspaces

## on "ready"

- nodes joining at the beginning don't have to be "ready"
  - adding a CNI in the next step will take care of that
  - they'll be ready if there's lingering stuff from the last iteration
