# Abortive Install to PNY Elite-X

This was my first attempt at [Installing Kubic on Studtop](apqev-my4ak-mzbtq-09rsa-dcac5)

## booting from install media

Man this is a weird startup progress bar

Picking "kubeadm" role

## authentication setup

switching over to Ctrl+Alt+F2 when the dialogue to add an SSH key comes up

doing `TMPDIR=$(mktmpfs -d); curl https://pubkeys.stuartpb.com/ssh/stushiba.pub > $TMPDIR/stushiba.pub` to import a key (because it won't accept the GitHub list...)

back to the GUI on Ctrl+Alt+F7 (the "Raise Brightness" key on the Chromebook keyboard)

setting no root password

clicking through to:

## Partitioning

Looks like it uses btrfs by default?

tried to install to the SD card I got for Work

I only see one 64 GB disk here - I cofirm

Choosing both disks works, but only if you choose the USB drive as the root

if I try to use the onboard flash as the root, I need to have LVM installed, so it can spread the volumes across disks. Yikes no thanks

I don't plan on needing LVM soon; maybe in a hypervisor arrangement

looks like it provisions 26 gigs to the root, and the rest to `/var`?

okay, looks like this division is arbitrary...

ah heck, let's go ahead and enable lvm, and that way we can resize the partitions as needed at runtime

## going down the list of the rest of the options

software: cool I guess

time zone: leaving on Global/UTC, changing this seems like a bad idea

networking: routing says "IP Forwarding for IPv4: off" - wasn't obvious what this refers to, but I'm assuming if it'd interfere with MetalLB I can change it

booting: secure boot on, trusted boot off. Hey, I mean, if you can swing that, go right ahead. looks like my only options would be to customize GRUB which I don't care to do

Kdump: sure whatever

## proceeding to install

Wow, this is going REALLY slowly, like every package takes ten seconds after hitting 97% or so?

Looking at the output on the other VTs

projected time remaining for the installation is *an hour and a half?!*

like, what, is the disk slow? these are both USB 3.0, it'd suck if *that* is not fast

yes, it's on the USB 3 hub, but, like... even in the worst case, the overhead issues with USB 3 shouldn't make it slower than a *platter* drive

okay, it's a lot lower now with 15 packages to go, but, like... what the fuck? is it constantly expanding the LVM volume or something?

still though, the overall message here is that this took at *least* an hour to install, maybe 2, we'll see if it gives a readout when it finishes (I can't just go by the uptime because I spent a lot of time faffing about, but that's somewhere around 4 hours).

## ok it's done

I have to `ssh-keygen -R 192.168.0.23` before I can `ssh root@192.168.0.23` in

for some reason my system's transient hostname is "sysresccd". either openSUSE does a DEEP scan, or there was something echoing around in DHCP

anyway, I go ahead and do `hostnamectl set-hostname studtop` and `reboot` before all this gets out of hand.

man, it feels like even the shutdown is really slow

getting back in, I make sure and `curl https://github.com/stuartpb.keys > .ssh/authorized_keys` so I can switch machines

## a little fore planning

Before I get started, I look into what Weave is liable to involve

https://metallb.universe.tf/configuration/weave/

Skipping ahead in the docs process: https://en.opensuse.org/Kubic:kubeadm#Weave

`less /usr/share/k8s-yaml/weave/weave.yaml`

hmm, this looks like it'll be simple enough to edit. okay let's move back to where we stuck our thumb and

```
W0611 05:14:56.199970    8243 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]
[init] Using Kubernetes version: v1.18.2
[preflight] Running pre-flight checks
	[WARNING Hostname]: hostname "studtop" could not be reached
	[WARNING Hostname]: hostname "studtop": lookup studtop on [2607:f060:2::1]:53: no such host
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
```

I close the lid, and, oh herp derp, there go all the connections

I `nano /etc/systemd/logind.conf` to set these:

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
```

I'm leaving `LidSwitchIgnoreInhibited=yes` on because it sounds like that's what I'm looking for: https://github.com/systemd/systemd/issues/7137 explains an instance where that would matter

## anyway, kubeadm is back

```
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
W0611 05:27:24.225405    8243 manifests.go:225] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[control-plane] Creating static Pod manifest for "kube-scheduler"
W0611 05:27:24.228323    8243 manifests.go:225] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[kubelet-check] Initial timeout of 40s passed.
[kubelet-check] It seems like the kubelet isn't running or healthy.
[kubelet-check] The HTTP call equal to 'curl -sSL http://localhost:10248/healthz' failed with error: Get http://localhost:10248/healthz: dial tcp [::1]:10248: connect: connection refused.
[kubelet-check] It seems like the kubelet isn't running or healthy.
[kubelet-check] The HTTP call equal to 'curl -sSL http://localhost:10248/healthz' failed with error: Get http://localhost:10248/healthz: dial tcp [::1]:10248: connect: connection refused.

	Unfortunately, an error has occurred:
		timed out waiting for the condition

	This error is likely caused by:
		- The kubelet is not running
		- The kubelet is unhealthy due to a misconfiguration of the node in some way (required cgroups disabled)

	If you are on a systemd-powered system, you can try to troubleshoot the error with the following commands:
		- 'systemctl status kubelet'
		- 'journalctl -xeu kubelet'

	Additionally, a control plane component may have crashed or exited when started by the container runtime.
	To troubleshoot, list all containers using your preferred container runtimes CLI.

	Here is one example how you may list all Kubernetes containers running in cri-o/containerd using crictl:
		- 'crictl --runtime-endpoint /var/run/crio/crio.sock ps -a | grep kube | grep -v pause'
		Once you have found the failing container, you can inspect its logs with:
		- 'crictl --runtime-endpoint /var/run/crio/crio.sock logs CONTAINERID'

