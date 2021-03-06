# Installing Kubic on Studtop

Originally tried following [the Fancy On-Board Image Viewer plan](fqj27-pjkze-cxbtv-2szde-g0gc3)

I tried getting stuff to boot from the root partition, but after much wrestling with the system I ended up at a GRUB boot with no entries.

Rather than figure out how to fix this, I decided "fuck it" and just flashed the image to a USB flash drive

That ended up failing: all the lines from that misadventure are under [Abortive Install to PNY Elite-X](7td1z-nbsr1-febya-dzzef-dd804)

## reinstalling to microsd

Anyway, this flash drive is cursed

But, as it turns out, I have forgotten where I put the flash drive I installed this with. So, since I'm not gonna use it for the system anyway, I get the flash drive I was planning to run the system off of out of studtop and into stushiba, where I run etcher on the 2020-06-10 Kubic DVD snapshot.

## side thought about the flash drive

[About the PNY Elite-X](pgw74-d17nf-rfbt9-fgvcz-yyx8j)

Further side thought here: [What is probably a good Longhorn disk model](jwtbs-jfj7f-8mawe-fdfg4-a5hwe) (also has Clusterhood idea)

## booting and running the installer

I go through the installer and just do not mess with *anything*. Don't set a localhost, don't change the default drive suggestion (using the MicroSD card, Btrfs, I don't think any LVM), don't change the default time. I do pick the "kubeadm" role again, though, since I again don't see the value in the kubicctl stuff just yet (and I'll bet it's simple enough to transition into if I felt like it).

Encouragingly, this installation goes at a normal speed (making me think maybe it's not such a tragedy this USB drive wouldn't work for K3OS after all?)

## readministering: first things first

I have to `ssh-keygen -R 192.168.0.23` again

`curl https://github.com/stuartpb.keys > .ssh/authorized_keys` comes first, even though I just broke Stuzzy with an update this morning somehow

Next most important thing is to `nano /etc/systemd/logind.conf` and set the `HandleLidSwitch` stuff to `ignore` again

## what's next

Almost did a transactional-update, but then I decided, actually, you know what? Let's do it, let's set a hostname. I don't think that's honestly where the problem came from, and if it is, well, fuck, let's have another go-round with this and maybe turn LVM on the next time round, see if that makes anything slower?

Anyway, I'm gonna do a `hostnamectl set-hostname studtop` first

Ah, there's nothing to do for the transactional-update, cool. Before we restart: this startup did take a while, let's check the critical chain:

```
multi-user.target @45.944s
└─chrony-wait.service @30.808s +12.551s
  └─chronyd.service @29.793s +1.008s
    └─network.target @29.789s
      └─wicked.service @21.946s +7.841s
        └─wickedd-nanny.service @21.900s +42ms
          └─wickedd.service @21.472s +423ms
            └─wickedd-auto4.service @20.379s +1.085s
              └─dbus.service @20.315s
                └─basic.target @20.307s
                  └─sockets.target @20.307s
                    └─dbus.socket @20.306s
                      └─sysinit.target @20.301s
                        └─apparmor.service @1.188s +19.113s
                          └─systemd-journald.socket
                            └─-.mount
                              └─system.slice
                                └─-.slice
```

Hmm... let's hope that chrony-wait service doesn't come back again. (Or let it, I guess? I suppose this is probably the system update's way of making sure the system doesn't drift)

Shutdown takes about 18 seconds. Not amazing, but not awfil (again, hoping that we don't have to do this more often than once a day, this is a perfectly acceptable compromise)

New critical chain:

```
multi-user.target @43.293s
└─chrony-wait.service @32.843s +7.026s
  └─chronyd.service @30.549s +2.289s
    └─network.target @30.545s
      └─wicked.service @13.349s +17.194s
        └─wickedd-nanny.service @13.291s +53ms
          └─wickedd.service @13.045s +241ms
            └─wickedd-auto4.service @11.540s +1.499s
              └─dbus.service @11.487s
                └─basic.target @11.481s
                  └─sockets.target @11.481s
                    └─dbus.socket @11.481s
                      └─sysinit.target @11.476s
                        └─systemd-update-utmp.service @11.444s +31ms
                          └─auditd.service @11.317s +124ms
                            └─systemd-tmpfiles-setup.service @11.263s +50ms
                              └─systemd-journal-flush.service @5.128s +6.132s
                                └─local-fs.target @5.112s
                                  └─var-lib-containers-storage-btrfs.mount @37.652s
                                    └─local-fs-pre.target @4.581s
                                      └─lvm2-monitor.service @1.154s +3.426s
                                        └─dm-event.socket @1.125s
                                          └─-.mount
                                            └─system.slice
                                              └─-.slice
```

## anyway

`kudeadm init` again:

```
W0612 01:09:01.051189    2987 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]
[init] Using Kubernetes version: v1.18.2
[preflight] Running pre-flight checks
	[WARNING Hostname]: hostname "studtop" could not be reached
	[WARNING Hostname]: hostname "studtop": lookup studtop on [2607:f060:2:1::1]:53: no such host
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
```

Hmm, you know what? I go ahead and hit CTRL+C on this. Like, yeah, it looks like this is a pretty easily solved problem, I have an easily searchable warning, and there is a chance that a busted record here can pileup and break the whole system - I'll look into reproducing that... once I have a cluster to do it with.

- https://github.com/kubernetes/kubernetes/issues/49065

[The kubeadm docs sort of obliquely say that adding your own IP to /etc/hosts is right](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/troubleshooting-kubeadm/#pods-are-not-accessible-via-their-service-ip)

> - If you are using VirtualBox (directly or via Vagrant), you will need to ensure that `hostname -i` returns a routable IP address. By default the first
  interface is connected to a non-routable host-only network. A work around is to modify `/etc/hosts`, see this [Vagrantfile](https://github.com/errordeveloper/k8s-playground/blob/22dd39dfc06111235620e6c4404a96ae146f26fd/Vagrantfile#L11) for an example.

[More notes on the own-hostname problem](50wcq-dy30d-gva42-69kef-yfssa)

## Solving it proper

After researching the situation more, I'm running `transactional-update pkg install nss-myhostname`, then `transactional-update shell`

```
studtop:~ # transactional-update shell
Checking for newer version.
transactional-update 2.21.1 started
Options: shell
Separate /var detected.
/etc on overlayfs detected.
WARNING: You are creating a snapshot from a different base (1) than the
         current default snapshot (3).
         If you want to continue a previous snapshot use the --continue
         option, otherwise the previous changes will be discarded.
Opening chroot in snapshot 4, continue with 'exit'
transactional update # exit 1
exit

Please reboot your machine to activate the changes and avoid data loss.
New default snapshot is #4 (/.snapshots/4/snapshot).
transactional-update finished
```

well... d'oh

```
studtop:~ # transactional-update shell --continue
Checking for newer version.
transactional-update 2.21.1 started
Options: shell --continue
Separate /var detected.
/etc on overlayfs detected.
Opening chroot in snapshot 5, continue with 'exit'
```

d'oh d'oh

well then, I guess

```
transactional update # zypper install nss-myhostname
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following NEW package is going to be installed:
  nss-myhostname

1 new package to install.
Overall download size: 381.9 KiB. Already cached: 0 B. After the operation, additional 91.8 KiB will be used.
Continue? [y/n/v/...? shows all options] (y):
```

ok, now I'm looking for the script - searching a little harder, [looks like it's been removed](https://build.opensuse.org/package/view_file/openSUSE:Factory/systemd/systemd.changes?expand=1):

> Thu Nov 10 19:11:57 UTC 2016 - fbui@suse.com
>
> - specfile: clean up nss-* plugins descriptions and drop
>   nss-myhostname-config script for now.
>
> Currently /etc/nsswitch.conf is supposed to be edited by the
> sysadmin to enable the modules. However for some reasons only
> nss-myhostname is removed from the conf file when the corresponding
> package is uninstalled. This is inconsistent so let's remove it.
>
> Actually I'm wondering if we shouldn't make those NSS plugins part
> of the main package and get rid of all those sub-packages...

but I can find [an old version](https://build.opensuse.org/package/view_file/SUSE:SLE-12-SP1:GA/systemd.2345/nss-myhostname-config?expand=0)

and, I mean, at this point I know how to do what I want to do, but I'm still curious to see how the old way worked, so

Okay, so, I'm learning about the `b` operator in sed, and, like, wow, that's super useful

Okay, so here's how it enabled, disabled, and queried:

```
	--enable)
		sed -i.bak -e '
			/^hosts:/ !b
			/\<myhostname\>/ b
			s/[[:blank:]]*$/ myhostname/
			' /etc/nsswitch.conf
		;;
	--disable)
		sed -i.bak -e '
			/^hosts:/ !b
			s/[[:blank:]]\+myhostname\>//
			' /etc/nsswitch.conf
		;;
	"")
		if grep -q "^hosts:.*\<myhostname\>" /etc/nsswitch.conf; then
			echo "enabled"
		else
			echo "disabled"
		fi
		;;
```

Why is it searching with angle brackets and a literal plus? I can't easily get to the Git history...

but, okay, whatever, it doesn't really matter, that's been it for Hyperfocus Theater for now, point is, it'd add myhostname the same way I would and will: to edit /etc/nsswitch.conf

```
transactional update # echo "`grep '^hosts:' /usr/etc/nsswitch.conf` myhostname" > /etc/nsswitch.conf
transactional update # exit
exit

Warning: The following files were changed in the snapshot, but are shadowed by
other mounts and will not be visible to the system:
/.snapshots/5/snapshot/var/lib/YaST2/cookies

Please reboot your machine to activate the changes and avoid data loss.
New default snapshot is #5 (/.snapshots/5/snapshot).
transactional-update finished
```

OK, let's do - shit. I wanted to see if that makes `hostname -i` work

Okay, opening another transactional-update shell and tested to confirm, yes, it works, and it's *spectacular* (resolves own name on IPv6, too)

Going ahead and letting it reboot

## hmm

```
studtop:~ # kubeadm init
W0612 03:09:33.433012    2611 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]
[init] Using Kubernetes version: v1.18.2
[preflight] Running pre-flight checks
	[WARNING Hostname]: hostname "studtop" could not be reached
	[WARNING Hostname]: hostname "studtop": lookup studtop on 192.168.0.1:53: no such host
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
```

Hmm, it's not respecting the `myhostname` resolver, because `hostname -i` does work...

you know what, screw it: I'll just add `192.168.0.23 studtop` to `/etc/hosts` preemptively. let's see if that's good enough. like I said this was clearly designed for environments that initialize hosts with names

and, like, I get why they'd only support the system DNS resolver or /etc/hosts

honestly, it might also do for them to pre-initialize this system with "localhost" as a name? or, like, geez idk. like, this would work without modification if "localhost" were the hostname, and then you just do all your naming at the kubelet level

for now I think I'll just post to get it added to the documentation

## now that I think about it, though...

since these devices/addresses/names are already registered with the server, why *isn't* the server resolving these names over DNS and providing them with the DHCP?

## anyway

here goes `kubeadm init` again

```
W0612 03:34:49.009104    6992 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]
[init] Using Kubernetes version: v1.18.2
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [studtop kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 192.168.0.23]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [studtop localhost] and IPs [192.168.0.23 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [studtop localhost] and IPs [192.168.0.23 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
W0612 03:35:06.473585    6992 manifests.go:225] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[control-plane] Creating static Pod manifest for "kube-scheduler"
W0612 03:35:06.476497    6992 manifests.go:225] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
```

okay...

```
[kubelet-check] Initial timeout of 40s passed.
```

uh oh...

```
[apiclient] All control plane components are healthy after 49.508268 seconds
```

phew

```
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config-1.18" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Skipping phase. Please see --upload-certs
[mark-control-plane] Marking the node studtop as control-plane by adding the label "node-role.kubernetes.io/master=''"
[mark-control-plane] Marking the node studtop as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
[bootstrap-token] Using token: 39wnat.s83ai2vv9vahi42l
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to get nodes
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.0.23:6443 --token 39wnat.s83ai2vv9vahi42l \
    --discovery-token-ca-cert-hash sha256:2dc19cfadf7a839640ed5dffa54ca562ea744749b743cfbb063c2c825ad71d3a
```

> EDITOR'S NOTE: this cluster is dead now but HEY NEXT TIME MAYBE DON'T INCLUDE THE SECRET CLUSTER JOIN TOKEN IN YOUR NOTES GENIUS
>
> LATER EDITOR'S NOTE: it doesn't matter, the traffic's internal and the tokens expire after a little bit anyway

Per https://en.opensuse.org/Kubic:kubeadm

> As mentioned in the success message, configure the root user to be able to talk to the cluster by running `mkdir -p ~/.kube`, then `cp -i /etc/kubernetes/admin.conf ~/.kube/config`

I do this, and also `cat /etc/kubernetes/admin.conf` to replace the relevant fields in my local `~.kube/config`s

## setting up weave

I do the create --edit

skip past most of the documents

when the weave-net DaemonSet comes up, I go into the spec template spec (shakes fist at Kubernetes for its dumbass pathnames) and add the `NO_MASQ_LOCAL` variable

so now the screenheight looks like this:

```
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: apps/v1
kind: DaemonSet
metadata:
  labels:
    name: weave-net
  name: weave-net
  namespace: kube-system
spec:
  minReadySeconds: 5
  selector:
    matchLabels:
      name: weave-net
  template:
    metadata:
      labels:
        name: weave-net
    spec:
      containers:
      - command:
        - /home/weave/launch.sh
        env:
        - name: HOSTNAME
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: spec.nodeName
        - name: NO_MASQ_LOCAL
          value: 1
        image: registry.opensuse.org/kubic/weave-kube:2.6.2
        name: weave
# ...etc...
```

Here's what happens after that:

```
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
A copy of your changes has been stored to "/tmp/kubectl-edit-e0r2n.yaml"
error: the namespace from the provided object "kube-system" does not match the namespace "default". You must pass '--namespace=kube-system' to perform this operation.
```

okay then

```
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
A copy of your changes has been stored to "/tmp/kubectl-edit-ub23s.yaml"
Error from server (BadRequest): DaemonSet in version "v1" cannot be handled as a DaemonSet: v1.DaemonSet.Spec: v1.DaemonSetSpec.Template: v1.PodTemplateSpec.Spec: v1.PodSpec.Containers: []v1.Container: v1.Container.ReadinessProbe: Name: Image: Env: []v1.EnvVar: v1.EnvVar.Value: ReadString: expects " or n, but found 1, error found in #10 byte of ...|,"value":1}],"image"|..., bigger context ...|pec.nodeName"}}},{"name":"NO_MASQ_LOCAL","value":1}],"image":"registry.opensuse.org/kubic/weave-kube|...
```

ah

Okay, so are these transactions atomic?

Guess not. Well, this is dumb but things should be in working order now:

```
studtop:~ # EDITOR=nano kubectl create --edit -f /usr/share/k8s-yaml/weave/weave.yaml --namespace=kube-system
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
Edit cancelled, no changes made.
daemonset.apps/weave-net created
studtop:~ # EDITOR=nano kubectl create -f /usr/share/k8s-yaml/weave/weave.yaml --namespace=kube-system
serviceaccount/weave-net created
clusterrole.rbac.authorization.k8s.io/weave-net created
clusterrolebinding.rbac.authorization.k8s.io/weave-net created
role.rbac.authorization.k8s.io/weave-net created
rolebinding.rbac.authorization.k8s.io/weave-net created
Error from server (AlreadyExists): daemonsets.apps "weave-net" already exists
```

Incidentally, the "Edit cancelled" thing seems like a bug - we don't want creations to get cancelled

Maybe the old behavior can be available under an `--only-changed` flag?

I can submit this some time via an issue or PR, I guess

anyway, let's run the last check:

```
studtop:~ # kubectl get nodes
NAME      STATUS   ROLES    AGE   VERSION
studtop   Ready    master   48m   v1.18.2
```

bingo bango

## untainting

since I am planning to see how far I can get with this as a single node (and, even when I get another node, I want it to be an equal master)

`kubectl taint nodes --all node-role.kubernetes.io/master-`

## anyway

I officially declare the Studtop Mk2 node "created"
