# The next morning

The DNS servers didn't renew overnight, so `sudo systemctl restart NetworkManager`

Anyway, I can go to kubeapps.internal now

weird that http://kubeapps.internal/#/ns/household-system/apps doesn't list `household-dns`, I did technically install it via Helm, it has all the annotations

## let's add more

changing the spec on the Kubernetes Dashboard from this to `LoadBalancer`

```
spec:
  ports:
    - protocol: TCP
      port: 443
      targetPort: 8443
  selector:
    k8s-app: kubernetes-dashboard
  clusterIP: 10.43.17.33
  type: ClusterIP
  sessionAffinity: None
```

and adding these annotations

```
    annotations:
      external-dns.alpha.kubernetes.io/hostname: dashboard.stubernetes.internal
      hhk8s.stuartpb.com/internal-name: coredns
```

## visiting

huh, I guess there's no HTTP for the dashboard, it's (self-signed) HTTPS-only? that kind of suck
