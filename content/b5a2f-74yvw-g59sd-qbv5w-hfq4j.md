# It's Happened: How I Want to Reinvent k3s

Okay, I dove into k3s's code today to understand [why `no-deploy` is deprecated](https://github.com/rancher/k3s/issues/1382) (as it's mentioned in the `help` text but with no futher documentation of why), and in reviewing that and seeing [this crap on the side](https://github.com/rancher/k3s/issues/817), I've reached the same turning point I had with Dokku: these maintainers are putzes, the stability of the project is not trustworthy, and I should write my own

## the basic pitch

I always wanted a more realistic basis for Plushu than Dokku's weird local-machine orchestration, and was looking at CoreOS from the beginning.

Now that k8s has emerged as the clear answer, I've wanted to "rearchitect" Plusku around it, in some way, but I wasn't sure what the right "hierarchy" would be.

k3s and k3os have made the core factorization of everything a "good Kubernetes base" should have clear

## the big picture

[let's break out a separate page for this one](xft7t-am737-c681k-evqax-fk0b5)

## thoughts on what's good/bad in k3s

good:

- the opinionated plumbing that's functional out of the box, and can get swapped out.
- letting you just specify github users as your auth method in setup
  - even though it's just SSH keys this is a nice "something I can configure from memory" that's also secure
- the auto-update system looks pretty slick
- the OpenRC thing might be worth it if that lets k3os run [kubelet as PID 1](https://docs.google.com/spreadsheets/d/1pO3sCqilAjxDbI43R7EHDJFu64EwZGAAlzt84GF8tRs/edit#gid=0)

meh:

- the single-binary thing is cute and all, if you're looking to fit a Kubernetes cluster system within an existing OS that wasn't built just to run k8s
- the removal of beta/deprecated features and non-core plugins: i guess? apparently the former isn't even a thing in k3s any more, and the latter, I don't know

bad:

- a few things that make the system much more human-friendly (kubernetes-dashboard, kubeapps) are not included by default
  - the Dashboard in particular is a *huge* headache to get right, relatively speaking
  - Cluster administration tools in general have a painful, clunky auth process
- swapping out the core modules is a little hinky
  - deployment is mixed in with server startup
- I keep typing "k30s" when I want to search for k3os

## clear room for improvement

The underlying services should be implemented as Helm charts. (I think that's possible?)

The "watch these YAML files and apply any changes" thing should be opt-in, after the services have already been set up by Helm

## starry-eyed aspirations

k3os's... I don't remember what I was going to write here (if I didn't start to write it elsewhere), but I think this might have been "release scheme"

anyway, my thought was that you'd have "beta", "release candidates", and "stable" as different channels, a la Chrome, Windows etc

PrusaSlicer's "betas use a separate config space but RCs use the stable one" is a genius idea, not sure if it could apply here

## general ideas / concepts to mull over

So, wrt the stuff inside the cluster, one thing I've been thinking is that...

Well, really, this is more like a general idea I've had that I can only clearly articulate in terms of how k3s's behavior should be done:

k3s ought to make it so it only autoupdates components (via the clobbering apply method it uses) if the "manufacturer's seal" hasn't been broken, you get what I'm saying? Like, there's a sentinel value that says "I've configured this to work differently than the upstream authority expects, I recognize that this means I will be responsible for maintenance on my own"
