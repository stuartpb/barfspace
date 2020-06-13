# Stubernetes Quick Access Reference

this is all assuming you're coming from a system that has already got kubectl set up to connect to the cluster via an entry in `.kube/config`

## Dashboard

- Link: https://dashboard.stubernetes.internal/#/login
  - API proxy: https://192.168.0.23:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
    - Proxy password: `less ~/.kube/config`
- Credentials:
  - from Mk 1: `kubectl -n kube-dashboard describe secret $(kubectl -n kube-dashboard get secret | grep admin-user | awk '{print $1}')`
  - I think we're gonna be past that
- Docs: https://github.com/kubernetes/dashboard/blob/master/docs/user/accessing-dashboard/README.md

## Kubeapps

- Link: http://kubeapps.internal/#/apps/ns/_all
  - Local-forwarding command: `kubectl port-forward -n kubeapps svc/kubeapps 8080:80`
- Credentials: `kubectl get -n default secret $(kubectl get -n default serviceaccount kubeapps-operator -o jsonpath='{.secrets[].name}') -o go-template='{{.data.token | base64decode}}' && echo`

## Prometheus

- http://prometheus.internal:9090/graph
- http://grafana.prometheus.internal/
  - user: admin / password: prom-operator

## Longhorn UI

since this is unauthenticated, we're not gonna expose it until Dex or Keycloak or something is set up in front

- Local-forwarding command: `kubectl port-forward -n longhorn-system svc/longhorn-frontend 8069:80`
- Link: http://127.0.0.1:8069/

## protips for adding more

- https://kubernetes.io/docs/tasks/access-application-cluster/access-cluster/#manually-constructing-apiserver-proxy-urls
