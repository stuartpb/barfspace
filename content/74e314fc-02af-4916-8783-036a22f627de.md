# interesting systemctl features I hadn't noticed?

- switch-root (how much like chroot is this?)
- oh neat, there's hybrid-sleep
  - this could be facilitated by a swap partition on USB storage? idk
- snapshot?
  - is that just, like, a dump of `ls -l /etc/systemd`? or is that an actual system state snapshot somehow?
- list-jobs? Is that, like, jobs that got lost via `bg` or ctrl+s or whatever?
- list-machines? it says "list local containers and host" - how much virtualization is this?
- the mask/unmask commands for units seem interesting
