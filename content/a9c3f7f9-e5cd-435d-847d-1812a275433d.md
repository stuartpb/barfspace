# That's Right, It's Another Rebuild

I do `kubeadm reset` on each node, then the teardown scripts:

```
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/cni-teardown.sh)
bash <(curl https://raw.githubusercontent.com/stuartpb/stubernetes/main/hack/teardown/rook-ceph-lvm2-teardown.sh)
```

The ceph teardown hung on wpc-morticia, specifically the `blkid` part, as an `rbd0` still seems to be mounted (checking `lsblk`).

Rebooting all the nodes - it seems like wpc-morticia isn't rebooting. I go ahead and power cycle it manually - `lsblk` at boot shows the rbd0 is gone

## new init

I run this on mpi-rose:

```
kubeadm init --image-repository k8s.gcr.io --pod-network-cidr=10.244.0.0/16
KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

I copy the join command to the other nodes

The Calico pods are all stuck:

```
Events:
  Type     Reason       Age                  From               Message
  ----     ------       ----                 ----               -------
  Normal   Scheduled    8m16s                default-scheduler  Successfully assigned kube-system/calico-node-5zw84 to mpi-rose
  Warning  FailedMount  6m13s                kubelet            Unable to attach or mount volumes: unmounted volumes=[flexvol-driver-host], unattached volumes=[host-local-net-dir flexvol-driver-host lib-modules xtables-lock var-lib-calico var-run-calico cni-bin-dir policysync sysfs calico-node-token-tktgm cni-net-dir]: timed out waiting for the condition
  Warning  FailedMount  3m55s                kubelet            Unable to attach or mount volumes: unmounted volumes=[flexvol-driver-host], unattached volumes=[calico-node-token-tktgm cni-net-dir var-lib-calico sysfs flexvol-driver-host var-run-calico policysync host-local-net-dir cni-bin-dir xtables-lock lib-modules]: timed out waiting for the condition
  Warning  FailedMount  99s                  kubelet            Unable to attach or mount volumes: unmounted volumes=[flexvol-driver-host], unattached volumes=[cni-net-dir var-run-calico sysfs host-local-net-dir var-lib-calico xtables-lock policysync cni-bin-dir calico-node-token-tktgm flexvol-driver-host lib-modules]: timed out waiting for the condition
  Warning  FailedMount  2s (x12 over 8m16s)  kubelet            MountVolume.SetUp failed for volume "flexvol-driver-host" : mkdir /usr/libexec/kubernetes: read-only file system
```

This looks like [the same problem you run into when trying to deploy Calico on CoreOS](https://docs.projectcalico.org/reference/faq#are-the-calico-manifests-compatible-with-coreos) due to `/usr` being read-only, but, like... why is the CNI trying to mount a FlexVolume? It sounds like it's some sort of hack to interface with Istio?

Anyway, this is enough to give me pause about running on Calico - I decide to revisit kube-router.

## Retrying

I run a `kubeadm reset` on all nodes and CTRL+R to rerun `cni-teardown`, then I spin up a new cluster with a nice, clean, simple-looking command:

```
kubeadm init --image-repository k8s.gcr.io --pod-network-cidr=10.244.0.0/16
KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
```

The nodes all still say `NotReady`, with conditions like this:

```
Conditions:
  Type             Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----             ------  -----------------                 ------------------                ------                       -------
  MemoryPressure   False   Fri, 16 Oct 2020 14:36:35 -0700   Fri, 16 Oct 2020 14:26:47 -0700   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure     False   Fri, 16 Oct 2020 14:36:35 -0700   Fri, 16 Oct 2020 14:26:47 -0700   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure      False   Fri, 16 Oct 2020 14:36:35 -0700   Fri, 16 Oct 2020 14:26:47 -0700   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready            False   Fri, 16 Oct 2020 14:36:35 -0700   Fri, 16 Oct 2020 14:26:47 -0700   KubeletNotReady              runtime network not ready: NetworkReady=false reason:NetworkPluginNotReady message:Network plugin returns error: No CNI configuration file in /etc/cni/net.d/. Has your network provider started?
