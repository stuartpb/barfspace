# 2020-10-14 Pod Errors

## coredns

```
E1015 05:13:15.460807       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:15.460814       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Endpoints: Get "https://10.96.0.1:443/api/v1/endpoints?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:15.460875       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
.:53
[INFO] plugin/reload: Running configuration MD5 = db32ca3650231d74073ff4cf814959a7
CoreDNS-1.7.0
linux/arm64, go1.14.4, f59c03d
E1015 05:13:18.580215       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Endpoints: Get "https://10.96.0.1:443/api/v1/endpoints?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:18.580215       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:18.580548       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:21.710410       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:21.710410       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:21.710535       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Endpoints: Get "https://10.96.0.1:443/api/v1/endpoints?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
[ERROR] plugin/errors: 2 1166689798426314495.5049273936867266747. HINFO: read udp 10.32.0.2:43316->192.168.1.1:53: i/o timeout
[ERROR] plugin/errors: 2 1166689798426314495.5049273936867266747. HINFO: dial udp [fd5a:b141:6779::1]:53: connect: network is unreachable
[ERROR] plugin/errors: 2 1166689798426314495.5049273936867266747. HINFO: read udp 10.32.0.2:41836->192.168.1.1:53: i/o timeout
[ERROR] plugin/errors: 2 1166689798426314495.5049273936867266747. HINFO: dial udp [fd5a:b141:6779::1]:53: connect: network is unreachable
E1015 05:13:28.740418       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:28.740410       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:28.740550       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Endpoints: Get "https://10.96.0.1:443/api/v1/endpoints?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:39.380378       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:39.380641       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Endpoints: Get "https://10.96.0.1:443/api/v1/endpoints?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:39.380810       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:13:57.540429       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:14:00.660290       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:14:03.780507       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Endpoints: Get "https://10.96.0.1:443/api/v1/endpoints?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:14:31.300197       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:14:35.220451       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Endpoints: Get "https://10.96.0.1:443/api/v1/endpoints?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
E1015 05:14:46.900314       1 reflector.go:178] pkg/mod/k8s.io/client-go@v0.18.3/tools/cache/reflector.go:125: Failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: connect: no route to host
[INFO] SIGTERM: Shutting down servers then terminating
[INFO] plugin/health: Going into lameduck mode for 5s
```

## kured

```
time="2020-10-15T05:17:14Z" level=info msg="Kubernetes Reboot Daemon: unreleased"
time="2020-10-15T05:17:14Z" level=info msg="Node ID: wpi-garnet"
time="2020-10-15T05:17:14Z" level=info msg="Lock Annotation: kured/kured:weave.works/kured-node-lock"
time="2020-10-15T05:17:14Z" level=info msg="Reboot Sentinel: /var/run/reboot-required every 1h0m0s"
time="2020-10-15T05:17:14Z" level=info msg="Blocking Pod Selectors: []"
time="2020-10-15T05:17:14Z" level=info msg="Reboot on: SunMonTueWedThuFriSat between 00:00 and 23:59 UTC"
time="2020-10-15T05:17:14Z" level=info msg="Force annotation cleanup disabled."
time="2020-10-15T05:17:17Z" level=fatal msg="Error testing lock: Get \"https://10.96.0.1:443/apis/apps/v1/namespaces/kured/daemonsets/kured\": dial tcp 10.96.0.1:443: connect: no route to host"
```

## rook-ceph-rgw-st8s3

No log data, but here are the events:

```
Events:
  Type     Reason                  Age                   From               Message
  ----     ------                  ----                  ----               -------
  Normal   Scheduled               13m                   default-scheduler  Successfully assigned rook-ceph/rook-ceph-rgw-st8s3-a-864c6456c7-7zrwp to wpi-garnet
  Warning  FailedCreatePodSandBox  13m                   kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_rook-ceph-rgw-st8s3-a-864c6456c7-7zrwp_rook-ceph_5e251426-1b88-4c09-bdc5-a33bb1bf54d1_0(b256e937db8fc6e8fbf1bd82910bffdd9362b681bc687475e962261d0e2e674e): unable to set hairpin mode to true for bridge side of veth vethweplb256e93: operation not supported
  Warning  FailedCreatePodSandBox  13m                   kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_rook-ceph-rgw-st8s3-a-864c6456c7-7zrwp_rook-ceph_5e251426-1b88-4c09-bdc5-a33bb1bf54d1_0(bac7c0f86f644c96b45873c28d0271f544345a1249d65c2fd743315ac70782d8): unable to set hairpin mode to true for bridge side of veth vethweplbac7c0f: operation not supported
  Warning  FailedCreatePodSandBox  13m                   kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_rook-ceph-rgw-st8s3-a-864c6456c7-7zrwp_rook-ceph_5e251426-1b88-4c09-bdc5-a33bb1bf54d1_0(5b9d6a7760e2281dd4bcc3082f0b3f51c6a2cf2b1e2ece59334685fa46fcc4db): unable to set hairpin mode to true for bridge side of veth vethwepl5b9d6a7: operation not supported
  Warning  FailedCreatePodSandBox  13m                   kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to create pod network sandbox k8s_rook-ceph-rgw-st8s3-a-864c6456c7-7zrwp_rook-ceph_5e251426-1b88-4c09-bdc5-a33bb1bf54d1_0(dd1024d77fab40513361cdcb4743dd45e037b9bad51007cad237781ba90206de): unable to set hairpin mode to true for bridge side of veth vethwepldd1024d: operation not supported
  Normal   Pulled                  12m                   kubelet            Container image "ceph/ceph:v15.2.5" already present on machine
  Normal   Started                 12m                   kubelet            Started container chown-container-data-dir
  Normal   Created                 12m                   kubelet            Created container chown-container-data-dir
  Normal   Killing                 11m (x2 over 12m)     kubelet            Container rgw failed liveness probe, will be restarted
  Normal   Pulled                  10m (x3 over 12m)     kubelet            Container image "ceph/ceph:v15.2.5" already present on machine
  Normal   Created                 10m (x3 over 12m)     kubelet            Created container rgw
  Normal   Started                 10m (x3 over 12m)     kubelet            Started container rgw
  Warning  Unhealthy               3m48s (x21 over 12m)  kubelet            Liveness probe failed: Get "http://10.40.0.4:8080/swift/healthcheck": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
```

