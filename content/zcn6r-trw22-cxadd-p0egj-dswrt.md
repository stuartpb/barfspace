# Finishing stubernetes-core

copying all this into all the resources

```yaml
metadata:
  name: {{ template "weave-net.fullname" . }}
  labels:
    app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
    app.kubernetes.io/instance: {{ .Release.Name | quote }}
    helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}"
    app.kubernetes.io/name: {{ template "weave-net.name" . }}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels | indent 4 }}
{{- end }}
```

to replace this:

```yaml
metadata:
  name: weave-net
  labels:
    name: weave-net
```

also copying in `_helpers.tpl`

## replacing weave-net names

replacing `name: weave-net` with `name: {{ template "weave-net.fullname" . }}` as you'd expect

replacing `matchLabels` selectors with `app.kubernetes.io/name: {{ template "weave-net.name" . }}`

replacing the spec template label on the DaemonSet the same way

replacing other instances of `weave-net` (referring to resource names) with `{{ template "weave-net.fullname" . }}`

inserting the NO_MASQ_LOCAL variable in the same place as before - this should probably be a template thing, but

moving the images out to the values. Deciding to have the subchart use upstream and the root chart use Kubic's images

okay, a bit more work and screwing around recopying stuff and `helm template --dry-run . --generate-name --debug` comes out clean

I'm gonna go ahead and

```
kubectl create ns stubernetes-system
helm install -n stubernetes-system stubernetes-core .
```

## error

```
Error: DaemonSet in version "v1" cannot be handled as a DaemonSet: v1.DaemonSet.Spec: v1.DaemonSetSpec.Template: v1.PodTemplateSpec.Spec: v1.PodSpec.Containers: []v1.Container: v1.Container.ReadinessProbe: Name: Image: Env: []v1.EnvVar: v1.EnvVar.Value: ReadString: expects " or n, but found 1, error found in #10 byte of ...|,"value":1}],"image"|..., bigger context ...|pec.nodeName"}}},{"name":"NO_MASQ_LOCAL","value":1}],"image":":2.6.4","name":"weave","readinessProbe|...
```

derp I had to retype the `NO_MASQ_LOCAL` thing at some point and didn't quote the "1"

```
[stuart@stushiba stubernetes-core]$ helm install --replace -n stubernetes-system stubernetes-core .
NAME: stubernetes-core
LAST DEPLOYED: Fri Jun 26 21:01:39 2020
NAMESPACE: stubernetes-system
STATUS: deployed
REVISION: 2
TEST SUITE: None
```

:sunglasses:
