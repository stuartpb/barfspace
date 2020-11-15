# How Ingress and Exposure are structured on Stubernetes

As of 2020-06-04, the only active outside-facing services on Stubernetes are the household-internal ones. They are implemented as LoadBalancer IPs assigned by MetalLB, with `.internal` domain names served by the loose Deployments that make up Household DNS.

[Planning and Exploration](kb2g7-vd6v4-039jt-yhx56-hhr8s) is about half dedicated to expansion / refinements on this model.
