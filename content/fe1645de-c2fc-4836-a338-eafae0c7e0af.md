# Diving into Kubernetes with Minikube on stushiba

Doing basically `sudo pacman -S minikube kubectl virtualbox virtualbox-host-modules-arch` to get minikube and its deps installed

Then I thought about it a bit, ran `sudo pacman -R virtualbox` and decided to go with KVM whichI already have installed

ran `yay docker-machine-driver-kvm2` to get the necessary driver for that

kind of following http://blog.programmableproduction.com/2018/03/08/Archlinux-Setup-Minikube-using-KVM/

already had the whole headache setting up VM networking so that's NBD

opened the Dashboard and set the cluster name to "stushiba"
