# stusmuth

I almost went ahead and flashed OctoPi to my new Raspberry Pi 3A , but I decided to go with Kubic at the last minute. I'm not sure if I want to join it to the Stubernetes cluster proper yet; however, I'm considering running the Octoprint image on it via Podman, if I do decide to experiment with Octoprint itself any more (rather than developing a static, minimal system)

Flashing https://download.opensuse.org/repositories/devel:/kubic:/images/openSUSE_Factory_ARM/openSUSE-MicroOS.aarch64-16.0.0-Kubic-kubeadm-RaspberryPi-Build94.21.raw.xz

```
mount /dev/sde2 -o noatime,subvol=@/root /mnt
mkdir -p /mnt/.ssh
curl https://github.com/stuartpb.keys > /mnt/.ssh/authorized_keys
```
