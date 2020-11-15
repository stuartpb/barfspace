# Label format for "self-mounting drives"

I was thinking `NODE_STORAGE` or `LONGHORN_DISK`, but after a while I thought "What's the purpose of this label and I was like "well, to mount the disk by UUID", and so I was like "well why not `MOUNT_BY_UUID` then" and I was like "well because I want to signal to the OS clearly that this disk should be mounted by UUID, but I don't want to explicitly make a note of that property specifically"

Anyway, after much deliberation, I've decided that the condition that makes most sense for automounting a disk in this system is to **have the partition's label be the same as its UUID**.

One reason I'd shied away from this was because FAT has a bunch of restrictions I generally try to adhere to in label specs, but:

- FAT also doesn't support full UUIDs, either
  - it just uses 32-bit IDs, which the kernel exposes as its "UUID"
  - As such, FAT disk labels can still match their UUID
- Picking "same as the UUID display" means I don't have to pick between kebab-case and SCREAMING_SNAKE_CASE
- In the event that something in the system *does* need to work with unique labels, it will still work normally
- This is uncommon enough
- Longhorn requires the filesystem to support extents: in the event that some exension were written to support FAT, we'd also have

## WAIT HERP DERP THE MAXIMUM LENGTH OF A LABEL IS STILL 16 BYTES ON EXT4

You know, the [GPT label](https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_entries_(LBA_2%E2%80%9333)) is long enough to fit the UUID... what if this were based on PARTUUID?

Actually, fuck it, if we're looking at GPT-level fuckery we might as well use a custom partition type a la https://www.freedesktop.org/wiki/Specifications/DiscoverablePartitionsSpec/

I'll go ahead and let the label be territory for whatever system handles disk provisioning them; personally, I'm planning on leaving it blank as possible. (But using the label to identify the provisioning responsibility is not a bad idea - maybe even timestamp it!)

label may also be needed to identify a key to unlock encrypted volumes

## more about GPT labels

https://superuser.com/questions/1099232/what-is-the-difference-between-a-partition-name-and-a-partition-label/1099292

## open question I had researching this

What's the deal with `UUID_SUB`? Googling it doesn't yield answers

## so anyway

work on this continues into forward files
