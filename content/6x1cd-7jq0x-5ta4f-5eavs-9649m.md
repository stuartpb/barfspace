# Setting up a base authentication layer

This would be most useful for making the Kubernetes Dashboard less of a pain in the ass, but it'd also be useful

This will need:

- If using GitHub authentication:
  - External ingress (so the GitHub OAuth server can reach it)
- If using some other form of authentication, like an internal user database:
  - ???
- In any case:
  - Dex
  - cert-manager?
  - probably household DNS?

## guides

- https://medium.com/preply-engineering/k8s-auth-a81f59d4dff6
- https://thenewstack.io/kubernetes-single-sign-one-less-identity/
- https://thenewstack.io/single-sign-kubernetes-command-line-experience/
- https://thenewstack.io/single-sign-on-for-kubernetes-dashboard-experience/

## docs

- https://github.com/dexidp/dex/blob/master/Documentation/kubernetes.md
- https://kubernetes.io/docs/reference/access-authn-authz/authentication/

## idea sprout

Something that could make it easier to put these in front of an app: [A Route-Based Controller for Abstract Server Setups](j4m37-at9bj-0zbq1-ft9xy-ymk05)
