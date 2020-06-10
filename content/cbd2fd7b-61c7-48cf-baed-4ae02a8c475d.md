# Possible Studtop v3 Model

These were some expanded ideas on how Stubernetes could be factored within one machine while exploring [K3OS Alternatives in an Emergency](7acaea2b-b704-4a10-96cf-ceea9de22871.md)

Note these also make sense for a CNCF testbed, which is probably where I'd work out what platform I'd want to base this on

## Broad strokes

I'm thinking that the core system (ie. the 16GB on-disk) will be a hypervisor, and attached disks will represent "nodes" to run as OS environments

this abstraction also has me thinking about [More Flexible Definitions for Longhorn-Friendly Volumes](87c95439-3bc7-4047-8c31-19a58058cbe8.md)

## a model for Mounting

Since you can't put a label on a disk, I think the thing to sniff if inserted media is "auto-bootable" is to set up some kind of shim for the system on its ESP (like a config file)

Also, maybe a "disk image" partition type? Is that already a thing? Noticable perf hit?

## stuff I didn't list

- [Weave Ignite](https://ignite.readthedocs.io/en/stable/installation/)
  - https://github.com/weaveworks/ignite/blob/master/docs/installation.md
  - https://ignite.readthedocs.io/en/stable/gitops/
