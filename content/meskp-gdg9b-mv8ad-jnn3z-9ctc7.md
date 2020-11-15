# Pomerium Revisited

Part of the overall [Stubernetes Authn Plan](9hpvq-fgwb1-6panh-9qf3s-xe4r7)

Continuing from [my prior assessment of the state of Kubernetes Auth](0frp2-s0jy2-5c9h0-w94eh-2je8t)

Note this was originally called "Pomerium and Dex", but ended up focused on understanding Pomerium: for the Dex part, go to [Dex (for Pomerium and/or Kubernetes API)](qmrc7-9e4bf-8c8mr-qy1v6-a5c0s)

Okay, so looking at https://github.com/pomerium/pomerium-helm/tree/master/charts/pomerium, it seems like each Pomerium instance is designed to set up one model of authorization, so we'd probably want to have an "internal Pomerium" (backed by the local Dex user database, for stuff like Grafana) and an "external Pomerium" (backed by GitHub etc, for stuff like notestack services)

## revisiting

Okay, so it's like OAuth2Proxy, except you can reuse them? Or it provides more UI?

Anyway, I'm also looking at the Pomerium Operator

Okay, just went backed and looked at "my prior assessment", that's a much more clear introduction.

In particular, https://banzaicloud.com/blog/pomerium-authentication/ makes it VERY easy to understand

reconciling this with https://github.com/pomerium/pomerium-operator#using

staring at https://github.com/pomerium/pomerium-helm/tree/master/charts/pomerium again

okay okay I get it now. installing a Pomerium instance sets up an authentication authority, an app for authenticating with that authority, and a proxy for authorizing the backend to trust that authentication. so, like, the normal expectation would be you'd set this up for your company's domain (so like here I'm probably going to set it up to auth users on horn.horse and/or internal, or I might install two separate chart releases)

anyway, the Pomerium Operator installed with the chart, you configure it to watch a class of ingress, and it will insert Auth stuff into any ingresses (or services) with annotations saying they are of that class, and featuring other Pomerium auth stuff. More importantly, it will configure the Pomerium instance to understand how to authenticate the app on that Ingress based on the rules from those annotations.

I think this is a good enough understanding for me to charge ahead and set up a Pomerium that will require auth via GitHub before I can access my in-house workspaces (so a visitor on the network can't just go and start making uploads to my GitHub repos / so I can keep an SSH key on these).

anyway bedtime, I'll take a crack at this in the morning
