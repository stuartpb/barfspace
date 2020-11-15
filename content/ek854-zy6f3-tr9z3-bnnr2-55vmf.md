# Abandoning All Hope in Non-Replicated Data

One of my nodes went down last night, likely due to a malfunctioning fan causing the chip to overheat.

However, this morning, I see weirdness from the Prometheus pod (the one that takes the storage):

```
Events:
  Type     Reason       Age                   From     Message
  ----     ------       ----                  ----     -------
  Warning  FailedMount  49m (x62 over 14h)    kubelet  Unable to attach or mount volumes: unmounted volumes=[prometheus-kps-prometheus-db], unattached volumes=[kps-prometheus-token-5zcdj config config-out tls-assets prometheus-kps-prometheus-db prometheus-kps-prometheus-rulefiles-0]: timed out waiting for the condition
  Warning  FailedMount  29m (x56 over 14h)    kubelet  Unable to attach or mount volumes: unmounted volumes=[prometheus-kps-prometheus-db], unattached volumes=[prometheus-kps-prometheus-rulefiles-0 kps-prometheus-token-5zcdj config config-out tls-assets prometheus-kps-prometheus-db]: timed out waiting for the condition
  Warning  FailedMount  20m (x72 over 14h)    kubelet  Unable to attach or mount volumes: unmounted volumes=[prometheus-kps-prometheus-db], unattached volumes=[config config-out tls-assets prometheus-kps-prometheus-db prometheus-kps-prometheus-rulefiles-0 kps-prometheus-token-5zcdj]: timed out waiting for the condition
  Warning  FailedMount  10m (x438 over 14h)   kubelet  MountVolume.MountDevice failed for volume "pvc-50037d43-3be3-4dd2-bad2-d7df80ff7e7c" : rpc error: code = Aborted desc = an operation with the given Volume ID 0001-0009-rook-ceph-0000000000000003-2f7f9688-0bb7-11eb-aa02-96bb55f464a1 already exists
  Warning  FailedMount  4m32s (x52 over 14h)  kubelet  Unable to attach or mount volumes: unmounted volumes=[prometheus-kps-prometheus-db], unattached volumes=[prometheus-kps-prometheus-db prometheus-kps-prometheus-rulefiles-0 kps-prometheus-token-5zcdj config config-out tls-assets]: timed out waiting for the condition
```

I try to dig more into this, but trying a command like `ceph status` in the rook-ceph toolkit just hangs indefinitely. I try deleting the PV, and then the PVC, but that doesn't fix it.

As I ponder this, I realize: the problem with `throwaway` is that it can't fulfill reads/writes *if one node providing some of the blocks of the volume goes down*, due to the non-replicated nature of the data. It really is an untenable storage class: if I want to [roll out Kured](09x1b-rvd6r-9g8zp-eedt2-ta0mf), I need the system to tolerate at least one node being down at any given time.

As such, I'm rewriting the system definition to remove the one instance of `throwaway` being used; for the foreseeable future, all Stubernetes projects will be using the `double` storage class. (If another node is added in the future, I might add an erasure-coded class.)

Anyway, while I could pick apart how this specifically broke the ceph cluster, I decide that would be a relative waste of time (since this is a failure coming out an unsupported configuration anyway), and I move straight to [Teardown, Reconfigure, and Rebuild 2020-10-04](yh6xx-ghwp8-c190b-jae1w-hff3k)
