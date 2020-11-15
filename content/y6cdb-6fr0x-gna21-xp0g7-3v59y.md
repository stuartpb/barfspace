# Rebuilding, But Because I Want To This Time

- [new gotk-oriented BASIC-prefixed repo style](f509f-7z72m-yh834-6xk45-07q59)
- [node changes](cgek8-76f1s-068d3-zgfvj-7nh6j)

## teardown

sshing into the nodes and setting the new names

installing `clusterssh` on stushiba because I'm not doing any more of this six-terminal-tabs-one-at-a-time nonsense

using this to run `rm -rf /var/lib/rook` on all nodes, then selecting the storage cluster for

```
ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
sgdisk --zap-all /dev/sda
sgdisk --zap-all /dev/sdb
dd if=/dev/zero of=/dev/sda bs=1M count=100 oflag=direct,dsync
dd if=/dev/zero of=/dev/sdb bs=1M count=100 oflag=direct,dsync
```

then running the `kubeadm init` command on mpi-rose

running the label commands after ensuring `kubectl get nodes` sees all:

```
kubectl label nodes wpi-garnet wpi-amethyst wpi-pearl st8s.testtrack4.com/storage-group=storberry
kubectl label nodes --all st8s.testtrack4.com/zone=403
```

Got a few problems
