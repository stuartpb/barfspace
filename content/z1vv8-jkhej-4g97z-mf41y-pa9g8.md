# kubernetes for storage: how

## current thinking re: links below

So, like, a thing I don't get is why Kubernetes doesn't seem to have any sort of "generically provision subdirectories as remote backup for volumes which you copy locally", which should work for nfs and pretty much everything?

ie just a Provisioner / StorageClass that says "subdivide a local / hostPath volume", and then Pods that need the volume get only provisioned on nodes with local volume support just like they do now

I mean, doesn't Docker have something like this?

## links from Googling "kubernetes storage"

https://thenewstack.io/kubernetes-and-the-challenge-of-adding-persistent-storage/

https://softwareengineeringdaily.com/2019/01/11/why-is-storage-on-kubernetes-is-so-hard/

## more exploration of storage for kubernetes

https://docs.min.io/docs/deploy-minio-on-kubernetes

https://github.com/minio/minio-operator

https://github.com/kubernetes/examples/tree/master/staging/storage/minio

https://rook.io/

I didn't really get what Rook did, but after reading one of the blog posts above, I think I get it a little more? shrug

https://rook.io/docs/rook/v1.0/ceph-quickstart.html

https://rook.io/docs/rook/v1.0/k8s-pre-reqs.html#kubeadm

## Bookmarks for understanding how Kubernetes comprehends state and services

https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/

https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/

### specifically sround understanding storage

https://kubernetes.io/docs/concepts/storage/persistent-volumes/

https://kubernetes.io/docs/concepts/storage/storage-classes/
