# Better Kubernetes Iconography

[The official icons](https://github.com/kubernetes/community/tree/master/icons) aren't particularly inspired or evocative.

Here's the idea I have for [Cluster Explorer](k2ecq-hqxgs-ccax1-s1p85-59s4s)

- each API set has its own aesthetic
  - this helps to differentiate "types" at a higher level
  - it also helps maintain the Discord needed for smooth extensibility
    - contrasted with, say, keeping the same blue/white flat aesthetic, but making each icon set a shape with a different number of sides

## Data Model

- Each icon is namespaced per Resource Definition
- Variants should be specified as another set which can be used as an overlay / composed into alternative sets
  - Essentially, following Globerlays

## Iconography ideas

- a Deployment is a banner/flag
  - keeping the metaphor of it being like a "troop deployment"
- a StatefulSet is another kind of flag like a Standard
  - or is StatefulSet under a different API resource type branch?
  - If so, then maybe it's just a flag rendered in a different style?
    - Should still be easily verbally distinguished, though
      - like "the flag with a hat on it" or something
