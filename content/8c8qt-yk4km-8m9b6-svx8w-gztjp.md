# 2013-12-31 adjustments for systemd

- rc.conf has been deprecated in favor of systemd stuff for a while: hostname now goes in /etc/hostname
  - In general I feel like this was probably a holdover from the old way of installing Arch

## magic sysrq

by systemd 207, /etc/sysctl.conf was obsolete and the default config (in /usr/lib) set kernel.sysrq=16 (SYNC only)

replaced with `# echo "kernel.sysrq=1" > /etc/sysctl.d/magic-sysrq.conf`
