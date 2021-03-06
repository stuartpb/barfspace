# June 5 2020 Sprint

- Expand storage for images/containers
  - Make ext4 filesystem on new flash drive
  - Copy containerd directory contents via [rsync](https://unix.stackexchange.com/a/392545/7733)
    - or even `mkfs-ext4 -d`
  - Mount flash drive over containerd
  - Add config line to add this mount to fstab
  - Reboot to ensure that every handle is moved to rsync
  - Mount the root filesystem under /mnt
  - Remove the shadowed containerd files
- Upgrade Prometheus Helm Chart
  - Finish implementing ServiceMonitor for household-dns
  - Add PVCs for Prometheus and Grafana
- Install Loki Stack
- Key in workspace
  - Will be passphrase-protected for use by me
  - replace .ssh ConfigMap mount with 2 subPath mounts
- Enabling encryption in the notestack workspace
  - Having a passphrase-protected key doesn't mean much if my keystrokes for the passphrase are being transmitted in the clear
  - Also, hey, shouldn't VS Code be providing this as an SSH_ASKPASS?
