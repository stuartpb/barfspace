# 2020-08-15 Setup in Earnest

Okay, so, after a little more experimentation and exploration, I've got a new plan in mind that should allow the cluster to be usable:

- Flash new current Kubic install media on stumethyst
  - the recent-release thing matters because Kubic just announced that /tmp is no longer created persistently
  - older releases will need surgery to match thiss change
- Reinstall the way we've been installing
  - Set hostname as stumethyst.403.testtrack4.com in setup?
    - or via `hostnamectl set-hostname` if not
  - Turn DHCP_SET_HOSTNAME *off* before continuing to kubeadm step
    - the default setup sending the hostname is fine
      - it's the hostname coming back with the FQDN stripped that's the trouble.
      - Any benefit that could come from leaving this enabled would require a rearchitecture of the name system anyway

I've abandoned the DHCP reservation side of this, but that's largely because the DNS works well enough that I don't need to reserve specific IPs (and the hashing system means I don't need to bother with IP numbering schemes to prevent the address jumping in reconfiguration)

After stumethyst is set up and reachable via `hostname -f`, I'll go on to flash the most recent Raspberry Pi image, and if it doesn't boot I'll retrace steps from the image I used last time.

first, I'll try getting stuby up, then stuphire, then finally sturl (which may encounter different issues on account of being a different system).

once sturl is up, I'll `kubeadm init`

once this is online, that'll probably be it for the day, and then I'll tackle trying to bring the stubernetes stack back up

or really, I guess I kind of have to at least do the Weave step before the joins? hm...

so I guess "phase 1" is really just "get them all booting and reachable"

## executing

ran into a little trouble - ought to have put my SSH key on a flash drive, because setup is weird without it.

SSHed in from stuzzy (the SSH key I configured for setup) to `curl https://github.com/stuartpb.keys > .ssh/authorized_keys`

imaging Build 88 onto stuby's card

following the strategy from when I was flashing the previous iteration of stuby:

```
sudo mount /dev/sde2 -o noatime,subvol=@/root /mnt
sudo mkdir -p /mnt/.ssh
sudo bash -c 'curl https://github.com/stuartpb.keys > /mnt/.ssh/authorized_keys'
sudo chmod 0600 /mnt/.ssh/authorized_keys
sudo umount /mnt
```

Looking at this a little more... oof... looks like I'll be going with the Ignition key to set the initial hostname (and then I'll just have to kill DHCP-set-hostnames manually).

## back to stumethyst, actually

Even though I set "set hostname via DHCP" to "no" in setup, it's still configured to set the hostname from DHCP, and it has done this.

I'm going ahead and spitting the content I want to patch into a file in setup, and I'm going to go ahead and push this patch manually on stumethyst; the other nodes should

wait, DCHP is set to "no" by default on the Pi images

aaargh. I do more exploration on this: see [Investigating the DHCP thing](985hb-x1e5v-cwb2m-vrhr8-c2590) for conclusions

## anyway, all 4 set up

I went through some hassle after I forgot to add the root keys to 2 of the Pi installations (had to do `umount /dev/sde2` twice before removing the card or it would just unmount the GNOME mount), but build 88 in general went off without a hitch (some nodes took a minute to start up).

## the plan now

my plan is to make sure `sturl.403.testtrack4.com` is the transient hostname, then run `kubectl init` and copy the config stuff to my dev machines.

then, from stushiba, `kubectl create ns stubernetes-system` and (from the stubernetes-core work tree) `helm install -n stubernetes-system stubernetes-core .`

then that should set up the other three nodes to join via `kubeadm join` paste

## executing

ensuring all 4 hosts are set to the fqdns

running kubeadm init on sturl

taking its advice, running `kubeadm config images pull` on the other 3

## hitch on rolling out the core

there's a weird error about the CRD: looks like it's saying it installed OK?

oof... the API requests are timing out.

okay, after a while the node picks back up... I reboot it anyway

In this clear period, I can roll out the helm chart just fine

Okay, it looks like I'm just waiting on the images for weave-net to download

ohhh... would these be smaller if I were using the OpenSuSE-provided images? I am, aren't I?

Oof, okay, looking at `kubectl describe pods -n kube-system`, I see that 2.6.4 might be too old?

herp derp, made a few tweaks in the base chart (basically just number bumps) and pushed

a couple of the pods were stuck Terminating so I went `kubectl delete pod -n kube-system (the IDs of the two pods) --grace-period=0 --force` since, like, we've established the images aren't going to show up. it's seriously kind of weird this doesn't happen by default

the daemonset seems to have run into a problem trying to create one of the pods, and now it doesn't notice that those pods need to be remade

anyway, screw it, let me just uninstall the release and go again

## you know what?

after a few rounds of this, I decided I needed a higher class of microSD card, and re-imaged sturl on a new card. went through all the root ssh steps and the ignition stick (even though, really, this should just be on the ignition stick).

On the other machines, I did a `kubeadm reset`, then a reboot and another `kubeadm reset`.

[Gotta Try Again](df68y-tvetk-ae8xh-4chhe-1920s)
