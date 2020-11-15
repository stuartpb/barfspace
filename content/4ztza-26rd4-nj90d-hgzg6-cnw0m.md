# Implementing the New Stubernetes Plan

## Renaming the node to studtop

SSHed in, I'm gonna go ahead and `cd /var/lib/rancher/k3os`

`sudo bash -c 'echo studtop >hostname'`

now `sudo bash -c '>config.d/10_hostname.yaml && mv config.d/10_hostname.yaml config.d/20_k3s-args.yaml'`

## Setting up MetalLB

Following an idea I got from [this page](https://mindmelt.nl/mindmelt.nl/2019/04/08/k3s-kubernetes-dashboard-load-balancer/), since this is replacing a k3(o)s system component, I'm going to put MetalLB's manifest in the [server manifests](https://rancher.com/docs/k3s/latest/en/advanced/#auto-deploying-manifests) instead of using `kubectl apply`

(at this point I'm just going to `sudo -i`)

`curl -sfL https://raw.githubusercontent.com/google/metallb/v0.8.3/manifests/metallb.yaml > /var/lib/rancher/k3s/server/manifests/metallb.yaml`

`vi /var/lib/rancher/k3s/server/manifests/metallb-config.yaml` and pasting this in:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: private-stubernetes
      protocol: layer2
      addresses:
      - 192.168.32.0-192.168.63.255
```

## Swapping out the svclb

`vi vi /var/lib/rancher/k3os/config.d/20_k3s-args.yaml`

setting it to this:

```yaml
k3os:
  k3s_args:
  - server
  - "--no-deploy"
  - servicelb
```

## here goes everything

`reboot`

## looks good

hostname changed, can still connect - sounds like a win for me

## cleaning up

Going to the dashboard from stuzzy and searching "svclb" in each of the current namespaces

There's a couple lingering pods in kube-system for traefik (even though the DaemonSet seems to have been deleted?), of 3 and 6 days... I can't delete them?

Oh, okay, looking at the logs, it looks like these got thrown each time I changed the hostname?

OHH. Herp derp, wow, okay, didn't realize kubernetes worked like this: each time I renamed the node, it saw itself as an all-new node, and appears to have *re-established the pods on the new node, as the old ones became unavailable*

from stuzzy:

```sh
kubectl drain k3os-26863 --force --delete-local-data --grace-period=0
kubectl drain stukrates --force --delete-local-data --grace-period=0
kubectl delete k3os-26863
kubectl delete stukrates
```
