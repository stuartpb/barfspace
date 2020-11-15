# More thoughts on Unusual Studio projects and schemata

- [ ] Maybe think about why none of these projects are described as Stage 3.
  - [ ] Since nothing is ever really "done", IMO, this should probably be reworked as a stage like "No Longer My Problem", for when most development on the project happens outside the context of Unusual Studio.

A lot of this is blocked on the "what do I do with ideas that wither into something else" question that's currently unsolved (I think there might be deliberation in a GitHub issue).

stray thought on the project spec: the phase after "Viable" should be "No Longer My Thing", ie. the project has passed off to the point that someone else is working on it more

## Project content updates

See [this page](5t3mg-9fbhp-t29rc-ezsx7-k19ws) for some thoughts about the Projects list that needs to be updated

## Applications for the project list

Just had a thought that the Hall of Champions can work as a prototype for something to do with these projects (more details over there)

## Interfacing these notes to the project list

I've decided I'm going to work these notes into the project list, but it'll be by importing the notes in the project list's build process and getting the list of all pages that link out to UUIDs under Unusual Studio Projects

This beats trying to track the shifting nature of these notes to project listings under Unusual Studio: the content describing a project can just move and take the link with it.

This introduces the requirement that I won't link to a project on a note page that isn't meant to "own" it, which I'm OK with

## Dynamic Rendering

The whole "static page rendered and deployed via GitHub" thing was always essentially a concession to the difficulty of maintaining a runtime server.

I pretty much just threw it together so that I could have something to show for having gathered up all this hopeful data to get folks on board

Now, though, as I get more skilled in Kubernetes, I can make this an app that live-syncs with the Projects repository

This is more reflective of the kind of features this list will be growing to have anyway