error execution phase wait-control-plane: couldn't initialize a Kubernetes cluster
To see the stack trace of this error execute with --v=5 or higher
```

ehh, the lid thing might have busted it. `systemctl restart kubelet`

okay, looks like that's right... but now what? I want the clean-kubeadm-install experience

doing `kubeadm reset`

```
[reset] Reading configuration from the cluster...
[reset] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
W0611 05:36:54.431696   13749 reset.go:99] [reset] Unable to fetch the kubeadm-config ConfigMap from cluster: failed to get config map: Get https://192.168.0.23:6443/api/v1/namespaces/kube-system/configmaps/kubeadm-config?timeout=10s: dial tcp 192.168.0.23:6443: connect: connection refused
[reset] WARNING: Changes made to this host by 'kubeadm init' or 'kubeadm join' will be reverted.
[reset] Are you sure you want to proceed? [y/N]: y
[preflight] Running pre-flight checks
W0611 05:36:57.242442   13749 removeetcdmember.go:79] [reset] No kubeadm config, using etcd pod spec to get data directory
[reset] Stopping the kubelet service
[reset] Unmounting mounted directories in "/var/lib/kubelet"
[reset] Deleting contents of config directories: [/etc/kubernetes/manifests /etc/kubernetes/pki]
[reset] Deleting files: [/etc/kubernetes/admin.conf /etc/kubernetes/kubelet.conf /etc/kubernetes/bootstrap-kubelet.conf /etc/kubernetes/controller-manager.conf /etc/kubernetes/scheduler.conf]
[reset] Deleting contents of stateful directories: [/var/lib/etcd /var/lib/kubelet /var/lib/dockershim /var/run/kubernetes /var/lib/cni]

The reset process does not clean CNI configuration. To do so, you must remove /etc/cni/net.d

The reset process does not reset or clean up iptables rules or IPVS tables.
If you wish to reset iptables, you must do so manually by using the "iptables" command.

If your cluster was setup to utilize IPVS, run ipvsadm --clear (or similar)
to reset your system's IPVS tables.

