# Upgrading the Prometheus Operator Chart

http://kubeapps.internal/#/ns/prometheus/apps/prometheus-operator/upgrade

## before doing so

going to https://dashboard.stubernetes.internal/#/service/kube-system/prometheus-operator-coredns?namespace=_all and

cutting and editing until I've got this to apply:

```yaml
kind: Service
apiVersion: v1
metadata:
  name: household-dns-metrics
  namespace: household-system
  labels:
    app.kubernetes.io/instance: household-dns
spec:
  ports:
    - name: http-metrics
      protocol: TCP
      port: 9153
      targetPort: 9153
  selector:
    app.kubernetes.io/instance: household-dns
  clusterIP: None
  type: ClusterIP
  sessionAffinity: None
```

## changing the chart values

```yaml
  additionalServiceMonitors:
  - name: household-dns
    selector:
      app.kubernetes.io/instance: household-dns
    namespaceSelector:
      matchNames:
      - household-system
```

Actually... I'll hold off on this until I've got containerd more room.
