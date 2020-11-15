# back to longhorn

Now that we've got the cluster DNS fixed

doing `kubectl port-forward -n longhorn-system svc/longhorn-frontend 8069:80`

http://127.0.0.1:8069/node

creating new disks for the mount paths under `/media` called `studtop-hdd` and `studtop-microsd`, tagging the former as `bulk` and the latter as `work`

going to http://127.0.0.1:8069/setting and checking the "don't create default disk" box

going back to the disks and reserving 4 gigs on the microsd and 16 on the hard disk. also deleting the default disk because, you know, why bother

## the static storage class

Okay, so... this is for disks provisioned via the Dashboard, I guess?

## tweaking / making new storage classes

trying to read the broken english on [longhorn's concepts page](https://longhorn.io/docs/0.8.1/concepts/) is bothering me

adding these via the Dashboard's resource adder (I don't want to put them in `manifests` - I'll make a different directory for them in a bit, maybe call it "resources"):

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: work-storage
provisioner: driver.longhorn.io
allowVolumeExpansion: true
parameters:
  numberOfReplicas: "3"
  staleReplicaTimeout: "2880" # 48 hours in minutes
  fromBackup: ""
  diskSelector: "work"
```

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: bulk-storage
provisioner: driver.longhorn.io
allowVolumeExpansion: true
parameters:
  numberOfReplicas: "1"
  staleReplicaTimeout: "2880" # 48 hours in minutes
  fromBackup: ""
  diskSelector: "bulk"
```

got a failure with "Deploying file has failed" and "the server could not find the requested resource"

looks like updating might fix that? I'm on 2.0.0-rc5 when the latest release is 2.0.1?

the [k3s docs](https://rancher.com/docs/k3s/latest/en/installation/kube-dashboard/) suggest deleting the dashboard namespace altogether, but, like, that seems like it'd also necessitate recreating the admin user and shit, so: nah

```
studtop [~]$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.1/aio/deploy/recommended.yaml
namespace/kubernetes-dashboard unchanged
serviceaccount/kubernetes-dashboard unchanged
service/kubernetes-dashboard unchanged
secret/kubernetes-dashboard-certs unchanged
secret/kubernetes-dashboard-csrf configured
Warning: kubectl apply should be used on resource created by either kubectl create --save-config or kubectl apply
secret/kubernetes-dashboard-key-holder configured
configmap/kubernetes-dashboard-settings unchanged
role.rbac.authorization.k8s.io/kubernetes-dashboard unchanged
clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard unchanged
rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard unchanged
clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard unchanged
deployment.apps/kubernetes-dashboard configured
service/dashboard-metrics-scraper unchanged
deployment.apps/dashboard-metrics-scraper configured
```

ok yeah now the thing works. both storage classes have been added
