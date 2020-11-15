# Kublam Is Not

this content could go at addresses like `kublam.moe/is-not#ci`, and can have an associated "out of scope" dismissal-reason label

## Kublam is NOT an issue tracking system

It doesn't enforce any kind of "user responsibilty" mechanism beyond "email this address / respond to email from this address". You can use "remarks" and stuff to hack "conversations" like it's TV Tropes, but this will end in tears. Install a proper ticketer.

## Kublam isn't about putting the frontend cart before the backend horse

Kublam should have a dashboard, but it shouldn't be dashboard-centric - the CRDs shouldn't require a "degree in clusterology" to write *safely by default* (so like, if you want "clobber this regardless of any changes made", you have to explicitly say that, and it's just as easy to say "clobber this if it's still at whatever revision it's at when I send the cluster this doc")

## Kublam is NOT a CI system

It is not designed to push changes / pull-requests to your app's source control repository and roll out automated packages, or even handle automatic updates to images/charts. Kublam is for *one-off changes to the live state*, in response to a *specific change requiring structural reconfiguration*. If you want to track your cluster's confiiguration in some kind of outside source control, you should figure out how to use that to make these kinds of changes, and shouldn't be using Kublam.

Yes, you could hack this with Jobs that run Git commands with a secret and all that stuff, but

(this stuff kind of gestures toward [Git Standing Patch Ignore](2v96d-2q8g1-vm9b9-dhp53-s13ma))

## Kublam is NOT a monitoring/paging system

It doesn't track changes to the cluster's live state (though it might respond to them when enacting a plan, like "before splitting the containers out to their own pods, scale the app down if it's currently serving a shitload of traffic").
