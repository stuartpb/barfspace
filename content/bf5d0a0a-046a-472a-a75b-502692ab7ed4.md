# The Not Packaged Here Repository

This would be a repo that takes charts for stuff like Bitnami's charts and Rancher's not-Rancher Charts etc. and replaces them with stock or otherwise upstream-packaged components

If-and-only-if an upstream container isn't available, we ship as close as we can to a from-scratch or alpine container

## Priorities

Kind of like Arch or Alpine:

- Using as much of what upstream provides as is feasible
  - when that means upstream isn't bundling in features you might want, that means inserting them is up to you
    - that might mean writing an init container / script
    - figuring out how to package that is your problem
      - I mean, you can define it as a runtime in your Helm value, for simple stuff
- As little opinion-injection as possible
- Similarity to precedent is valued over inter-chart consistency
- Adding optional integrations to another chart is fine
  - but no sneaking in your own opinionated version as a default!
  - if there are a few common implementations, they should all be suggested equally
  - it's okay to pick a "best fit" default, though

Indeed, where images are concerned, if you have to define one that gets packaged in a Docker repo, it's preferred to use `FROM scratch`, then `FROM alpine`, then `FROM` any distro recommended up the project's upstream (like ubuntu or debian) *but it has to be the stock image*

or, like, it hsa to be as stock as the "instructions for installing on X" in their readme dictate, where X represents the stock state. If they have instrutions "From" a specific kind of build container (and yet no actual built images for it, for some reason?), you can use that

## Initiatives

- Have charts from orgs that introduce their own opinionated variants read as downstreams to cherry-pick patches from, submitted as PRs through some CI system
  - Bitnami
  - Rancher / k3(o)s
- Rescue "stable" and "incubator" charts that will otherwise have no maintainer
