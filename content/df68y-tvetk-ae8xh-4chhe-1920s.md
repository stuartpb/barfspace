# Gotta Try Again

Running `kubeadm init` on the host (`kubeadm config images pull` was instant on the other 3)

On the other machines, `hostnamectl set-hostname $(cat /etc/hostname)`, then I'm pasting the unadulterated join link (I originally used the domain name: since kubeadm only sets up encryption for IPv4, that was a mistake)

```
kubectl create ns stubernetes-system
helm install -n stubernetes-system stubernetes-core stubernetes-core/
```

somewhere around here I realized it was all falling apart because the containers for the core services kept failing health checks.

it's possible I could have resolved this by editing the deployments so the health checks could be more lenient, but I ultimately decided to just redo this node as a Raspberry Pi 4, too
