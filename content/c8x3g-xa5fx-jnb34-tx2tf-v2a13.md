# Rebuilding 2020-06-14

Okay, so, continuing from the end of [Following the Rebuilding Plan](5mj23-sjeyj-jqana-5xdyg-fg6gd)

I started with [Setting up OpenEBS](9z6e0-jbr2w-c296c-2a5vm-r0esy) last night - mostly research and getting to know OpenEBS, but also setting up a transactional-update to install open-iscsi next time I reboot (if it hasn't already).

Anyway, I feel like the next step I want is to get household-dns running, then OpenEBS...

## first tweak

and to set it up, I'm going to start by giving Kubeapps a LoadBalancerIP of 192.168.42.75 (proceeding by elevens from 64, for Dashboard, and 53, for DNS)

`EDITOR=nano kubectl edit svc kubeapps -n kubeapps`, I'm basic like that

## what after dns and pvcs

then I'm thinking I'll look at Dex / Pomerium to the same degree as I just reviewed OpenEBS, and from there I'll probably set that up, tweak the Dashboard (and Kubeapps!) to go behind the proxy server, then set up prometheus-operator to check how our performance is looking, *then* tackle the workspace, then look at Loki and logging-operator, then external-ingress and JupyterHub

- notes on how I understand Dex and Pomerium:
  - [Understanding the Auth Outlay in the Kubernetes Ecosystem / Landscape](0frp2-s0jy2-5c9h0-w94eh-2je8t) (split from here)
  - [Pomerium and Dex](meskp-gdg9b-mv8ad-jnn3z-9ctc7) (written later)

## side discovery: dashboard works right now?

Not sure how this is working, but if I go to https://192.168.42.64/#/overview, and it tells me I'm on the default service account, I can check everything, and all I get is errors about not having authorization to read secrets (as expected)

> secrets is forbidden: User "system:serviceaccount:kubernetes-dashboard:kubernetes-dashboard" cannot list resource "secrets" in API group "" (in the namespace "default"|at the cluster scope)

This was what I wanted??

ohh, when I was trying to hit the "skip" button before, had I been trying to go to the login screen? And that's why it was just sending me to the login sceen over and over? omglol. okay so I configured this right

## anyway

[Retracing household-dns](82afk-fk2xc-rc954-gq524-me68y)

