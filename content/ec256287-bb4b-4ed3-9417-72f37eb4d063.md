# Deeper Rancher mounting idea

What if you just set the UUID of the document defining the storage class as the drive's type? And that document could match

Like, when the disk is mounted, udev checks if it's for a Longhorn storage class, and if it is, we mount it (by a rule that can be defined in the storage class), then optionally configure it in Longhorn if we don't already know the disk

Okay, yeah, actually this is making a TON of sense.

And oh snap, now I get why kubectl is packaged into the system

So, like, you could insert this into Longhorn's namespace, right? As a privileged service or something?

## the big impediment I'm seeing here

if I get the notification for these mounts on startup, I need to wait until the cluster is ready enough that I can see if I have documents for their storage class

## another reason to not get too clever with all this just yet

I'm still not sure I understand Longhorn's model

Also, you know what though, disks have metadata beyond being appropriate for one storage class or another - what we really want is a constructor that...

yes all right okay here's how it works. we have some kind of resource type that's DiskPartitionClass, and this is what the GPT partition type references. That class contains a template which specifies the information on how to mount such a disk (by partition UUID under /run/media, by default)

or, actually... maaaybe we allow individual disks to override mount options, but by default it's done by the storage class? I think what'd be most performant would actually be to work by the storage class, and, like, don't go requiring special mount settings for individual disks. give the disk its own class that produces a disk

yeah, like, is this a thing in Longhorn

## what to call this extension into the Longhorn ecosystem

steakhouse. definitely steakhouse

## thinking about this a little more

nah, blocking on etcd for mounting is a recipe for trouble.

let disk provisioning happen by some kind of autodiscovery file down the line or something

all the disk classes for this level of design - at least, at the level I want to design at right now, maybe Steakhouse 2.0 can reconsider - the only GPT partition types will be "automount by outside-partition UUID", "automount by inside-partition UUID", and variants that mount as specific filesystem types (not yet specified).

and we can let all that "fast" and "slow" sniffing happen on setting up a new disk for the partition that was just inserted. maybe we can even have a rule for "add affinity labels based on the partition label" where that could even be the part that specifies a UUID of a template document
