# Kublam User Stories

## The one that inspired this: the Mixed LoadBalancer problem

There's a bug in Kubernetes that an Enhancement Proposal is suggesting to fix. There's discussion between having the fix take the form of a kubelet arg, versus letting it be an annotation.

I want to watch two issues, and depending on which one gets merged/closed, or which proposal is approved or whatever, either adds the annotation+port and deletes the duplicate service, or creates a new merged service

or if the kubelet thing happens, just email me and I'll ssh in and adjust the kubelet command in our start script manually (or even I'll have it spawn a Job)

This might entail watching comments for which one gets the sufficient "LGTM" replies

## Much simpler example

I have a workaround in my ConfigMap for a bug in this app. I want to watch a GitHub issue, and when the comment "Landing in vX.Y.Z" is posted and the issue is closed / PR is merged, I want to check for a published Helm chart using that version of the app, and then remove the hack from the ConfigMap (by patching it)

For simplicity's sake, we'll say the patch can be a key/value clobber, but we might want to have a condition like "only make this change if the ConfigMap is still the hacked version", like maybe we came up with another workaround that just involved fixing things on our end and made the hack obsolete regardless of upstream, or maybe we made an unrelated change
