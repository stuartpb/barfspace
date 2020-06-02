# A top-level model for the Clusterhood infrastructure

The bare metal (ie. Packet) server should run pet VM instances, but how to manage those?

Cockpit seems like a good "minimum feature" - their Running list has some good suggestions:

https://cockpit-project.org/running.html

- I think Fedora CoreOS could be cool on bare metal as maybe a second machine? But one machine (Sybil?) should be split into VMs
  - https://getfedora.org/en/coreos?stream=stable
  - https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/
  - This and Clear Linux are a couple I'm looking at for replacing k3s on studtop, actually
    - https://docs.fedoraproject.org/en-US/fedora-coreos/fcct-config/ sounds not unlike k3os's config
    - And then I guess you'd use podman to run kubelet, flannel, and the rest of the core Kubernetes components?
      - And you could use systemd to handle, like, mounts via udev
        - and mDNS via systemd-resolved and all that other crap I'm struggling with for k3os!
    - as a k3os alternative that could run on the Pi, though:
      - https://github.com/coreos/fedora-coreos-tracker/issues/258
      - https://ask.fedoraproject.org/t/fedora-coreos-in-raspberry-pi/5326
- Clear Linux seems interesting?
  - Might be the best possible easy-updating base for a lightweight k3os competitor?
    - I get the feeling there's no ARM version of Intel's distro, though
  - Clear Linux has an automatic bundle to install kubernetes and helm
- Coming installed by default on Fedora Server sounds easiest, actually
- Might try it out on my local Arch systems for kicks

## Cockpit sounds REALLY cool

this might just turn into a Cockpit Discovery Page

- https://cockpit-project.org/blog/cockpit-starter-kit.html
- this [PatternFly](http://www.patternfly.org/) style is a nice cool open-source Material

Oh okay Cockpit is DEFINITELY going to be the basis for printacle
