# Rethinking release channels: the EARS system

Rather than Chrome's dev/beta/stable system, I think it'd be smarter to tier releases like this:

this is catered more toward a

- experimental
  - not even "risky", there are things at this level
  - experimental follows calver - there are no guarantees of compatibility between any two experimental versions
  - In live apps, this would be the branch that runs
- adventurous
  - this would be where alpha/beta/rc stages get released to
  - no patch versions, only alpha/beta/rc
  - once an rc is deemed stable, it becomes "reasonable"
  - In live apps, this would be a piece of UX you either roll out by A/B test
- reasonable
  - this is the default release channel ("gold")
  - in a live app, you can opt out of redesigns while not being forgotten
- safe
  - this is LTS (I believe that's considered "platinum")
- branches after this, ie. ones that fall out of any release target (ie. when safe starts tracking a new branch) are just forever known by their version, and generally handled by a different maintenance group

## in Git terms

so, above this would be where you'd have "incoming" branches, which are feature branches etc.

## one model of branching

I might be diverging a bit

- rolled is where patchsets to be evaluated for release packaging
  - experimental is tagged by CI at times and dates

## more like what I was saying/thinking

this can probably be reconciled / mixed and matched with the idea above/below to form a more cohesive/modular distinct process

- experimental is where patchsets to be evaluated for release packaging
  - experimental is tagged by CI

## the ci validation layer

you might have that as "wip" and "ci", where the former is the incoming branch that has not been evaluated for correctness, and the latter is the latest revision that has passed validation

each release on one of these channels is like updating a tag to a new head based on the branch defined by the , which is finalized (at its most specific level) when released

so yeah, pushing a release to the next channel... yeah okay, so, a versioned release is defined by which patches are cherry-picked... like, there can be a patchset that lives in experimental but never graduates to adventurous, or patchsets in alpha that get

do you handle those by reverts? I guess alpha-to-beta you would, within the context of the "adventurous" channel, and then you don't have that in the "reasonable" channel because every commit to that is a merge from an rc in adventurous

so

- experimental is a branch
  - calver is the git ref?

This gradient also applies for things like which technologies to go with, and indeed can often be seen relfected in which underlying dependencies each channel has (ie. "sqlite is usually considered an experimental backend)
