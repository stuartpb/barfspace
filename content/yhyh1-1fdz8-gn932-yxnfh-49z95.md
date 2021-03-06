# June 21, 2020 In Review: The Current and Future Stubernetes Plans

Coming from [The Sudoer Provisioner Model](m1mqn-55efg-r1baq-b89qy-41cwe)

## recap

After my Kubic installation went into a tailspin, I started plotting a [rabbit path](b3ntz-v91vx-pt9ry-qzj7t-hy1rr)

However, I started thinking about how I'd want to structure that recap, and drifted into [Chartifying the Stubernetes System Core](s1ge3-e429y-gjbpw-rbb2e-tk50q)

I've learned so much since then, though, and I have a much clearer view of how I'm going to approach this.

I've been thinking about I want to structure the new studtop (which I'm sticking with over "studhood" for now tbh) all day

## overall structural overview

- I've decided that I'm going to set up a plain sudoer user for myself via Ignition (also writing /etc/sudoers),
  - then use that to log in / apply the initial package installation / install the core Helm chart,
    - which I'm going to implement as a series of scripts.
  - All the code to facilitate these steps will live in the stubernetes-setup repo
- stubernetes-core then will be the Helm chart that needs to be installed via Helm,
    - which holds the the two core pieces for thi
      - (which might be further genericized and reintroduced under another name at some point if ever packaging/shipping this as a kit).
- The rest of the system is stored in HelmRelease manifests
  - The parts that set up the "core system" (eg. OpenEBS, household-dns, potentially Ingress controllers...) maintained in the stubernetes-system repository
    - Argo CD / Dex / Pomerium can come later
  - further projects, like the Notestack, might implement their own release structure,
    - maybe using a common Argo CD integrated as part of stubernetes-system later
  - After an Argo CD is implemented, these "Helm Release manifest repos" might get run through some kind of CI rollout for changes
    - but that'll probably require some further degree of bootstrapping (ie. OpenEBS needing to exist first)
    - the setup scripts that install the core, which installs the system, are a solid enough base for me, for now.

## thoughts on a better setup design

- might upgrade the setup scripts
  - even just a one-shot
    - one that could maybe be even snuck in at the boot command line somehow?
    - has to go across at least one reboot
    - a real simple way I was thinking you could do this
      - using just Ignition to execute
        - ie. you'd have this tool to build, then it "runs" for any Ignition-compatible system
      - would be to include the phase scripts in some kind of systemd unit
        - [as suggested here](https://github.com/coreos/ignition/issues/909#issuecomment-576057197)
        - where it adds a script that tests what state it's in at each boot
        - and (if you choose) removes itself after everything's done
          - you can also have it clean up manually

## side thought on Ignition's design

- I guess Ignition was built to have these kinds of things overlayed on top of it?
  - or like also, to have them baked in at the image layer
    - which is a whole other angle to consider if I decide to start rolling this out more widely
      - bottom line, it just changes the image the system would ship with to replace these stubernetes-setup components
        - stubernetes-core and everything else would not be affected
  - But yeah, I'm starting to think this is a decent way to do it
    - make sure the kubeadm cluster-joining tokens/certs or whatever backed up / specifiable in the ignition somehow
      - ie. that'd make this real simple to "reinstall from scratch":
        - bootstraps dependencies from the easily-available base image, then rejoins the cluster

## integrating the one-shot setup service into a deployment system?

- Arges?
- Terraform?
  - If I start looking at Terraform I think I ought to take a look at [Typhoon](https://typhoon.psdn.io/)
    - Though actually, what I'm really interested in is [Lokomotive](https://github.com/kinvolk/lokomotive/blob/master/docs/quickstarts/baremetal.md)
  - Feels like Typhoon is to Terraform what Talos is to Arges (except other stuff uses Terraform)
  - Or rather, [is Typhoon just a Terraform configuration applied via Ignition?](https://github.com/coreos/container-linux-update-operator/issues/177)
- [Ansible?](https://github.com/cgwalters/ansible-personal)

## Understanding deployment systems

- How does this (Ignition + other scripts) compare to...
  - cloud-init?
    - Both of these are targets for Terraform
    - I feel like Ignition might be simplified so it's less redundant when you're using a layer like Terraform over it
    - Like, it really seems like ignition was written as a reaction to cloud-init to make it more streamlined
      - the issue about "No boot scripts" noted "yeah, because cloud-init had them and they sucked"

## see also

[Bare-metal-level (eg. iPXE) orchestration](b87en-3a642-j99q6-9fq3w-q7xr7)
