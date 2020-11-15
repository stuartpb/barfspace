# The Mark I Iteration 2 Model: Recovery-First

The first iteration of this system fell apart for two distinct reasons:

- The <16GiB of on-board storage isn't enough to hold scratch overlays and images at load.
- k3os is not good at stopping for maintenance.

As such, this iteration will be architected slightly differently:

- All of the on-board storage will be formatted as one big FAT32 ESP /boot for recovery.
  - GRUB2 will be installed here.
  - The ISO for SystemRecoveryCD will be placed here, along with a menu entry to load it into RAM.
- k3os will be installed to the 64 gig USB media from the recovery CD environment, and set as the default in Coreboot
  - The "core" configuration YAML will only include my GitHub SSH identity and the name of the node.
  - Other config extensions (ie. flags, NTP servers) will be written directly to /var/lib/rancher/k3os/config.yaml before first boot.
  - connman for the Wi-Fi can be set up at some point after startup by SSHing into the Ethernet interface.

This wouldn't have been much of a Mark 2, since it's mostly just a reconfiguration of the same hardware, with the same system.

It ended up falling apart for roughlu the same reasons its immediate successor [Abortive Kubic Install to PNY Elite-X](7td1z-nbsr1-febya-dzzef-dd804) did

The notes I wrote for how this failed were from my phone in Google Keep (if anywhere), so I'll import them later, and write them from memory if not

## Before / Enacting this

[Backing Up and Taking Off](ge4xa-f9x30-0sam8-1ad2b-m6egz)

## After this

- [Studtop Mk II Rebuilding Plan](ksm42-1xpwv-rn9ag-a1vdt-cswcw)
  - Welp, that didn't work
- [K3OS Alternatives in an Emergency](fb5em-axq0j-gg9dk-yexae-y4a4h)
- [More Flexible Definitions for Longhorn-Friendly Volumes](gz4n8-e9vrw-478rc-8smp0-5hk08)
