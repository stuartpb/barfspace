# Last Sunday September 2020 Cluster Teardown and Rebirth

Running `hostnamectl set-hostname $(sed 's/\..*//' /etc/hostname)` on all nodes - I mean, this is what they were already doing, I'm just making it consistent

Did [403 Network Setup for October](cwt92-9k4sd-es85j-9swb0-2f8jj) last night

Rolling out [The New systemd-resolved plan](18rma-ergve-37b22-0wrya-f8ygz)

## teardown

running `kubeadm reset`

gotta remember to remove /var/lib/rook on ALL worker nodes, due to mon placement

running `rm -rf /var/lib/rook` on each worker node (not present on sturl)
