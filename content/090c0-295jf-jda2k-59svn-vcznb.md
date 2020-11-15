# sturl reflash

I couldn't get sturl to boot on the new Raspberry Pi, and rather than figure out what was wrong I figured I'd just go ahead and reflash the system

I reset all the other nodes [a little over a week ago](hgaxp-fstnb-0dbb3-3jrhp-8wvyv)

I redownload https://download.opensuse.org/repositories/devel:/kubic:/images/openSUSE_Factory_ARM/openSUSE-MicroOS.aarch64-Kubic-kubeadm-RaspberryPi.raw.xz and use Etcher to re-flash the SD card

the Ignition key still has the sturl hostname on it

```
sudo mount /dev/sdd2 -o noatime,subvol=@/root /mnt
sudo mkdir -p /mnt/.ssh
sudo bash -c 'curl https://github.com/stuartpb.keys > /mnt/.ssh/authorized_keys'
sudo chmod 0600 /mnt/.ssh/authorized_keys
sudo umount /mnt
```

build 94 didn't work but reflashing with 88 did

had to re-execute the root key insertion off stuzzy because of a mount issue

`ssh-keygen -R sturl.403.testtrack4.com`

sshing in and running `journalctl -fu transactional-update.service`

hitting `reboot` and, after rebooting, `hostnamectl set-hostname $(cat /etc/hostname)`, then `kubeadm init`

doing `cat /etc/kubernetes/admin.conf` to get the kubeconfig stuff I need

## setting up the cluster

doing `kubectl create ns stubernetes-system` first

`less /usr/share/k8s-yaml/weave/weave.yaml` to see what the latest tag they suggest is...

updating all the 2.6.5 references to 2.7.0 before doing `helm install -n stubernetes-system stubernetes-core .`

looks like the helm install worked

## preparing to connect

SSHing into all workers and doing `hostnamectl set-hostname $(cat /etc/hostname)`

pasting the join command into each of them

## IT IS DONE

```
[stuart@stushiba ~]$ kubectl get nodes
NAME                            STATUS   ROLES    AGE    VERSION
stuby.403.testtrack4.com        Ready    <none>   100s   v1.18.8
stumethyst.403.testtrack4.com   Ready    <none>   41s    v1.18.8
stuphire.403.testtrack4.com     Ready    <none>   64s    v1.18.8
sturl.403.testtrack4.com        Ready    master   57m    v1.18.8
```

## Continuing on

[Stubernetes System, Now on Appropriate Hardware](2ryrx-50dkp-4nb6h-w4kpw-j6076)
