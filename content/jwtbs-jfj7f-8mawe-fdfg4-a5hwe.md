# Longhorn Logical Volume Model

So, you'd have it so disks are formatted to have a Logical Volume Header or whatever you call it that says "add me to this pool on the node"

And can you provision LV to say "provide enough space that, at any time, one drive could be removed and rebalanced to the other nodes"? And you can have a state of "can't provision any more space / over capacity" or something like that until a replacement disk has been added to rebalance

Or maybe even some other redundancy

## How you'd probably want to structure this

Probably "mount this drive to the system that controls Logical Volume Mounting"

- And then that system could figure out mounts into virtual nodes, if going with a top-level-hypervisor model
  - so you could have some LVM property that signals "this is the root/boot/EFI/whatever volume for a disk for this node"
  - I don't think one puts different GPT UUIDs on LVM volumes?
    - But if one did, "node disk data" would potentially be one of them

## hub model

(and I've written about this before around the general CubiePet Hardware notes)

Aww yeah, what if you have the "storage banks" be labeled as ports on a hub, so you can daisy-chain hubs to make a larger "storage bank", and reallocate by moving drives from one set of ports to another?

## Clusterhood models

oh snap, you could do this for a communal system by having each drive, like, in someone's locker, and they open it up to adjust their storage capacity, and each user is a different "storage class"

Oh damn, that's how you could do it, a "Kickstarter goal" to raise money for each node, and then every backer who helped provision that node is homed to it initially (and can get access to other nodes)

Users are liable to be re-homed at any time

And then you have one "disk" per "class"

## oh fuck, though

Would LVM allow for write balancing? That would certainly ameliorate [disks on the fast USB3 bus having extremely slow writes](pgw74-d17nf-rfbt9-fgvcz-yyx8j), if you could spread the write across six disks at once

A thought I have here is "if giving the advice to buy lots of small drives instead of big ones, you'd definitely want to put a date on that documentation since the state of hardware is absolutely liable to change

## ooh, though

Did LVM's structure participate in the extremely slow performance of the disk when I tried to run OpenSUSE off of it, like it kept seeking and voiding the cache to write to two different "logical partitions"?

but I guess that would also happen if the disk was two proper GPT "partitions" with the same access pattern - on a flash drive, they're all effectively "logical", right?

bottom line here is that, on a slow USB drive or whatever, it's best to have the partition *span drives* than to have a drive *span partitions*, unless one of those partitions is very much read-once/write-maybe-once (ie metadata) and won't hop around from the sectors in regular access

## in any case

you'd want some way to be able to say "mount this disk with ssd optimizations", like with btrfs

## REALLY good Clusterhood model

Okay, so the idea is, you'd have users bring their nodes to the cluster, and they could opt their node (and it's resources) into the pool for various projects

The project would have to consent as well, though, unless the node's owner is recognized as a Core Operator (ie. someone who has trunk commit access already - think of the game developer for a game)

I feel like this'd be REALLY neat for spreading out a Hubs installation (though, like, ultimately you'd need some edge servers doing most of the work since you can't have residential service hosting traffic for several Hubs participants - but they could handle Reticulum storage?)
