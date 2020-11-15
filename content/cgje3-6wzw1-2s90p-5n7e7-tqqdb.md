# From the Top with Studtop, 2020-06-26

plugged in the stick with the Ignition definition on it

added my stushiba SSH key for Root in the installer (curl to /tmp/stushiba.pub) just in case it doesn't read the ignition config

using defaults in the installer, mostly: deleting the old partitions and remaking them the exact same way, etc.

installer offers to reuse the old installation's SSH setup (so I don't have to rewrite authorized_keys again)

added packages for open-iscsi and e2fsprogs in the installer, so I can skip that step

## first boot

looks like Ignition didn't fire. consulting [the docs](https://en.opensuse.org/Portal:MicroOS/Ignition#Installation), I guess if I wanted that I'd have to have added `ignition-dracut` as an installation package as well

anyway, hmm... I'm thinking I'll go ahead and... I'll install that, but not use the Ignition stick I prepped

I've decided that, fuck it, since I have both the need and the means, I'm just gonna add an A record for `studtop.403.stuartpb.com` to CloudFlare and let that be the host resolution mechanism

I decided that, since this block is going to be published like this and potentially extended out to the Internet via something like a VPN, I'm gonna move "zone 403 node" addresses to 192.168.86.x. DHCP reservation changed accordingly

Now, ideally, I'd have that hostname be provided over DHCP (and probably the hostname record, too, so it would only have to be made available through the internal network)

## oh right, another thing

I wrote about the "mDNS for a hostname zone" thing, right?

So, thinking about this a little more, that's interesting and all, but the "local clients" are gonna be of a different namespace, I think. This might be `local.403.stuartpb.com` (and it could serve addresses when connected internally, and even an opt-in reverse proxy for public exposure)

Actually, that's an interesting point: I think I'll go ahead and change the name to `studtop.nodes.403.stuartpb.com`

so `nodes.403.stuartpb.com` is the part of zone 403 that explicitly handles Stubernetes

and this'll be handled, rather than via a per-device mDNS namespace (which is still an interesting idea), by whatever party handles DHCP and hostnames (I'm looking into flashing my router to OpenWRT to support this now)

stuff like the "other zones" of Stubernetes will have their own namespace, but I'm okay officially integrating this into stuartpb.com, because if I'm building something for non-personal use it shouldn't be based on my own hardware (and that's one of the cool things about this model - I can deprovision a disk, plug it into a new Raspberry Pi, and then move any sufficiently-popular site to its own cluster)

anyway, for now, I'm just gonna `hostnamectl set-hostname studtop.nodes.403.stuartpb.com`

## on having a user

I think I'll just go ahead and not do that at the moment.

I'm thinking that how I'll probably do studtop - and even the Raspberry Pi - is, instead of setting up my own user, I'll reboot with an Ignition stick that sets my GitHub keys for the root user, and when I'm done I just deauthorize the keys and the machine is back to being a black box.

- the Ignition stick might even set up a systemd unit to remove the keys afterward
  - possibly even as a `/run` unit
    - but that means, if they aren't removed by a successful shutdown, they'd stick...
    - well, they'd stick if the machine isn't booted from Ignition again.
      - I'm okay with the idea that Ignition needs to set up the deprovisioning
    - but a self-removing unit in /etc/ would be better

(or even setting up a temporary hook to check against my GitHub keys to log in)

anyway, I'm gonna stick with just having stushiba be authorized for the moment, and then later I'll try installing the ignition hook and seeing if that works, and if not I'll either set up a user or add my GitHub keys to root manually

## reconnecting

unplugged and reinserted the Ethernet adapter to refresh the DHCP reservation

ohh, derp... just realized I forgot something very important: more than `curl https://github.com/stuartpb.keys > .ssh/authorized_keys` (which I figure, what the heck, I'll do now that I have it right there on my clipboard): `nano /etc/systemd/logind.conf` and set the `HandleLidSwitch` stuff to `ignore` again

I've copied this into my stubernetes-setup

## Side thought about how I'm working ignition here

It might make sense to have file embedding be a switchable option, and by default it just links to the GitHub Pages / raw path for resources like /etc/systemd/login.conf

Might also have "do you want to set up the Appropriate Sudoers Configuration"

It should really do this anyway - even though root's password's disabled, it'd still be cool to clear that value in sudoers that lets anybody who knows root's password use sudo

but the option would be if the user wants to use the version that gives access to sudo/wheel or not

## anyway, let's get going with this

`systemctl enable --now iscsid`

and away we go. `kubeadm init` as I realize I didn't really finish writing the stubernetes-core part

## maybe I should add this to the "hypothetical boot" script

I think I forgot to review the first [Installing Kubic on Studtop](apqev-my4ak-mzbtq-09rsa-dcac5) page when putting this stuff together:

`mkdir -p ~/.kube` and `cp -i /etc/kubernetes/admin.conf ~/.kube/config` and replacing the relevant fields in my kubeconfig on Stushiba

## next steps

- So we could have our CNI: [Finishing stubernetes-core](zcn6r-trw22-cxadd-p0egj-dswrt)
- [Taking the Helm Operator for a Spin](0kz44-6z2tt-h08q4-qj7w2-7b3cr)
- [Remaking Studtop Again](21xwq-jt2vh-7g9ys-2bbac-bmtrs)
