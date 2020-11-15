# Kublam

an annotation/CRD-linkable-by-annotations that just names the GitHub issue responsible for why a resource is so fucked, and a service that runs through your cluster to see if any of those issues have been fixed and notifies you

call it "kublam.moe"

## High concept

Kublam is for monitoring qualitative shifts in the tech behind a Kubernetes cluster, and then notifying humans / altering cluster resources in response.

## Scope

[Kublam Is Not](rebrq-cf9vz-webx0-n7ry3-z1c02)

## Prior art?

I feel like this is obvious enough that someone's already made something like it?

The thing that would make me pursue this design is that I get the feeling whatever's out there that's capable of this kind of thing is also probably integrated with some monolithic CI/issue-tracker that predates Kubernetes and doesn't work particularly smoothly with it, like OpenShift or whatever

Hence why the reduced scope is so important: it's this refusal to expand into that territory that differentiates Kublam from ecosystem-scale

## Further design

- [Annotations and CRDs](dzvvm-zg5p5-ana82-8a7zx-8ss4p)
- [Configuring Kublam](cmhpq-mg0zf-0saw5-93v5y-p0wmq)
- [User Stories](pv92q-2bv3y-8yay4-s7tgk-rv4r4)
- [implementation details](q5agf-h5b8n-crapg-cfjxd-56tm9)
- [Game Release Notes Involve Patches Too](kyxjh-08whj-8j85m-aeas7-0bm2n)

## see also

- [Prometheus Issue Genius](8ddkf-m8tcy-4m9kb-dxvk2-0bfwk)
- [Git Standing Patch Ignore](2v96d-2q8g1-vm9b9-dhp53-s13ma)
