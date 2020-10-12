# Ska Linux is

## Simple

Like Manjaro Linux or Void Linux, Ska Linux is based on the Arch Linux distribution. It has as few distro-specific "quirks" as possible, and aims to maximize compatibility with an many mainstream projects as possible.

On top of Arch's rolling-release system that guarantees every part of the system is always kept as up-to-date as possible, Ska Linux uses snapper to ensure that updates are atomic, per-boot, and easily reversible.

## Kubernetes-ready

Ska Linux ships with everything you need to start up a Kubernetes cluster in one command using `kubeadm init`.

It is also one of the first distributions to use the lightweight Kubernetes-tailored CRI-O runtime by default, rather than the legacy Docker system.

Its automated, transactional-snapshot-based updates serve to keep your cluster's nodes performant and secure, with major packages (such as Kubernetes components) pinned so they can be updated on *your* schedule.

## Architecture-independent

Ska Linux provides builds for both x86-64 and AARM64 processor architectures, so you can install it to any combination of traditional PC-compatible hardware and smaller, cheaper systems-on-a-chip like the Raspberry Pi.