```

This is bullshit: there's absolutely a CNI configuration file (`/etc/cni/net.d/10-kuberouter.conflist`). I try `systemctl restart kubelet`, but it's still happening.

Googling the full message turns up [this issue](https://github.com/kubernetes/kubernetes/issues/94393), which is no help. Reducing it to just the "No CNI configuration file" and onward part turns up [this](https://github.com/cri-o/cri-o/issues/3915), which, by dint of project scope, points me in the right direction: `systemctl restart crio` fixes it.

[Reported upstream](https://github.com/cri-o/cri-o/issues/4276)

Reviewing that last issue illuminates https://github.com/cri-o/cri-o/blob/master/tutorials/kubeadm.md which indicates it's possible to run CRI-O with *no CNI at all*?

## Nope, still having problems

After rolling out an update to the Kustomization, it seems like it's hung up, and I can't find out why:

```
[stuart@stushiba ~]$ kubectl -n gotk-system logs kustomize-controller-7d95cdb846-tpz6d
Error from server: Get "https://192.168.0.118:10250/containerLogs/gotk-system/kustomize-controller-7d95cdb846-tpz6d/manager": dial tcp 192.168.0.118:10250: connect: no route to host
```

Welp, looks like I'm switching to Flannel. Might as well try spinning the cluster up again...

I run the reset and the teardown scripts - oof, Gomez is so borked it can't even `curl`. I restart it... and it gets hung up. Feels like it's the same issue as wpc-morticia

## bringing this back up

For some reason, the only node that shows up as "Ready" when I check the cluster a few minutes after joining all nodes is wpc-gomez? Not mpi-rose? anyway, `systemctl restart crio` fixed this, but now, after applying `gotk-system`, the pods all seem to be failing their liveness checks...

I go ahead and reboot all nodes (gulp). I end up having to power-cycle wpc-gomez (of course).

## okay wtf

The system doesn't seem to be coming up...

```
[stuart@stushiba ~]$ kubectl get gitrepositories.source.toolkit.fluxcd.io -n stubernetes-system
NAME                 URL                                           READY   STATUS                                                                                                                        AGE
stubernetes-system   https://github.com/stuartpb/stubernetes.git   False   git clone error: Get "https://github.com/stuartpb/stubernetes.git/info/refs?service=git-upload-pack": dial tcp: i/o timeout   13m
```

groooooan

```
[stuart@stushiba ~]$ kubectl describe pod -n gotk-system source-controller-68ffcbb475-p8cdl
Name:         source-controller-68ffcbb475-p8cdl
Namespace:    gotk-system
Priority:     0
Node:         wpc-morticia/192.168.0.131
Start Time:   Sat, 17 Oct 2020 23:50:20 -0700
Labels:       app=source-controller
              pod-template-hash=68ffcbb475
Annotations:  prometheus.io/port: 8080
              prometheus.io/scrape: true
Status:       Running
IP:           10.244.5.7
IPs:
  IP:           10.244.5.7
