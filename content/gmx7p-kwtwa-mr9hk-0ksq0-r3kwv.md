# Preliminary Notes

Okay, so, having had Studtop fall apart after trying to roll out OpenEBS a few times now, I've gone back to the drawing board.

My new plan:

- Remake Studtop (again) using a keypair for root that will be kept on the Ignition disk.
  - Studtop itself will not be set up for ignition at this time.
  - openiscsid and e2fsrogs will NOT be installed.
  - run `kubeadm init` and note down the join info, and copy theconfig stuff appropriately
  - DON'T untaint the master node
    - we will actually leave studtop as a dedicated manager
- Flash router with OpenWRT and port all the DHCP assignments over (and add hostname suggestions?)
  - This might still have to wait a bit
- Add Pi 4 as `studrang`
  - possibly companion to a future `sturmund`
    - which might be the Rpi3A that replaces the 0 in Stuworks
    - or might just be a twin unit
      - in which case the one in the printer is called what?
        - stuphaestus
          - stufesto might be cool tho
            - oh dang, hephaestus might not be a bad alternative branding to printacle
  - Add label `st8s.stuartpb.com/storage-cluster=rook-ceph` or something like that
    - this will be the selector for "every unpartitioned disk plugged into this will be Borged into this system of cluster storage"
    - so like, another label might be devised to dedicate a node to devices for a non-Rook-Ceph storage solution
        - but I'm cool thinking of it at a node level
          - it just says what kind of storage the node has on it - not that the node's a dedicated storage node
- plug the HDD, unpartitioned PNY, and Ignition stick (with proper hostname to set up) into the Pi

## Why Ditch OpenEBS for Rook?

I wanted to do Rook in the first place, but I couldn't figure out where to start (maybe because I couldn't understand operators initially, idk). There are old notes about this

I didn't quite get it? but now I do, I get Rook, and furthermore, I get how lots of apps are going to want Buckets, and how smooth Rook configuring Ceph from Kubernetes (and potentially other things than Ceph, though Ceph looks best) will make having that (over EBS which really was very low-level)

Kubic comes with what looks like all Rook's example manifests pre-installed and presumably converted for openSUSE-backed images (though ofc I'm going with the stubernetes-system approach), so it's well-vetted and supported for Kubic. Meanwhile, not only is running open-iscsid at the host level not very Kubic, the installer explicitly reminds me that it's "unsupported" (though, like, so is Wicked).

Rook has documentation shortcomings, but it's built on an old and well-contributed to base tech (ie Ceph), and not three-new-drivers-we-each-made-just-for-this like OpenEBS

## Why bring in the Pi now?

Honestly:

- it's more powerful (quad-core, right?)
- I want storage, and I trust its firmware USB3 handling better
- I saw just how ugly things get when the coordinator is not on a dedicated node
- stuff can get moved to the Chromebook as needed
  - like, I'll probably add tolerations to most system services
    - this does suggest I might *change* its toleration to not be like "master-node"
    - I might even just remove that taint, but only after getting the two-node cluster going

## stuff I verified first

- Ceph has a concept of device class that matches what we want pretty directly
- Ceph works on ARM
