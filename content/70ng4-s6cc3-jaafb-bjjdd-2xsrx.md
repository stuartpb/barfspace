# Steakhouse v0.1 Model

Disks use a custom "Steakhouse Disk" GUID in the GPT

We have 16 bits to control the disk's behavior:

## Bits

One bit should be for "automount this under `/run/media`"

Another bit for "read mount options from cluster"

(These might be the same bit: automount by default, "custom mounting" by a variable)

Another bit for automatically provisioning the volume

I don't know if autoprovisioning strictly needs to have a bit - it could be determined by the presence of the automount file (see below)

## Automounting behavior

Mounts to the partition's (filesystem) UUID under `/media`

### /run/media vs /media

Putting it under `/run` means that we don't have to worry about cleaning up mountpoints

However, `/run/media` has a precedent for having a user level in window managers (not that that particularly matters)

Anyway, udev should kind of handle the mountpoints thing

I'm also thinking about `/run/disks`, or even just `/disks`

## better understanding of /media vs /run/media

(this should get copied back to StackOverflow's questions asking about this, it's a better answer than what's there)

http://storaged.org/doc/udisks2-api/latest/udisks.8.html notes that udisks2

maybe instead of "steakhouse" this could be called "uud2": Micro udisks2 (uud) Using Udev (uud)

maybe even add another level: "Under UUID Directories"

## Provisioning behavior

Looks for something like `.steakhouse/template.yaml` at the root

YAML can list stuff like disk tags

can override the default ID/UUID (filesystem UUID)

can maybe even specify a template resource to read from the cluster
