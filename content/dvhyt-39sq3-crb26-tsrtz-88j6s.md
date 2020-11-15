# flagday branching

split out from describing [new gotk-oriented BASIC-prefixed repo style](f509f-7z72m-yh834-6xk45-07q59), this is sort of a future proposal that could also apply to any other project

and then I guess you'd do flag-day-based branches for changes that'd be liable to break common customizations (ie. ones that majorly adjust the structure of the data), and each flag day has a corresponding "stable" and "staging" system. if folks' early-alarm systems catch something in staging, they can catch it and declare the need for a flag day before the change makes its way to stable (in a way that could correspond to how many stakeholders are known to be dependent on kustomizations to that part of the system)

I guess this could also be for changes liable to break clusters for outside/runtime reasons, beyond just "the kustomization wouldn't work any more"?

if a break is found in staging, the change is moved to a new flag day, and systems will only migrate to the new flagday (which could probably be references with another level of ref) if they can determine their system doesn't break on the commit that called for a flagday. or, if you don't have a staging cluster, you can just advance after inspecting the change manually

so I guess this could be a subdir of refs, "flagdays"

oh yeah, and so it can be used to schedule "big changes", and folks can opt into their own version

## oh, right, so, the reason it's like this

the idea is, you'd have the branch for the flag day continue to merge patches that do not trigger other flag days, as long as people feel like "supporting" it because they can't

and that's how "long term support branches" can emerge organically, if someone says "I'm gonna keep figuring out a way to make this work

you can even have "I chose to solve my problem this way instead" to create forks/options, etc.

## why it's not too crazy

this is basically just semver if you had systems following the dev branch stop following it ("hit the brakes") any time it broke something, put out a major release version increment every time something broke, and did a minor increment every time you pushed a patch

## what WOULD be crazy tho

if this intersected with some of the stuff related to kublam for auto-resolution, you could have some level of wizardry to auto-patch your local kustomizations to resolve the issue, if it now passes a test that would have previously been failing in the way that caught the original problem?

does Gentoo's portage work like this?

## this versus other strategies

so, the snapper/Kubic/transactional-update/Tumbleweed approach I'm planning on taking in Ska Linux, that should be able to interface with some kind of CI, but, like, it's also designed, you know, at the Cattle layer
