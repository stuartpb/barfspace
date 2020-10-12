# 2020-09-23 Night Plan

Had a real beast of a time getting rid of the cached DHCP IPv6 lease causing stumethyst to point to stunster - ended up restarting odhcpcd and unbound, then unplugging/replugging every ethernet cable in the cluster.

Had to ssh into stumez and stunster to `hostnamectl set-hostname $(cat /etc/hostname)` and restart the kubelets, so yeah, solving that is high on my list

Anyway, my priorities tonight are:

- upgrade the cluster to 1.19
- join stumethyst to the cluster
- make super-sure allll the disks are ready for a fresh Ceph install
- introduce new storage classes, descibed by their characteristics
- get Transmission going
- make the fan less loud on stumethyst

## recap

got new hardware (USB enclosures, Micro SD cards that can be used to introduce new nodes, Argon hat)

## updating

followed https://en.opensuse.org/Kubic:Upgrading_kubeadm_clusters for sturl, stuby, stuphire, and stunster (stumez was already up to date, having been set up since the release of 1.19)

had to do this on all the workers (only the pis had the dashboard thing, but they all had the alertmanager thing):

```
error: cannot delete Pods with local storage (use --delete-local-data to override): kubernetes-dashboard/kubernetes-dashboard-8b6b65cbb-429ps, prometheus/alertmanager-kps-alertmanager-0
[stuart@stushiba ~]$ kubectl drain stuphire.403.testtrack4.com --ignore-daemonsets --delete-local-data
```

hmm, I wonder if that's something having persistent storage can fix, at least for the prometheus one. not sure why the dashboard has a local volume (shitty build-in cert self-signing? only thing that possibly comes to mind), will have to explore that another time

anyway,

```
[stuart@stushiba ~]$ kubectl get nodes
NAME                          STATUS   ROLES    AGE    VERSION
stuby.403.testtrack4.com      Ready    <none>   4d1h   v1.19.1
stumez.403.testtrack4.com     Ready    <none>   4d1h   v1.19.1
stunster.403.testtrack4.com   Ready    <none>   4d1h   v1.19.1
stuphire.403.testtrack4.com   Ready    <none>   4d1h   v1.19.1
sturl.403.testtrack4.com      Ready    master   4d1h   v1.19.1
```

disco

## adding stumethyst

running `kubeadm token create --print-join-command` on sturl, then pasting that to stumethyst to join (after setting-the-hostname-back, thanks to the preflight for catching that)

stumethyst didn't like that I'd brought the node up to 1.19.0, there was no image to pull for it; I ended up redoing the drain-upgrade-uncordon dance again for sturl, then a quick `kubeadm upgrade node && systemctl restart kubelet` on the rest (the cordon/uncordon thing seemed like overkill for a patch release). that was enough to fix the problem on stumethyst

## some weirdness with the new drive on stuphire

```
stuphire:~ # lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0   1.8T  0 disk
└─sda1        8:1    0   1.8T  0 part
sdb           8:16   0 111.8G  0 disk
mmcblk1     179:0    0 115.9G  0 disk
├─mmcblk1p1 179:1    0    16M  0 part /boot/efi
└─mmcblk1p2 179:2    0 115.8G  0 part /
stuphire:~ # sgdisk --zap-all /dev/sda

***************************************************************
Found invalid GPT and valid MBR; converting MBR to GPT format
in memory.
***************************************************************

GPT data structures destroyed! You may now partition the disk using fdisk or
other utilities.
stuphire:~ # rm -rf /var/lib/rook
stuphire:~ # dd if=/dev/zero of="/dev/sda" bs=1M count=100 oflag=direct,dsync
dd: failed to open '/dev/sda': Invalid argument
stuphire:~ # lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0    16E  0 disk
sdb           8:16   0 111.8G  0 disk
mmcblk1     179:0    0 115.9G  0 disk
├─mmcblk1p1 179:1    0    16M  0 part /boot/efi
└─mmcblk1p2 179:2    0 115.8G  0 part /
stuphire:~ # partprobe
device-mapper: deps ioctl on ceph--284ec12a--9eed--4699--86dc--06b7379c937f-osd--data--02ec85a3--d307--43c8--b5b1--cdabe94f5120  failed: No such device or address
device-mapper: deps ioctl on ceph--81da99ff--175e--437c--bd30--675b9d7430d2-osd--data--8f4cd527--fc47--45b5--8895--625c96693421  failed: No such device or address
device-mapper: deps ioctl on ceph--11a2f9b0--ecc5--4575--8c25--ba7fd83aa96d-osd--data--061c6ffb--3c98--46ff--a5ce--61b9221caf5e  failed: No such device or address
stuphire:~ # lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0    16E  0 disk
sdb           8:16   0 111.8G  0 disk
mmcblk1     179:0    0 115.9G  0 disk
├─mmcblk1p1 179:1    0    16M  0 part /boot/efi
└─mmcblk1p2 179:2    0 115.8G  0 part /
stuphire:~ # ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
device-mapper: remove ioctl on ceph--11a2f9b0--ecc5--4575--8c25--ba7fd83aa96d-osd--data--061c6ffb--3c98--46ff--a5ce--61b9221caf5e  failed: No such device or address
Command failed.
device-mapper: remove ioctl on ceph--284ec12a--9eed--4699--86dc--06b7379c937f-osd--data--02ec85a3--d307--43c8--b5b1--cdabe94f5120  failed: No such device or address
Command failed.
device-mapper: remove ioctl on ceph--81da99ff--175e--437c--bd30--675b9d7430d2-osd--data--8f4cd527--fc47--45b5--8895--625c96693421  failed: No such device or address
Command failed.
```

I'm gonna go ahead and reboot...

## hmm

So, I got some weird hardware behavior, and after much fuss, I realized the problem was that the drive I bought, as the Amazon reviews stated, pulls an over-spec amount of power - enough to be handled by the CanaKit power supply I just bought for Stumethyst (which I juggled around so it's now plugged into Stuphire, and Stumethyst has the official Raspberry Pi power supply, and Sturl has the white power supply)

On this note, though, I really have to consider not using the batteries for these. It kills me, since I bought six of them, but they can't power the hard drives AND the Pi, I don't think, and it seems like browning this drive out does not bode well.

## anyway

I've gone ahead and double-triple-checked everything is purged: time to try deploying rook-ceph again.

## first

I'm deploying a new release of the kube-prometheus-stack with no storage spec. One, I'm gonna need to redeploy it anyway, since I'm planning on redesigning the storage classes, and two, I don't want it stuck right now, and three, I need to check if there are maybe other storage specs I need?

## fixing stuck chart

I do `kubectl get secrets -n kubernetes-dashboard` and edit the last secret that's `helm.sh/release.v1` so the status is `deployed`, per https://github.com/helm/helm/issues/7476#issuecomment-579411034

Since the HR still seems to be stuck in that state, I'm deleting the operator pod...

Still stuck.. fuck it, this isn't a particularly difficult chart to remake, I'll just delete and reinstall it.

## reevaluating my cluster CRD

 I've decided the "drive group" model makes a lot of sense

`kubectl label nodes stuby.403.testtrack4.com stuphire.403.testtrack4.com stumethyst.403.testtrack4.com st8s.testtrack4.com/storage-group=storberry`

there, that answers my "what about the name I'm actively giving these" question

This also makes for a reasonable way to expand the cluster: the storberry nodes are all about using whatever storage is plugged into them, but

Okay, I've put this off long enough... pushing the resources

wow, it really doesn't do anything until you push a Cluster doc
