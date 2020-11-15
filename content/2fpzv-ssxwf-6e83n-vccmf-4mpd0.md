# 2020-07-02 studtop initial setup

sshing in and running `curl -L https://download.opensuse.org/tumbleweed/iso/openSUSE-Kubic-DVD-x86_64-Current.iso | dd of=/dev/mmcblk0` to get our install media up to date

the plan:

- reinstall completely normally
  - add SSH key of newly-generated keypair kept on ignition stick only as authorized key for root account
- log in using said key
- change hostname, change logind.conf manually, see if `transactional-update` does anything and restart
  - if I can change the hostname cleanly in installation I might just reload systemd-logind instead of update/restarting the system
- `kubeadm init` and gank the new config locally
  - not gonna even bother copying to the root user on the host any more
- install stubernetes-core to initialize weave and prepare helm-operator to deploy when ready
- initialize the Pi 4 with Ignition key in it
- figure out giving it a DHCP reservation etc or whatever so its IP matches DNS
- `kubeadm join`
- ensure the Helm Operator is scheduled once that's done
- start deploying stubernetes-system to the Pi as a worker

## execution

went through setup:

- setup had a UI problem with the SSH key having no label; while this should be fixed upstream, the fix locally is that this should always have a "stuart@stubernetes" memo at the end on the pubkey
- ssh failed to log in with a key that was 0644 and not `chmod 600 id_rsa` - I don't think I can make my Chrome app set permissions, but it'd be cool if I could

## diversion after setting hostname

When editing logind.conf

I decide that, actually, this time, I want to leave `HandleLidSwitch=suspend` *on*. In general, we're gonna be governed by `HandleLidSwitchExternalPower=ignore`, and you know what? if I'm resorting to battery, I *want* to be able to suspend the system by closing the lid (so long as removing power doesn't retroactively trigger a suspension).

otoh... can't I just do a manual `powerctl suspend` or something like that? and closing the lid won't wake the system?

screw it, let's not rock the boat now. I'll set both to `ignore`.

## back to it

after setting the hostname with hostnamectl and exiting and reentering, I do `systemctl restart systemd-logind`

transactional-update did nothing

gonna go ahead and `kubeadm init` now

## uhh wtf

```
W0702 01:38:52.470237    3026 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]
[init] Using Kubernetes version: v1.18.3
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
error execution phase preflight: [preflight] Some fatal errors occurred:
	[ERROR ImagePull]: failed to pull image registry.opensuse.org/kubic/kube-apiserver:v1.18.3: output: time="2020-07-02T01:39:07Z" level=fatal msg="pulling image failed: rpc error: code = Unknown desc = Error choosing image instance: no image found in manifest list for architecture amd64, variant \"\", OS linux"
, error: exit status 1
	[ERROR ImagePull]: failed to pull image registry.opensuse.org/kubic/kube-controller-manager:v1.18.3: output: time="2020-07-02T01:39:13Z" level=fatal msg="pulling image failed: rpc error: code = Unknown desc = Error choosing image instance: no image found in manifest list for architecture amd64, variant \"\", OS linux"
, error: exit status 1
	[ERROR ImagePull]: failed to pull image registry.opensuse.org/kubic/kube-scheduler:v1.18.3: output: time="2020-07-02T01:39:18Z" level=fatal msg="pulling image failed: rpc error: code = Unknown desc = Error choosing image instance: no image found in manifest list for architecture amd64, variant \"\", OS linux"
, error: exit status 1
	[ERROR ImagePull]: failed to pull image registry.opensuse.org/kubic/kube-proxy:v1.18.3: output: time="2020-07-02T01:39:23Z" level=fatal msg="pulling image failed: rpc error: code = Unknown desc = Error choosing image instance: no image found in manifest list for architecture amd64, variant \"\", OS linux"
, error: exit status 1
[preflight] If you know what you are doing, you can make a check non-fatal with `--ignore-preflight-errors=...`
To see the stack trace of this error execute with --v=5 or higher
```

... let's try the old "turning it off and back on again"

## okay, so, now

trying `kubeadm init` again I back out quick because, once again, the transient hostname has become just "studtop"

anyway, I got the same problem.. not sure what's up, but it seems to be trying to init one version behind what they're packaging upstream. `kubeadm init --kubernetes-version v1.18.4`

```
[apiclient] All control plane components are healthy after 54.014566 seconds
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config-1.18" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Skipping phase. Please see --upload-certs
[mark-control-plane] Marking the node studtop.nodes.403.stuartpb.com as control-plane by adding the label "node-role.kubernetes.io/master=''"
[mark-control-plane] Marking the node studtop.nodes.403.stuartpb.com as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
[bootstrap-token] Using token: (nice try wise guy)
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to get nodes
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy
```

going ahead and grabbing the admin values out of /etc/kubernetes/admin.conf as well as copying down the kubeadm join lines

## the one command for studtop

first I `kubectl create ns stubernetes-system`

then (from the stubernetes-core work tree) `helm install -n stubernetes-system stubernetes-core .`
