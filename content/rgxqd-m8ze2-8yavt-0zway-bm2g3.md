# State of Storage on Stubernetes / Studtop

Persistent volumes are handled by Longhorn. Here was [the "decision process" that led to Longhorn](8dcx7-dgrbc-6k8y0-34s3r-v9d88)

They're provided by specially-partitioned disks that are outmounted on the host. [Here was the series of deliberations around that](rrbt0-pg479-mp89h-4tb3b-0z4aw), as well as brainstorming for some possible extensions to this storage model in the future, once I've gotten a little more comfortable with PVCs / understanding Longhorn.
