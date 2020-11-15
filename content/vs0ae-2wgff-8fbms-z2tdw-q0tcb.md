# Alternative cluster visualization tools

I'm getting kind of tired of the Kubernetes Dashboard, and, once I've got [authn](9hpvq-fgwb1-6panh-9qf3s-xe4r7) figured out, I want something I can log into and manuipulate the server with.

## Sources

- https://octopus.com/blog/alternative-kubernetes-dashboards
- https://kube-web-view.readthedocs.io/en/latest/alternatives.html
  - https://srcco.de/posts/kubernetes-web-uis-in-2019.html
    - this is real good at pros/cons

For completeness's sake, I'm listing definite non-options in [Obsolete cluster visualization tools](39na1-af0zs-9983p-jrrbb-ka45k)

## current conclusions

- for replacing the dashboard: k8sdash (or maybe kube-web-view), or Octant if you could swing it
- for doing slightly better than the dashboard: kubernator
- for doing way more than the dashboard: kubevious, and again maybe octant
  - also maybe try Weave Scope

## k8sdash

https://github.com/indeedeng/k8dash

- pros:
  - more modern UI: React instead of kubernetes-dashboard's ugly herp-derp Angular and clumsy Material
- cons:
  - wants metrics-server, not Prometheus
  - made by Indeed, a company who, engineering aside, I want to vanish from the Earth
  - still basically Kubernetes Dashboard

## Kubevious

https://github.com/kubevious/kubevious

- pros:
  - one-big-topology view
  - has Helm chart *and* repository
  - designed to run in-cluster, which is more than we can say about some of these (cough cough Octant)
  - look at this [fucking beautiful RBAC view](https://github.com/kubevious/kubevious#correlated-rbac)
- oh wow what?
  - [time machine](https://github.com/kubevious/kubevious#time-machine)
  - ["radioactive" labeling](https://github.com/kubevious/kubevious#radioactive--overprivileged-workloads)
- cons:
  - aesthetically on the level of DevTools
  - [wtf companization](https://kubevious.io/)

## kube-web-view

https://kube-web-view.readthedocs.io/en/latest/alternatives.html

stumbled upon this accidentally

- pros:
  - [has docs!](https://kube-web-view.readthedocs.io/)
- cons:
  - doesn't look like much more than the current dashboard
  - Python

see also [the other hjacobs tools](vxaet-r7488-0wad7-dhsat-twgct)

## Octant

https://octant.dev/

- pros:
  - looks real good
    - not just a tree view but a *console*?
  - a former Heptio project
  - extensible, has more than just Dashboard-esque views ([this blog post](https://octant.dev/octant-reveals-objects-running-in-kubernetes-clusters/) shows a graph)
- cons:
  - doesn't seem geared toward running in-cluster
    - it IS HTTP-based, though, so it should be possible

## kubernator

https://github.com/smpio/kubernator

- pros:
  - better take on the UI. left side is a tree view, right side is tabbed.
  - monaco!
- cons:
  - couple months since last commit? an eternity in kube years
  - [only helm chart I could find is from 2018](https://github.com/nachomillangarcia/helm-chart-kubernator)
    - but it's straightforward enough to roll out (example lists a docker run command) that I don't think that'd be too much of an issue

so far I think I like this one best

## Weave Scope

https://github.com/weaveworks/scope

- pros:
  - ooh, fancy graph UI
  - has a helm chart, though it's in `stable`
  - [octopus says](https://octopus.com/blog/alternative-kubernetes-dashboards#weave-scope) it's the best way to visualize inter-pod traffic
- cons:
  - for "docker and kubernetes", meaning it's container-oriented and might well suck for editing cluster docs
  - I kinda give the side eye to anything by Weave other than Net

## konstellate

https://github.com/containership/konstellate

- pros:
  - graph-and-wizard-oriented, wowie zowie
- cons:
  - no updates since mid-2019
  - ["How to run konstellate on your machine? Install Clojure"](https://github.com/containership/konstellate#how-to-run-konstellate-on-your-machine)

## Little current-dashboard wishlist

- Would like to make it so I can at least save settings:
  - Cluster name in dashboard
  - "Don't show notifications for not being able to read secrets"
  - I'm cool adding this manually, just need to determine how
- Is there a user account for this? What would it take to make one?
- Do I maybe want to install a second Dashboard instance for write-access, and then this one can stay internal-read-only?
  - Also, how about internal access to a static overview in Grafana?
