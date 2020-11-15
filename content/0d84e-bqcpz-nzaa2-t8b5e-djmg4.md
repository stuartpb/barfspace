# A Dashboard-Hub / Pi Provisioner Kubepet/Stubernetes Model

See also the [Router Functions on a Raspberry Pi](r9d1p-tm7bg-0y9dg-4r8s2-h25rb)

[Understanding Talos Better](gaxy0-psq4m-85an8-fe154-qnqg0) illuminates another use for a small few-job Raspberry Pi: providing the preflashed IPX images to set up new nodes

there's also the whole section on How the Face Should Work: this'd be a sensible function for the "Head" of the KubePet

the "face" could also show, like, "writing, please do not reconfigure the storage pool..."

## On using the Raspberry Pi Zero for this

From https://blog.alexellis.io/test-drive-k3s-on-raspberry-pi/

> The Raspberry Pi Zero and first-gen RPi (armv6l) are not compatible with k3s. The main reason is that these devices have very low-powered and so the Kubernetes project does not publish Docker images for this CPU architecture.

however, this could still be used to launch a pod by iPXE booting a rump kernel or whatever on a fixed core
