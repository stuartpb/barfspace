# Crystal Gem Cluster Iteration

After seeing the [First Real Cluster](az0vm-dh75w-g8b2b-qt5rb-4e66q) iteration fail with studtop's master node overwhelmed, I realized: I should actually use a *Pi* for the master node, since a Pi actually has *more core* than the Chromebook - the Chromebook node should actually be reserved primarily for workloads that need to be x86.

After ordering another Raspberry Pi 4 to balance things out, here's the layout I'm planning now:

- sturl, a Raspberry Pi 3B with the Google AIY Voice Hat, which will be used as the master node
  - this was originally gonna be "stupearl" but I decided to make it so they all match
    - it's the name of the node that provides the "url" for the cluster API so I guess I'm cool with it
    - I'm not 100% sure I even want to keep the stu- prefix for nodes in this cluster going forward?
- stuby, the first Raspberry Pi 4B, with two fans, a hybrid heatsink/case, and a hard drive
  - I anticipate this being the Prometheus node
- stuphire, the second Raspberry Pi 4B, with one 40mm fan, a backup battery, and a few flash drives
  - I anticipate this being where workspaces run on Pi
- stumethyst, formerly studtop, the Chromebook
  - for jobs that just won't run on ARM just yet

## Process

- I'll still need to set up DHCP for the Ethernet interfaces?
  - This'll be a job for the HDMI screen I guess
  - Also need to change the existing DHCPs (ie. studtop)
  - Maybe give the nodes FQDN hostnames?
  - Configure the host to only set hostname from DHCPv6?
- I'll need to flash the latest kubeadm Kubic to both 128GB MicroSDs for the Pi 4s and the 64GB for the Pi 3 (sturl)
- For stumethyst, the MicroSD can be flashed by booting into the install media, which can be loaded into the onboard storage

## basically that stuff I just said, but backwards and shorter

- review how I set up the Pi last time
- see if I can make it work better this time
- look for remaining couple ethernet cables
- plug stuphire into usb charger when it gets here
- reload install image to local disk for stumethyst
- flash new image to 128g microsd for stuphire
- reflash existing 128g microsd in stuby
- flash 64gb microsd (sandisk or netac, whatever's handy) for stupearl
- finesse dhcp reservations ([Investigating the DHCP thing](985hb-x1e5v-cwb2m-vrhr8-c2590))

## actual setup proc

- kubeadm init on stupearl
- kubeadm join from stuby/stuphire/stumethyst

## Next steps

- sturmund and studrang for 3D printer and Felfil?
  - flash iPXE image to SD cards?
    - have them boot from Talos / Arges / whatever from rump kernels or whatever
  - could also just call the printer one "stuball" lol

## rollout

[2020-08-10 Kluster Rollout](7cxyj-mc2rk-jh88q-tx2nw-t8c2b)
