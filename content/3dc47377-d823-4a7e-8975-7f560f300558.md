# Off into the woods with Firecracker

https://firecracker-microvm.github.io/ kicks off a world of Unikernel projects I'd never heard of

## unikernels

http://unikernel.org/projects/

https://github.com/cetic/unikernels

- https://github.com/solo-io/unik
  - https://github.com/solo-io/unik#supported-unikernel-types was the bit I was looking for

the things this gets me most curious about are rumprun and osv

## Provisioning

- https://github.com/weaveworks/ignite
  - NOT to be confused with CoreOS Ignition
    - Ignition works INSIDE a system, Ignite goes AROUND it
  - Ignite seems kind of like "whatever podman or whatever uses, but for VMs in Firecracker"
  - Seems like it might not be a bad idea for a Container-OS-system-image solution?
    - Also, though, [Talos Arges](https://www.talos.dev/docs/v0.5/en/guides/metal/arges)

