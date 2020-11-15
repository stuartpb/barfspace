# Chartifying the Stubernetes System Core

- I'm going to make "stubernetes-setup" into a "stubernetes-system" repo containing a Helm chart
  - with subcharts for the core components of the system,
    - weave net
      - will make an in-repo subchart for this based on `/usr/share/k8s-yaml/weave/weave.yaml`
      - in terms of extensibility through values, will include room to add the `NO_MASQ_LOCAL` variable at least
      - what's the standard way to set values like image name?
        - thinking I might specify the OpenSUSE ones in the subchart but override them with upstream at the top level
    - OpenEBS
    - Kubernetes Dashboard
    - household-system / household-dns
      - I guess this'll be a subchart that itself calls out to 3 different subcharts
      - Let's let the namespace be "household-dns"
      - if we introduce other components later, they can be via Argo in other namespaces
        - heck, arguably *this* should be Argo
        - I suppose I can experiment with lighter-weight replacementsvia Argo
          - and if I ever migrate, I can abandon / delete this chart, and leave it in a stump ref
    - Flux CD, set up to sync / update this chart itself
      - this includes the Helm Operator as such
    - Prometheus Operator
      - potentially Loki and/or logging-operator soon after
      - Might move this to the Argo Layer if metrics / logging weren't critical to the system's operation
        - Grafana arguably should be moved out though
        - Kinda same goes for the Dashboard too, though
    - Argo CD, to bootstrap futher "layers"
    - Dex
      - (part of the Argo CD chart, at least at first)
      - for securing Argo, Grafana/Prometheus, and Dashboard
    - Soon:
      - Pomerium
    - at some point, probably:
      - cert-manager
      - houaehold-ingress Traefik
  - and templates for the few new resources
    - by which I mean
      - the household-dns services, if we can have those separate from the NodePort one
      - the OpenEBS storage definitions
      - does Flux need a HelmRelease added?
    - these will be structured to read from values as appropriate
      - ie. the openebs values can come from some "less abstract" values source that will be overlayed over this from my local machine
      - maybe we do it as "work-pool-disks" or something straightforward like that,
        - so the "classes of disk" are still defined as part of the chart, and only the installation-specific parameters are kept outside it
          - iow we want as little strcture to be hidden behind the shadow curtain as possible
  - It'll include a script for setting up new (Kubic) installations in a way that they're ready to join the cluster
    - maybe tied in with an Ignition script, ie. as will be needed to set up the Pi
    - Remember: you only have to do the cluster setup once
    - what it does:
      - imports all my SSH keys from GitHub
      - installs open-iscsi, e2fsprogs
      - do we have a hostname? it figures host resolution out if that's gonna be a thing

Stuff like the disks for the storageclass will be added as an update to the HelmRelease, adding an inline patch (hence why they need to come from values)

And I think that's fine in the Helm model, to extend a chart? Like, these changes would probably get overwritten in Argo, but not Flux

## Why a root chart like this?

While I'm okay trying Argo's sync model, it seems to me that only Flux makes a proper Helm Release and does all the Helm operations to handle upgrading. It also seems like there'd be a fair amount of "supporting systems" needed for Argo to be able to install core system stuff?

Also, a Flux HelmRelease is basically just an Argo Application with a narrower toolchain

Like, really, can one not just use a bunch of HelmReleases to approximate Argo's functionality with just Flux and Helm? Is this why there's a move toward "Argo Flux"?

So yeah wow, on that note, I think I'll actually hold off

## oh wait, I'm looking at Helm a little closer now

It mutates your config by auto-updating images, which is a thing I'd rather have handled by some kind of CI integration.

## ohhh wait, I understand more clearly now...

[the "Get Started" page's description was confusing](https://github.com/fluxcd/helm-operator-get-started):

> The Flux Helm operator provides an extension *to Flux* that automates Helm Chart releases *for it*.

This is true, but only in the sense that this operator automates Helm Chart releases for *any* CD system. the "Flux Helm Operator" is just a Helm operator that *was created* for Flux; it's compatible with Argo or anything else that can define documents in your cluster - just have them define HelmReleases and let the Operator take it from there.

In light of that, I'll maintain the System as a set of Helm releases (and charts to back those relases), and a repository tracking all these releases (as well as a repository). And for now, I'll just do "kubectl apply" on a manual basis to roll out new HelmReleases in development, and commit when they're where I want them.

## stuff you need if not installing FluxCD

From what I can tell, the only thing that's not even integrated, but just suggested in the documentation, is reusing a Flux installation's SSH key for the secret Flux uses to retrieve repos over SSH.

As such, you can pretty much dodge this by just not using SSH to check out repos from GitHub or anywhere (you'd have to set up an account to associate the key with anyway).

## okay, so, the current plan

The root of the system is a set of HelmReleases described in stubernetes-system

one of the HelmReleases is bootstrapped from Helm itself: the core stubernetes-setup chart (Which is, let's say, not in stubernetes-system) applies the manifests needed for Weave, and installs the Helm Operator as a subchart. This could also be thought of as the "core" repository, as it installs the few components needed to install all other components on a fresh (kubeadm) cluster

actually, I'm thinking I will call that "stubernetes-core", and "stubernetes-setup" will be a tree with host-level setup/deployment configuration files which can be, I think, even k3os-based (if k3os can interface with etcd on a kubeadm-provisioned cluster).

- but like, this would have
  - kubic node setup components
    - the `transactional-update pkg install open-iscsi e2fsprogs` script
    - a script that adds a user for myself with my SSH keys and sudoers access
      - in other words, taking the Rancher route
      - it'd be best to have it so the machine queries GitHub for current keys on every login (provided through that hook mechanism that they added before the ability to simply read multiple files)
        - and this is provided through something like `authorized-hooks.d`, right?
          - or it's really simple to set up a layer like that
      - is this easy in Ignition, or am I going to have introduce another level of pain-in-the-ass for [The Sudoer Provisioner Model](m1mqn-55efg-r1baq-b89qy-41cwe)
  - a script to use your sudoer to get cluster-admin access through the given node
    - like, I feel like this could even have its own repo
      - there's hardly anything about it particular to this design
        - it just assumes your node was provisioned as a master or whatever it is that creates the files at the location we read to gain cluster acces

once that's taken care of, you can advance to the next step, which is to start installing all the next-level service components - through HelmRelease definitions from stubernetes-system:

- metallb
- household-dns
  - this'd be based on some kind of generalization of the system I built

some of these could potentially be juggled into other repos / components / "cores" (like an Arges system might need metallb assigning addresses outside the CNI to operate)

## the one thing I'm trying to figure out in all this

Can you handoff from `helm` to a HelmRelease?

Okay, looking at it, what with `helm upgrade -i` being a thing, you definitely can - I'm pretty sure that's basically how this works, actually

in fact, coming back and looking later, this is exactly the reason they give for letting you name the Helm release, for compatibility with outside Helm tooling