Controlled By:  ReplicaSet/source-controller-68ffcbb475
Containers:
  manager:
    Container ID:  cri-o://8efeb4d6c8839d2368a5507de62ff8587cfc4e93958b910084d2db9df90391b6
    Image:         ghcr.io/fluxcd/source-controller:v0.1.0
    Image ID:      ghcr.io/fluxcd/source-controller@sha256:15d26abe4654c070428eadb7f1a001abd141c8caff85001dd4b8059ecfdd6105
    Ports:         9090/TCP, 8080/TCP
    Host Ports:    0/TCP, 0/TCP
    Args:
      --events-addr=http://notification-controller/
      --watch-all-namespaces=true
      --log-level=info
      --log-json
      --enable-leader-election
      --storage-path=/data
    State:          Running
      Started:      Sun, 18 Oct 2020 00:01:00 -0700
    Last State:     Terminated
      Reason:       Error
      Exit Code:    1
      Started:      Sun, 18 Oct 2020 00:00:40 -0700
      Finished:     Sun, 18 Oct 2020 00:00:59 -0700
    Ready:          True
    Restart Count:  1
    Limits:
      cpu:     1
      memory:  1Gi
    Requests:
      cpu:      50m
      memory:   64Mi
    Liveness:   http-get http://:http/ delay=0s timeout=1s period=10s #success=1 #failure=3
    Readiness:  http-get http://:http/ delay=0s timeout=1s period=10s #success=1 #failure=3
    Environment:
      RUNTIME_NAMESPACE:  gotk-system (v1:metadata.namespace)
    Mounts:
      /data from data (rw)
      /tmp from tmp (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-x8vmp (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:
    SizeLimit:  <unset>
  tmp:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:
    SizeLimit:  <unset>
  default-token-x8vmp:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-x8vmp
    Optional:    false
QoS Class:       Burstable
Node-Selectors:  kubernetes.io/arch=amd64
                 kubernetes.io/os=linux
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason                  Age                   From               Message
  ----     ------                  ----                  ----               -------
  Normal   Scheduled               15m                   default-scheduler  Successfully assigned gotk-system/source-controller-68ffcbb475-p8cdl to wpc-morticia
  Warning  Unhealthy               14m (x2 over 14m)     kubelet            Readiness probe failed: Get "http://10.244.5.2:9090/": dial tcp 10.244.5.2:9090: i/o timeout (Client.Timeout exceeded while awaiting headers)
  Normal   Killing                 14m (x2 over 14m)     kubelet            Container manager failed liveness probe, will be restarted
  Normal   Pulled                  14m (x3 over 15m)     kubelet            Container image "ghcr.io/fluxcd/source-controller:v0.1.0" already present on machine
  Normal   Created                 14m (x3 over 15m)     kubelet            Created container manager
  Normal   Started                 14m (x3 over 15m)     kubelet            Started container manager
  Warning  Unhealthy               14m (x5 over 15m)     kubelet            Readiness probe failed: Get "http://10.244.5.2:9090/": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
  Warning  Unhealthy               14m (x7 over 15m)     kubelet            Liveness probe failed: Get "http://10.244.5.2:9090/": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
  Warning  BackOff                 10m (x10 over 12m)    kubelet            Back-off restarting failed container
  Warning  FailedCreatePodSandBox  6m3s                  kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_source-controller-68ffcbb475-p8cdl_gotk-system_02bed9fb-d1e8-4bf4-a0d7-953b224f5f26_0(f26233b923f55e1739d9b06d9bcee35abf339c85de50ded0a55a5f357e463093): open /run/flannel/subnet.env: no such file or directory
  Warning  FailedCreatePodSandBox  5m50s                 kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_source-controller-68ffcbb475-p8cdl_gotk-system_02bed9fb-d1e8-4bf4-a0d7-953b224f5f26_0(10ccf7acca4c970a8369da70aee40bbf34df640efee5721f7b8b7381ad2781fb): open /run/flannel/subnet.env: no such file or directory
  Warning  FailedCreatePodSandBox  5m37s                 kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_source-controller-68ffcbb475-p8cdl_gotk-system_02bed9fb-d1e8-4bf4-a0d7-953b224f5f26_0(4e279ae89b5e1f0591b318f491a699d45b55ee0e3a57f2b17c7efee8d9d8f835): open /run/flannel/subnet.env: no such file or directory
  Warning  FailedCreatePodSandBox  5m22s                 kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_source-controller-68ffcbb475-p8cdl_gotk-system_02bed9fb-d1e8-4bf4-a0d7-953b224f5f26_0(a7da171370aaf3ce76b858863b2d3c0588e4e6f8262368a8a733ec2eb6a801ce): open /run/flannel/subnet.env: no such file or directory
  Normal   Pulled                  4m46s (x2 over 5m7s)  kubelet            Container image "ghcr.io/fluxcd/source-controller:v0.1.0" already present on machine
  Normal   Created                 4m46s (x2 over 5m7s)  kubelet            Created container manager
  Normal   Started                 4m46s (x2 over 5m6s)  kubelet            Started container manager
```

Well, I don't know, but `kubectl delete pods -n gotk-system --all` seems to have fixed the issue on the source-controller, but...

```
[stuart@stushiba ~]$ kubectl describe kustomizations.kustomize.toolkit.fluxcd.io -n stubernetes-system
Name:         stubernetes-system
Namespace:    stubernetes-system
Labels:       <none>
Annotations:  fluxcd.io/reconcileAt: 2020-10-18 07:15:07.466390234 +0000 UTC m=+20.495427582
API Version:  kustomize.toolkit.fluxcd.io/v1beta1
Kind:         Kustomization
Metadata:
  Creation Timestamp:  2020-10-18T06:50:58Z
  Finalizers:
    finalizers.fluxcd.io
  Generation:  1
  Managed Fields: # snip
  Resource Version:  14981
  Self Link:         /apis/kustomize.toolkit.fluxcd.io/v1beta1/namespaces/stubernetes-system/kustomizations/stubernetes-system
  UID:               f75ab298-34b9-4a7c-a14a-8a5405ac116a
Spec:
  Interval:  10m0s
  Path:      ./system/local
  Prune:     true
  Source Ref:
    Kind:  GitRepository
    Name:  stubernetes-system
Status:
  Conditions:
    Last Transition Time:     2020-10-18T07:32:50Z
    Message:                  reconciliation in progress
    Reason:                   Progressing
    Status:                   Unknown
    Type:                     Ready
  Last Attempted Revision:    main/ecbaf30bddeb7896cbcbfcbe4220f150b21c6364
  Last Handled Reconcile At:  2020-10-18 07:15:07.466390234 +0000 UTC m=+20.495427582
  Observed Generation:        1
Events:
  Type    Reason  Age                 From                  Message
  ----    ------  ----                ----                  -------
  Normal  error   16s (x15 over 17m)  kustomize-controller  failed to download artifact from http://source-controller.gotk-system/gitrepository/stubernetes-system/stubernetes-system/ecbaf30bddeb7896cbcbfcbe4220f150b21c6364.tar.gz, error: Get "http://source-controller.gotk-system/gitrepository/stubernetes-system/stubernetes-system/ecbaf30bddeb7896cbcbfcbe4220f150b21c6364.tar.gz": dial tcp: i/o timeout
```

okay you know what, fuck this. Kubic said Flannel was weird these days, and it looks like they were right. I'm gonna go ahead and try again with Weave Net, and if I encounter any more weirdness, I'll just kick it up the chain to Weave and/or kubic.

Tried this:

```
curl -L git.io/weave -o /tmp/weave
chmod +x /tmp/weave
/tmp/weave reset
```

Failed because there's no Docker.

Now following [this](https://github.com/weaveworks/wksctl/issues/285#issuecomment-666349341)

The key part that I think I've overlooked here is `rm -rf /var/lib/weave`, which I've done on all nodes to erase `weave-netdata.db`, which I suspect might just be the solution I've been waiting for.

I run the new cluster spinup, and all nodes are connected inside of a minute. Feels good.
