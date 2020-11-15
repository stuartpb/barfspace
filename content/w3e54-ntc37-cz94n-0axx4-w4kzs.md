# One More Time

I can't get the Prometheus install to not churn forever, so I'm going to go ahead and burn the whole cluster down and restart from the top, again.

SSHing into the worker nodes and doing `kubeadm reset`, as well as resetting sturl

no need to `hostnamectl set-hostname $(cat /etc/hostname)` this time because they're all still there from before

restarting `kubeadm init` on sturl

doing `cat /etc/kubernetes/admin.conf` and re-copying even though, actually, it looks unchanged? huh whatever

`kubectl create ns stubernetes-system`

`helm install -n stubernetes-system stubernetes-core .`

pasting the join link, all workers have joined. deep breath

## rolling out the components

from stubernetes-system/helmreleases

d'oh, forgot to `kubectl apply -f ../namespaces/household-system.yaml` again, hopefully won't be too big a deal

applied:

- kube-prometheus-stack
- metallb
- household-contour
- rook-ceph
- household-internal-dns

now, from stubernetes-system/storage, applying cluster and bulk

## still can't see grafana.prometheus.internal

maybe because none of the nodes are recognizing as viable for the Contour spec?

`kubectl annotate pods --all st8s.testtrack4.com/zone=403`

oh herp derp, I didn't set `enabled: true` in the values, only the subsidiary ones.

and now upgrading the chart just fails...
