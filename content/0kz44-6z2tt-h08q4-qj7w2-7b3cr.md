# Taking the Helm Operator for a Spin

```
kubectl describe pods -n stubernetes-system
(... snip ...)
  Warning  FailedScheduling  79s (x8 over 9m50s)  default-scheduler  0/1 nodes are available: 1 node(s) had taint {node-role.kubernetes.io/master: }, that the pod didn't tolerate.
```

oh d'oy. forgot to take the last step from the installation

## next problem

derp, accidentally wrote `registry` in the `values.yaml` for weave-net instead of `repository`

fixing, then running `helm upgrade -n stubernetes-system stubernetes-core .`

```
[stuart@stushiba stubernetes-core]$ kubectl get pods -n stubernetes-system
NAME                                              READY   STATUS    RESTARTS   AGE
stubernetes-core-helm-operator-54ffcf4986-5lfl7   1/1     Running   0          26m
```

disco

## rolling out stubernetes-system

Okay, where to start...

```
[stuart@stushiba helmreleases]$ kubectl create -f metallb.yaml
namespace/metallb-system created
helmrelease.helm.fluxcd.io/metallb created
```

That failed because it's set up to create a ServiceMonitor, and Kubernetes doesn't have the CRD yet

so I install prometheus-operator, which works

that makes the metallb installation work, too:

```
[stuart@stushiba helmreleases]$ kubectl get pods -n metallb-system
NAME                                  READY   STATUS    RESTARTS   AGE
metallb-controller-655585bf7b-bcqvj   1/1     Running   0          2m24s
metallb-speaker-pjwzx                 1/1     Running   0          2m24s
```

okay, now I'm rolling out OpenEBS and [referring back to my notes here](9jxgv-wgeyx-mra75-51wn3-gd604)

`kubectl get bd -n openebs` doesn't work(?), but `kubectl get blockdevices -n openebs` does

okay, looks like we have the same block devices, good, I didn't mix up my flash drives

```
[stuart@stushiba storage]$ kubectl create -f bulk.yaml -f work.yaml
storageclass.storage.k8s.io/openebs-bulk created
storagepoolclaim.openebs.io/cstor-bulk-pool created
storagepoolclaim.openebs.io/cstor-work-pool created
storageclass.storage.k8s.io/openebs-work created
```

and now I'm realizing, d'oh, I wanted to call the classes `bulk` and `work`...

```
[stuart@stushiba helmreleases]$ kubectl delete sc openebs-bulk
Error from server: etcdserver: request timed out
[stuart@stushiba helmreleases]$ kubectl delete sc openebs-bulk
Error from server: context deadline exceeded
```

HMM. Well, shit, now we know where the slowdown's coming from...

You know what? Out of sheer cursedness, I wonder if pulling out the USB drive would make the system work again - crash the work pool, let everything else go.

## pull

Nope... rebooting, nope...

```
journalctl -u kubelet
```

Oh wow, a lot of pieces looking for the `studtop` node...

Oh fuck me, is that what this is? The broken state spewed a bunch of bad data onto the drive, and now it's too confused by that?

Well, let's get rid of openebs while I figure this out: `kubectl delete -f openebs.yaml `

also doing `kubectl delete spc cstor-bulk-pool` and `kubectl delete spc cstor-work-pool`

all these deletions are hanging. Probably not a good sign

## Welp, fuck it

We've still got the installation media on the root disk, that makes it reeeal easy to just go ahead, wipe the system and try again.

I've wrapped up most of the setup changes into a new Ignition file, I'm ready to try this again - and this time, I'm going to zero the disks before I install openebs. And if it happens *again*... well, we'll see.

[Remaking Studtop Again](21xwq-jt2vh-7g9ys-2bbac-bmtrs)
