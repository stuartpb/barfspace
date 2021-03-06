# Stubernetes Plan for 2020-05-13

address.exposed is too complicated for now

I'm gonna make my goal for the day to make it so I can have some kind of container with a local volume for, like, SSHing into from the pocketchip, fuck I don't know

did I even do that thing with the DNS? I think this is where my head started to hurt because of k3s's shenanigans

so I guess that's kind of the thing I really want: to rip out all the k3s service definitions I can

## The New Plan

Okay, so, you know what, fuck all of k3s's service names per https://github.com/rancher/k3s/issues/1797

Like, they're planning on switching the ingress server? but they named the document `traefik`, so they're going to have to delete documents named `traefik` at some point if they want to do that.

I'm gonna propose a new issue soon that suggests switching to these with a `k3s-` prefix later, but for now, I'm going to name each component by *what it does*, so the underlying implementation can be swapped entirely by just updating the doc.

so these docs in `kube-system` would move:

- `coredns` -> `cluster-dns`
  - this also makes it less awkward to have a second CoreDNS instance for `external-dns`
- `servicelb` / `metallb` -> `load-balancer`
- `local-path-provisioner` / `longhorn` -> `persistent-volume-provisioner`
- `traefik` -> `ingress`

aborted comment from the aforementioned GH issue (I'll just post the issue when I'm ready):

> Thinking about it a little more (and doing a code search to discover that, despite #1382's closure, k3s hasn't *quite* removed `--no-deploy`), I'm planning on reworking my cluster to use documents named

The case that I'll make in said issue is that, per https://github.com/rancher/k3s/issues/817, it doesn't make sense to stick with an implementation as the name if you think you might change the implementation

## Getting ready for Longhorn

Put a new flash drive in the USB hub

SSHed in

`sudo mkfs.ext4 /dev/sdb1`

## 2020-05-15: before I do anything else

rather than get fancy and figure out the upgrade operator, for right now I'm just gonna run [the update commands](https://github.com/rancher/k3os#manual-upgrades) via ssh--

nah, wait, it says they're deprecated...

trying to visit the dashboard the hacky way I normally'd do it, by going to https://192.168.0.23:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/ and copy-pasting the credentials from .kube/config into the browser login prompt, fails with a 503 after authentication...

I just straight up do `sudo reboot` from SSH to see if that'll fix it?

hmm, no, it's still not there...

looking into doing `kubectl get logs`, I notice I have to update the IP in my `.kube/config`

okay... I was gonna say "let me restart the pod", but oh, right, I just restarted the node (uptime had been 77 days)

uhh...

let's see if we can't upgrade this node, maybe that'll do something

`kubectl edit node studtop`... uhh...

okay, looking at `kubectl edit -n k3os-system plan/k3os-latest` (ganked from https://github.com/rancher/k3os/issues/415), it looks like it did update to v0.10.1 after I rebooted

uhh, doing `kubectl proxy`, then going to https://192.168.0.23:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login, works. TODO: figure out what that's doing that hooks up the endpoint

`kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')` retrieves the token I need (pulled and corrected from [this late-February log entry](hznbe-6dznn-cc973-hwsef-rs7mj) - the version listed there pulls the token for the wrong user, not sure where I got it from)

## checking on on kubeapps

https://192.168.0.23:6443/api/v1/namespaces/kubeapps/services/kubeapps:http/proxy/#/login

getting operator token via `kubectl get -n default secret $(kubectl get -n default serviceaccount kubeapps-operator -o jsonpath='{.secrets[].name}') -o go-template='{{.data.token | base64decode}}' && echo`

oh, right, this is one of those things that doesn't work when using the proxy, because it uses Authentication headers that conflict with the proxy layer or something

## minor dashboard tweak

setting name to "Stubernetes"

## anyway

using `kubectl port-forward -n kubeapps svc/kubeapps 8080:80` to connect to kubeapps

looking at apps in all namespaces with `http://127.0.0.1:8080/#/apps/ns/_all`

## upgrading kubeapps

setting `ingress.enabled` to `false` in anticipation of the next bit, and setting `ingress.hostname` to `kubeapps.stubernetes.internal` for what comes after that

oh, I neglected to update the chart version. let's try again

okay. the first change went through normally: the second, I had to restart the port-forward

## let's remove traefik

This is gonna be multi-pronged...

actually... fuck it, let's see if k3s can REALLY disable this. I think it can't, honestly

SSHing in and changing the last lines of `/var/lib/rancher/k3os/config.d/20_k3s-args.yaml` to express `--disable servicelb,traefik,local-storage,coredns`

[confirmed that comma-separation works](https://github.com/rancher/k3s/blob/master/pkg/cli/server/server.go#L172) per https://github.com/rancher/k3s/pull/851

editing /var/lib/rancher/k3s/server/manifests/coredns.yaml to change all the "coredns" names to "cluster-dns", and to change the image back to coredns/coredns

saving that back as `/var/lib/rancher/k3s/server/manifests/cluster-dns.yaml`

## installing Longhorn

man, this would be nicer if [Rancher had a Helm Repository](928mt-hnpcr-w9a9k-97jed-wj6g8)

I'll install from Helm from Stushiba [according to the official guide](https://longhorn.io/docs/0.8.0/install/install-with-helm/)

`git clone git@github.com:longhorn/longhorn.git` from my workspaces dir

`kubectl create namespace longhorn-system`

`helm install longhorn ./longhorn/chart/ --namespace longhorn-system` after running `yay -Sy helm` (approximately- I realized I didn't have Helm on Stushiba yet, as I've only done this on stuzzy thus far)

## managing longhorn

https://192.168.0.23:6443/api/v1/namespaces/longhorn-system/services/longhorn-frontend:http/proxy/ causes problems which isn't too surprising

doing `kubectl port-forward -n longhorn-system svc/longhorn-frontend 8069:80` to get it forwarded locally

uhh, it says I have 461 Mi schedulable

Okay, going to `http://127.0.0.1:8069/node` and looking under the "Operation" column gives me the tools I need to edit this mode's storage...

I'm not going to do any of this right now, though: it doesn't see the unmounted USB drive that's plugged in, and I'm not gonna bother tweaking it

brainstorming how this might work better will commence under [A System for Disks](p1x7s-5g41m-4tamz-wjwg0-zxvg8)

## anyway

Let's see what happens when we `sudo reboot`

Sure enough, reestablishing the connection to Kubeapps we see that Traefik has been removed.