The reset process does not clean your kubeconfig files and you must remove them manually.
Please, check the contents of the $HOME/.kube/config file
```

okay, well, there's no `.kube/config` here...

okay, doing the same thing, basically the same thing happened again

okay, so, after thinking about it for a while... doing `kubeadm reset` again

and, what the heck why not: adding `192.168.0.23 studtop` to the end of /etc/hosts. I think this system is kind of designed expecting to run in an environment with an external DNS giving you your own hostname

I feel like I'd normally want this handled within systemd-resolved? but I can deal with that another time, this works for now

running `kubeadm init` again:

```
Jun 11 06:11:47 studtop kubelet[24285]: I0611 06:11:47.493369   24285 manager.go:277] Recovery completed
Jun 11 06:11:47 studtop kubelet[24285]: I0611 06:11:47.515697   24285 kubelet_node_status.go:486] Recording NodeHasSufficientMemory event message for node studtop
Jun 11 06:11:47 studtop kubelet[24285]: I0611 06:11:47.515756   24285 kubelet_node_status.go:486] Recording NodeHasNoDiskPressure event message for node studtop
Jun 11 06:11:47 studtop kubelet[24285]: I0611 06:11:47.515785   24285 kubelet_node_status.go:486] Recording NodeHasSufficientPID event message for node studtop
Jun 11 06:11:47 studtop kubelet[24285]: I0611 06:11:47.515843   24285 kubelet_node_status.go:70] Attempting to register node studtop
Jun 11 06:11:47 studtop kubelet[24285]: E0611 06:11:47.516533   24285 kubelet_node_status.go:92] Unable to register node "studtop" with API server: Post https://192.168.0.23:6443/api/v1/nodes: dial tcp 192.1>
Jun 11 06:11:47 studtop kubelet[24285]: E0611 06:11:47.525747   24285 kubelet.go:1845] skipping pod synchronization - container runtime status check may not have completed yet
Jun 11 06:11:47 studtop kubelet[24285]: E0611 06:11:47.575164   24285 controller.go:136] failed to ensure node lease exists, will retry in 400ms, error: Get https://192.168.0.23:6443/apis/coordination.k8s.io>
Jun 11 06:11:47 studtop kubelet[24285]: E0611 06:11:47.585434   24285 kubelet.go:2267] node "studtop" not found
Jun 11 06:11:47 studtop kubelet[24285]: E0611 06:11:47.690623   24285 kubelet.go:2267] node "studtop" not found
```

looking at `journalctl -u kubelet`, oh *wow*, they start it enabled but just have it fail a bunch while there's no config defined

uhh... let's do `kubeadm reset` again. `iptables -F`

## why tf is all this so slow?!?

Look at these first three lines. ??? What made logind feel like it had to wait 15 seconds?

```
Jun 11 06:47:57 studtop wickedd-dhcp6[1090]: enp0s20u1u4: Request to acquire DHCPv6 lease with UUID 9cd3e15e-6243-0800-c904-000005000000 in mode auto
Jun 11 06:47:58 studtop wickedd-dhcp4[1088]: enp0s20u1u4: Committed DHCPv4 lease with address 192.168.0.23 (lease time 4294967295 sec, renew in 2147483647 sec, rebind in 536870911 sec)
Jun 11 06:48:01 studtop wickedd-dhcp6[1090]: enp0s20u1u4: Committing empty DHCPv6 lease
Jun 11 06:48:16 studtop systemd-logind[1086]: New seat seat0.
Jun 11 06:48:16 studtop systemd-logind[1086]: Watching system buttons on /dev/input/event4 (Power Button)
Jun 11 06:48:16 studtop systemd-logind[1086]: Watching system buttons on /dev/input/event2 (Lid Switch)
Jun 11 06:48:16 studtop systemd-logind[1086]: Watching system buttons on /dev/input/event3 (Sleep Button)
Jun 11 06:48:17 studtop systemd-logind[1086]: Watching system buttons on /dev/input/event0 (AT Translated Set 2 keyboard)
Jun 11 06:48:17 studtop systemd[1]: Started Login Service.
Jun 11 06:48:26 studtop wicked[1230]: lo              up
Jun 11 06:48:26 studtop wicked[1230]: enp0s20u1u4     up
Jun 11 06:48:26 studtop wicked[1230]: enp             no-device
Jun 11 06:48:26 studtop systemd[1]: Finished wicked managed network interfaces.
Jun 11 06:48:26 studtop systemd[1]: Reached target Network.
Jun 11 06:48:26 studtop systemd[1]: Reached target Network is Online.
Jun 11 06:48:26 studtop systemd[1]: Starting NTP client/server...
Jun 11 06:48:26 studtop systemd[1]: Starting Container Runtime Interface for OCI (CRI-O)...
Jun 11 06:48:26 studtop systemd[1]: Starting Load kdump kernel and initrd...
Jun 11 06:48:26 studtop systemd[1]: Starting kubelet: The Kubernetes Node Agent...
Jun 11 06:48:26 studtop systemd[1]: Starting Reboot Manager...
Jun 11 06:48:26 studtop systemd[1]: Starting OpenSSH Daemon...
```

And then *another nine* to start OpenSSH! WTF??

## okay, maybe this will help us find the core issue

```
studtop:~ # systemd-analyze blame --no-pager
47.941s btrfsmaintenance-refresh.service
30.194s wicked.service
23.872s systemd-logind.service
14.033s apparmor.service
13.606s kdump.service
12.646s crio.service
12.616s systemd-udev-settle.service
 9.457s lvm2-monitor.service
 6.046s chrony-wait.service
 5.707s sshd.service
 5.635s chronyd.service
 4.808s dracut-initqueue.service
 4.698s kdump-early.service
 3.949s systemd-remount-fs.service
 3.752s systemd-random-seed.service
 3.237s health-checker.service
 3.212s systemd-journal-flush.service
 2.703s systemd-journald.service
 2.509s systemd-udevd.service
 1.830s rebootmgr.service
 1.715s kbdsettings.service
 1.679s wickedd-auto4.service
 1.677s wickedd-dhcp4.service
 1.659s wickedd-dhcp6.service
 1.380s wickedd.service
 1.312s systemd-tmpfiles-setup-dev.service
  972ms initrd-switch-root.service
  716ms lvm2-pvscan@8:2.service
  521ms systemd-fsck@dev-disk-by\x2duuid-B292\x2dAFD1.service
  493ms initrd-parse-etc.service
  476ms dracut-cmdline.service
  339ms systemd-rfkill.service
  311ms user@0.service
  269ms systemd-udev-trigger.service
  233ms srv.mount
  229ms issue-add-ssh-keys.service
  211ms opt.mount
  195ms usr-local.mount
  174ms boot-grub2-i386\x2dpc.mount
  159ms issue-generator.service
  156ms \x2esnapshots.mount
  152ms systemd-backlight@backlight:intel_backlight.service
  148ms boot-grub2-x86_64\x2defi.mount
  142ms boot-writable.mount
  138ms create-dirs-from-rpmdb.service
  132ms boot-efi.mount
  132ms home.mount
  126ms dracut-pre-udev.service
  125ms tmp.mount
  104ms systemd-user-sessions.service
   97ms auditd.service
   94ms wickedd-nanny.service
   91ms systemd-sysctl.service
   88ms initrd-cleanup.service
   70ms systemd-fsck-root.service
   65ms systemd-vconsole-setup.service
   65ms systemd-tmpfiles-setup.service
   62ms dev-hugepages.mount
   60ms dev-mqueue.mount
   59ms systemd-modules-load.service
   57ms sys-kernel-debug.mount
   57ms sysroot.mount
   54ms sys-kernel-tracing.mount
   48ms kmod-static-nodes.service
   39ms user-runtime-dir@0.service
   38ms systemd-tmpfiles-clean.service
   37ms systemd-update-utmp.service
   32ms dracut-shutdown.service
   29ms kubelet.service
   23ms initrd-udevadm-cleanup-db.service
   22ms systemd-update-utmp-runlevel.service
