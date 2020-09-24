# Resetting kube-prometheus-stack

```
[stuart@stushiba ~]$ kubectl describe helmrelease kube-prometheus-stack -n stubernetes-system
Name:         kube-prometheus-stack
Namespace:    stubernetes-system
Labels:       <none>
Annotations:  API Version:  helm.fluxcd.io/v1
Kind:         HelmRelease
Metadata:
  Creation Timestamp:  2020-09-14T05:08:24Z
  Generation:          2
  Managed Fields: # snip
    Manager:         helm-operator
    Operation:       Update
    Time:            2020-09-14T05:31:14Z
  Resource Version:  23867
  Self Link:         /apis/helm.fluxcd.io/v1/namespaces/stubernetes-system/helmreleases/kube-prometheus-stack
  UID:               f9f79bce-3cfa-45cb-8775-fb6730b2e451
Spec:
  Chart:
    Name:            kube-prometheus-stack
    Repository:      https://prometheus-community.github.io/helm-charts
    Version:         9.4.1
  Release Name:      kube-prometheus-stack
  Target Namespace:  prometheus
  Values:
    Fullname Override:  kps
    Grafana:
      Ingress:
        Annotations:
          st8s.testtrack4.com/zone:  403
        Hosts:
          grafana.prometheus.internal
      Node Selector:
        kubernetes.io/arch:  amd64
    Prometheus:
      Ingress:
        Annotations:
          st8s.testtrack4.com/zone:  403
        Hosts:
          webui.prometheus.internal
      Prometheus Spec:
        Node Selector:
          kubernetes.io/arch:  amd64
    Prometheus Operator:
      Node Selector:
        kubernetes.io/arch:  amd64
    Storage Spec:
      Volume Claim Template:
        Metadata:
          Name:  ps
        Spec:
          Access Modes:
            ReadWriteOnce
          Resources:
            Requests:
              Storage:         50Gi
          Storage Class Name:  bulk
Status:
  Conditions:
    Last Transition Time:   2020-09-14T05:26:34Z
    Last Update Time:       2020-09-14T05:26:34Z
    Message:                Running upgrade for Helm release 'kube-prometheus-stack' in 'prometheus'.
    Reason:                 Upgrading
    Status:                 Unknown
    Type:                   Released
  Last Attempted Revision:  9.4.1
  Observed Generation:      2
  Phase:                    Upgrading
  Release Name:             kube-prometheus-stack
  Release Status:           pending-upgrade
  Revision:                 9.4.1
Events:
  Type     Reason             Age                  From           Message
  ----     ------             ----                 ----           -------
  Warning  FailedReleaseSync  26s (x46 over 138m)  helm-operator  synchronization of release 'kube-prometheus-stack' in namespace 'prometheus' failed: failed to determine sync action for release: status 'pending-upgrade' of release does not allow a safe upgrade
```

I forgot [there's a way to fix this](https://docs.fluxcd.io/projects/helm-operator/en/stable/faq/#a-helmrelease-is-stuck-in-a-failed-release-state-how-do-i-force-it-through) and went "screw it, I'm deleting the HelmRelease and reinstalling it"

logs in the helm operator look like it's stuck in a loop

fuck it, no amount of re-adding is fixing it.

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
```
