# Node Configuration Operator

This would be an operator that looks for a document that would describe, essentially, all the things the "imager app" would handle when creating a new node, and reconfiguring live nodes to match:

- Kubelet configuration?
  - Like, advanced user? Go ahead, tweak kubelet!
  - Roll out updates even maybe!
  - Still trying to understand the DNS situation?
- Package and update management
  - Additional packages
  - Freeze / holds
  - Package removals from "core" (replaced with alternatives)

[Dynamic Kubelet Config](https://kubernetes.io/docs/tasks/administer-cluster/reconfigure-kubelet/) is also a thing I ought to look into

## another angle

What if there was a daemon that watched for announcemnts of every host joining the network via DHCP, and if their name fits the `^w..-` format, it tries to SSH in with the "setup key" and join them to the cluster.