```

Googling the service name:

- https://en.opensuse.org/SDB:Fix_btrfsmaintenance-refresh
- https://www.reddit.com/r/openSUSE/comments/d0ehxq/btrfsmaintenancerefreshservice_takes_several/
  - blames chrony-wait
    - https://www.reddit.com/r/openSUSE/comments/cqcu6k/clean_system_takes_too_long_to_boot_10min/
- https://community.spiceworks.com/topic/2226165-why-is-my-opensuse-installation-taking-2-mins-to-boot

```
studtop:~ # systemd-analyze critical-chain
The time when unit became active or started is printed after the "@" character.
The time the unit took to start is printed after the "+" character.

multi-user.target @1min 4.030s
└─kdump.service @48.137s +13.606s
  └─wicked.service @17.928s +30.194s
    └─wickedd-nanny.service @17.829s +94ms
      └─wickedd.service @16.444s +1.380s
        └─wickedd-dhcp4.service @14.758s +1.677s
          └─dbus.service @14.690s
            └─basic.target @14.680s
              └─sockets.target @14.680s
                └─dbus.socket @14.680s
                  └─sysinit.target @14.677s
                    └─apparmor.service @644ms +14.033s
                      └─systemd-journald.socket
                        └─system.slice
                          └─-.slice
```

## okay, what if this were Kubicctl-based

Looking back at [the role definitions](https://github.com/yast/skelcd-control-Kubic/blob/master/control/control.Kubic.xml#L224)

oh screw it, let's just try `transactional-updates`

## rebooting

```
multi-user.target @1min 21.949s
└─chrony-wait.service @1min 9.113s +10.282s
  └─chronyd.service @58.934s +10.166s
    └─network.target @58.481s
      └─wicked.service @28.346s +30.134s
        └─wickedd-nanny.service @28.290s +52ms
          └─wickedd.service @28.016s +270ms
            └─wickedd-dhcp4.service @26.900s +1.104s
              └─dbus.service @26.833s
                └─basic.target @26.826s
                  └─sockets.target @26.826s
                    └─dbus.socket @26.826s
                      └─sysinit.target @26.823s
                        └─systemd-update-utmp.service @26.792s +30ms
                          └─auditd.service @26.717s +71ms
                            └─systemd-tmpfiles-setup.service @26.656s +58ms
                              └─systemd-journal-flush.service @11.783s +14.870s
                                └─local-fs.target @11.768s
                                  └─var-lib-containers-storage-btrfs.mount @1min 13.391s
                                    └─local-fs-pre.target @10.956s
                                      └─lvm2-monitor.service @659ms +10.296s
                                        └─dm-event.socket @630ms
                                          └─-.mount
                                            └─system.slice
                                              └─-.slice
```

trying `kubeadm init` again... nope, same problem

## one last throw of the dice

I'm starting to think I might just ditch the idea of keeping a core component of my system on

I went into the mmcblk0 onboard and changed the GLIM config to point to the `/iso` on root, so there's that

`transactional-update pkg install -t pattern kubic_admin`

Okay, this is taking forever... honestly, even if this works I'm probably going to give up and go with the MicroSD-based install

## coming back tomorrow

Yeah, I tried it, still didn't work.
