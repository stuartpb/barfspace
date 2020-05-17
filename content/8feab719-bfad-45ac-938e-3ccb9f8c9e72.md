# getting started with my kubernetes cluster

following https://rancher.com/docs/k3s/latest/en/cluster-access/ on stuzzy

running `mkdir ~/.kube && ssh rancher@192.168.0.35 'cat /etc/rancher/k3s/k3s.yaml' > ~/.kube/config`

running `yay kube` to install `minikube kubectl kubectx`

## arch bullshit

mirrors are out of date, need to `yay -Syu`

got a signature error so running `sudo pacman-key --refresh-keys`

fixed the issue (probably could have just done `yay -S archlinux-keyring`), but the upgrade is messing up glyphs etc so I need to reboot

### intel thing

```
(107/444) upgrading libva                                                   [###########################################] 100%
New optional dependencies for libva
    intel-media-driver: backend for Intel GPUs (>= Broadwell)
    libva-intel-driver: backend for Intel GPUs (<= Haswell)
    libva-vdpau-driver: backend for Nvidia and AMD GPUs
```

`yay -S intel-gpu-tools`

didn't feel like finding the right one. [this page](fdd0e9f2-09e0-4f57-afbe-f8d7f0ce238e.md) says it's sandy bridge which is [pre-haswell](https://en.wikipedia.org/wiki/List_of_Intel_CPU_microarchitectures)

`yay -S libva-intel-driver`

## anyway

after `yay -S kubectl kubectx minikube`, updating AUR deps (including `kubernetes-helm`), and rebooting:

## installing kubeapps

following https://github.com/kubeapps/kubeapps/blob/master/docs/user/getting-started.md

`helm repo add bitnami https://charts.bitnami.com/bitnami`

`kubectl create namespace kubeapps`

> The connection to the server 127.0.0.1:6443 was refused - did you specify the right host or port?

derp

`sed -i s/127\.0\.0\.1/192.168.0.35/ ~/.kube/config` and retry

## pulling the trigger

reviewing https://github.com/kubeapps/kubeapps/blob/master/chart/kubeapps/README.md and https://github.com/kubeapps/kubeapps/blob/master/chart/kubeapps/values.yaml now

figuring out tls and dns seems like a headache - for now, I can just hack this via a basic ingress directive, and then I'll figure out how to serve that via DNS later (maybe the router can have a dnsmasq that recognizes stukrates as an authority for stuartpb.internal, and hands everything else off to 1.1.1.1)

```
helm install kubeapps --namespace kubeapps bitnami/kubeapps --set useHelm3=true --set ingress.enabled=true --set ingress.hostname=kubeapps.stukrates.stuartpb.internal
```

doing `echo "192.168.0.35  kubeapps.stukrates.stuartpb.internal" | sudo tee -a /etc/hosts` per the console spew, gross as it is

## i'm in

page loads. tbh, I probably could have enabled tls and set an exception, but whatever

```
kubectl create serviceaccount kubeapps-operator
kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator
```

```
kubectl get secret $(kubectl get serviceaccount kubeapps-operator -o jsonpath='{range .secrets[*]}{.name}{"\n"}{end}' | grep kubeapps-operator-token) -o jsonpath='{.data.token}' -o go-template='{{.data.token | base64decode}}' && echo
```

I was expecting to have to run `kubectl port-forward -n kubeapps svc/kubeapps 8080:80`, but as I said the page loaded.

## havoc with helm apps

the Kubernetes Dashboard seems like a reasonable enough first install

creating a `kube-dashboard` namespace because hey why not

deploying 1.10.1 as "kubernetes-dashboard" and not Helm's suggestion

```
# Default values for kubernetes-dashboard
# This is a YAML-formatted file.
# Declare name/value pairs to be passed into your templates.
# name: value

image:
  repository: k8s.gcr.io/kubernetes-dashboard-amd64
  tag: v1.10.1
  pullPolicy: IfNotPresent
  pullSecrets: []

replicaCount: 1

## Here annotations can be added to the kubernetes dashboard deployment
annotations: {}
## Here labels can be added to the kubernetes dashboard deployment
##
labels:
  app.kubernetes.io/name: kubernetes-dashboard


## Enable possibility to skip login
enableSkipLogin: false

## Serve application over HTTP without TLS
enableInsecureLogin: false

## Additional container arguments
##
# extraArgs:
#   - --enable-skip-login
#   - --enable-insecure-login
#   - --system-banner="Welcome to Kubernetes"

## Additional container environment variables
##
extraEnv: []
# - name: SOME_VAR
#   value: 'some value'

# Annotations to be added to kubernetes dashboard pods
## Recommended value
podAnnotations:
  seccomp.security.alpha.kubernetes.io/pod: 'runtime/default'

## SecurityContext for the kubernetes dashboard container
## Recommended values
dashboardContainerSecurityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true

## Node labels for pod assignment
## Ref: https://kubernetes.io/docs/user-guide/node-selection/
##
nodeSelector: {}

## List of node taints to tolerate (requires Kubernetes >= 1.6)
tolerations: []
#  - key: "key"
#    operator: "Equal|Exists"
#    value: "value"
#    effect: "NoSchedule|PreferNoSchedule|NoExecute"

## Affinity
## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
affinity: {}

# priorityClassName: ""

service:
  type: ClusterIP
  externalPort: 443

  ## This allows an override of the heapster service name
  ## Default: {{ .Chart.Name }}
  ##
  # nameOverride:

  # LoadBalancerSourcesRange is a list of allowed CIDR values, which are combined with ServicePort to
  # set allowed inbound rules on the security group assigned to the master load balancer
  # loadBalancerSourceRanges: []

  ## Kubernetes Dashboard Service annotations
  ##
  ## For GCE ingress, the following annotation is required:
  ## service.alpha.kubernetes.io/app-protocols: '{"https":"HTTPS"}' if enableInsecureLogin=false
  ## or
  ## service.alpha.kubernetes.io/app-protocols: '{"http":"HTTP"}' if enableInsecureLogin=true
  annotations: {}

  ## Here labels can be added to the Kubernetes Dashboard service
  ##
  labels:
    app.kubernetes.io/name: kubernetes-dashboard

resources:
  limits:
    cpu: 100m
    memory: 100Mi
  requests:
    cpu: 100m
    memory: 100Mi

ingress:
  ## If true, Kubernetes Dashboard Ingress will be created.
  ##
  enabled: true

  ## Kubernetes Dashboard Ingress annotations
  ##
  ## Add custom labels
  # labels:
  #   key: value
  # annotations:
  #   kubernetes.io/ingress.class: nginx
  #   kubernetes.io/tls-acme: 'true'
  ## If you plan to use TLS backend with enableInsecureLogin set to false
  ## (default), you need to uncomment the below.
  ## If you use ingress-nginx < 0.21.0
  #   nginx.ingress.kubernetes.io/secure-backends: "true"
  ## if you use ingress-nginx >= 0.21.0
  #   nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"


  ## Kubernetes Dashboard Ingress paths
  ##
  paths:
    - /
  #  - /*

  ## Kubernetes Dashboard Ingress hostnames
  ## Must be provided if Ingress is enabled
  ##
  hosts:
    - kubernetes-dashboard.stukrates.stuartpb.internal

  ## Kubernetes Dashboard Ingress TLS configuration
  ## Secrets must be manually created in the namespace
  ##
  # tls:
  #   - secretName: kubernetes-dashboard-tls
  #     hosts:
  #       - kubernetes-dashboard.domain.com

rbac:
  # Specifies whether RBAC resources should be created
  create: true

  # Specifies whether cluster-admin ClusterRole will be used for dashboard
  # ServiceAccount (NOT RECOMMENDED).
  clusterAdminRole: false

  # Start in ReadOnly mode.
  # Only dashboard-related Secrets and ConfigMaps will still be available for writing.
  #
  # Turn OFF clusterAdminRole to use clusterReadOnlyRole.
  #
  # The basic idea of the clusterReadOnlyRole comparing to the clusterAdminRole
  # is not to hide all the secrets and sensitive data but more
  # to avoid accidental changes in the cluster outside the standard CI/CD.
  #
  # Same as for clusterAdminRole, it is NOT RECOMMENDED to use this version in production.
  # Instead you should review the role and remove all potentially sensitive parts such as
  # access to persistentvolumes, pods/log etc.
  clusterReadOnlyRole: false

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name:

livenessProbe:
  # Number of seconds to wait before sending first probe
  initialDelaySeconds: 30
  # Number of seconds to wait for probe response
  timeoutSeconds: 30

podDisruptionBudget:
  # https://kubernetes.io/docs/tasks/run-application/configure-pdb/
  enabled: false
  minAvailable:
  maxUnavailable:


## PodSecurityContext for pod level securityContext
##
securityContext:
  runAsUser: 1001
  runAsGroup: 2001

networkPolicy: false
```

> Release "kubernetes-dashboard" failed and has been uninstalled: Service "kubernetes-dashboard" is invalid: metadata.labels: Invalid value: "Kubernetes Dashboard": a valid label must be an empty string or consist of alphanumeric characters, '-', '_' or '.', and must start and end with an alphanumeric character (e.g. 'MyValue',  or 'my_value',  or '12345', regex used for validation is '(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])?')

my bad for uncommenting the `kubernetes.io/name: "Kubernetes Dashboard"` lines, weird

## created but still failing

```
kubectl logs kubernetes-dashboard-5b4fcdb46f-hxjpt --namespace kube-dashboard
2020/02/28 13:33:15 Starting overwatch
2020/02/28 13:33:15 Using in-cluster config to connect to apiserver
2020/02/28 13:33:15 Using service account token for csrf signing
2020/02/28 13:33:15 Successful initial request to the apiserver, version: v1.17.2+k3s1
2020/02/28 13:33:15 Generating JWE encryption key
2020/02/28 13:33:15 New synchronizer has been registered: kubernetes-dashboard-key-holder-kube-system. Starting
2020/02/28 13:33:15 Starting secret synchronizer for kubernetes-dashboard-key-holder in namespace kube-system
2020/02/28 13:33:15 Synchronizer kubernetes-dashboard-key-holder-kube-system exited with error: unexpected object: &Secret{ObjectMeta:k8s_io_apimachinery_pkg_apis_meta_v1.ObjectMeta{Name:,GenerateName:,Namespace:,SelfLink:,UID:,ResourceVersion:,Generation:0,CreationTimestamp:0001-01-01 00:00:00 +0000 UTC,DeletionTimestamp:<nil>,DeletionGracePeriodSeconds:nil,Labels:map[string]string{},Annotations:map[string]string{},OwnerReferences:[],Finalizers:[],ClusterName:,Initializers:nil,},Data:map[string][]byte{},Type:,StringData:map[string]string{},}
2020/02/28 13:33:18 Restarting synchronizer: kubernetes-dashboard-key-holder-kube-system.
2020/02/28 13:33:18 Starting secret synchronizer for kubernetes-dashboard-key-holder in namespace kube-system
2020/02/28 13:33:18 Synchronizer kubernetes-dashboard-key-holder-kube-system exited with error: kubernetes-dashboard-key-holder-kube-system watch ended with timeout
2020/02/28 13:33:20 Restarting synchronizer: kubernetes-dashboard-key-holder-kube-system.
2020/02/28 13:33:20 Starting secret synchronizer for kubernetes-dashboard-key-holder in namespace kube-system
2020/02/28 13:33:20 Synchronizer kubernetes-dashboard-key-holder-kube-system exited with error: kubernetes-dashboard-key-holder-kube-system watch ended with timeout
2020/02/28 13:33:22 Restarting synchronizer: kubernetes-dashboard-key-holder-kube-system.
2020/02/28 13:33:22 Starting secret synchronizer for kubernetes-dashboard-key-holder in namespace kube-system
2020/02/28 13:33:22 Synchronizer kubernetes-dashboard-key-holder-kube-system exited with error: kubernetes-dashboard-key-holder-kube-system watch ended with timeout
2020/02/28 13:33:23 Storing encryption key in a secret
panic: secrets is forbidden: User "system:serviceaccount:kube-dashboard:kubernetes-dashboard" cannot create resource "secrets" in API group "" in the namespace "kube-system"

goroutine 1 [running]:
github.com/kubernetes/dashboard/src/app/backend/auth/jwe.(*rsaKeyHolder).init(0xc4201874e0)
	/home/travis/build/kubernetes/dashboard/.tmp/backend/src/github.com/kubernetes/dashboard/src/app/backend/auth/jwe/keyholder.go:131 +0x35e
github.com/kubernetes/dashboard/src/app/backend/auth/jwe.NewRSAKeyHolder(0x1367500, 0xc420264000, 0xc420264000, 0x1213a6e)
	/home/travis/build/kubernetes/dashboard/.tmp/backend/src/github.com/kubernetes/dashboard/src/app/backend/auth/jwe/keyholder.go:170 +0x64
main.initAuthManager(0x13663e0, 0xc420265a40, 0xc4204d3cd8, 0x1)
	/home/travis/build/kubernetes/dashboard/.tmp/backend/src/github.com/kubernetes/dashboard/src/app/backend/dashboard.go:185 +0x12c
main.main()
	/home/travis/build/kubernetes/dashboard/.tmp/backend/src/github.com/kubernetes/dashboard/src/app/backend/dashboard.go:103 +0x26b
```

looks like I probably need `clusterAdminRole: true`

## still getting errors

whatever, `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc5/aio/deploy/recommended.yaml`

figuring out how to connect has been a doozy: looking at https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

```
[stuart@stuzzy ~]$ kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF
clusterrolebinding.rbac.authorization.k8s.io/admin-user created
```

for whatever reason this doesn't make an admin-user token, but `kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep default-token | awk '{print $1}')` gets me a token that works - but then I get a bunch of failed notifications

ah, I see, I forgot the user-creation step (more specifically, had been skipping it thinking it was superseded by the next section in the doc), now it works with the described procedure

## ingress take 2

```
kind: Ingress
apiVersion: extensions/v1beta1
metadata:
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
  selfLink: >-
    /apis/extensions/v1beta1/namespaces/kubernetes-dashboard/ingresses/kubernetes-dashboard
  uid: 15d6ce98-6b39-449e-ac43-c4e067dfbdc5
  resourceVersion: '15466'
  generation: 1
  creationTimestamp: '2020-02-28T15:01:13Z'
  annotations:
    nginx.ingress.kubernetes.io/proxy-read-timeout: '600'
spec:
  rules:
    - host: kubernetes-dashboard.stukrates.stuartpb.internal
      http:
        paths:
          - path: /
            backend:
              serviceName: kubeapps
              servicePort: http
```

still 404s

EDIT FROM THE FUTURE: MAybe because I had "kubeapps" as the service but "kubernetes-dashboard" as the host? smh
