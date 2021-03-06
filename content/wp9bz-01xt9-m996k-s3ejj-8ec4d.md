# More Space for Studtop

I'm worried I'm gonna run out of space on studtop:

```
Filesystem                                              1K-blocks     Used  Available Use% Mounted on
/dev/mmcblk0p2                                           15112012 12537952    1790756  88% /
```

I'm also worried about RAM, [but there's nothing I can do about that](7x38j-xw4v1-gn970-a0hz3-wdbdb)

After much bouncing around (looking at `df`, then working backwards from those mounts' location, plus some Googling), I've concluded that the root for pod images (which I'd expect to take up the bulk of this "state", if all the other big data is in PersistentVolumes) is under `/var/lib/rancher/k3s/agent/containerd/`, so that's the directory I'm gonna mount on a 64GB USB 3.0 flash drive I just bought.

Or maybe I figured this out from `du`: here's [a du dump from studtop](sy4dy-yx4mv-0t99f-zq4ff-f9bg9)

## starting 2020-06-05

Following the "Expand storage for images/containers" list from [the sprint](0ybvg-vc5qr-wv8pq-y58xr-2da4r)

## Make ext4 filesystem on new flash drive

Doing `lsblk` to find the flash drive

Could do some `lsusb` stuff to disambiguate it if I had another ambiguous drive, but I settled for just unplugging the one I don't currently have a distinct plan to use

`sudo fdisk /dev/sdb`

`g`, we're gonna blow away the MBR layout to make this a proper GPT disk

`n` and all the defaults to provision a new Linux partition all over it

## trying to understand what this dir "is" to containerd

`/var/lib/rancher/k3s/agent/etc/containerd/config.toml` specifies this location like so:

```toml
[plugins.opt]
  path = "/var/lib/rancher/k3s/agent/containerd"
```

[the PLUGINS documentation](https://github.com/containerd/containerd/blob/master/PLUGINS.md) doesn't tell me much, so I search for "plugins.opt" across the repo

https://github.com/containerd/containerd/blob/257a7498d00827fbca08078f664cc6b4be27d7aa/docs/managed-opt.md

so I guess it's the "opt" directory (which would default to `/opt/containerd` normally), which it seems is primarily used by "containerd v2"?

## side opinion I'm developing around container runtimes

split out to [My take on containerd (as used by k3os) vs CRI-O](m66bh-g9ytc-cg9e3-9tskj-h6ved)

## anyway, the partition table

I don't think I'll do anything fancy with the UUID, special bits, or GPT label

Let's go ahead and `w`

## another thing I notice

[containerd lists having overlay support](https://github.com/containerd/containerd#root-filesystems), why can't I have an ability to make overlay PVCs on Kubernetes

## anyway, formatting

Reading the man page, I see that `mkfs.ext4` can copy a directory on initialization:

```
       -d root-directory
              Copy the contents of the given directory into the root directory of the filesystem.
```

Looking at this a little more, I start really thinking "how can I do this transition as smoothly as possible", so I start doing a little more research before I go ahead and try running our formatting command

## what about copying the containerd opt root and mounting over it

Was originally thinking I'd copy the contents via [rsync](https://unix.stackexchange.com/a/392545/7733)

After taking everything I mentioned wanting to look up above into account, I decided to go with [The Plan for Introducing the containerd-opt Flash Drive](s3e2q-qae76-rq8hh-ew3mm-m2ncq)

## the thing is, though

I'm tired, and it's bedtime, and I'm fairly confident this is going to break at least the currently running pods, so I'm going to go ahead and commit everything that's in this workspace, then push it and go to bed.
