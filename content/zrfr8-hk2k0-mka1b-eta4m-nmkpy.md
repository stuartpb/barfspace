# getting real simple with deploying a first code-server

after [lots of fancy planning](1ya73-jmkrb-pd855-c48tg-rhem4)

codercom/code-server

## a momentary weird name resolution blip

try to go to https://dashboard.stubernetes.internal/ but it's not working... what did my resolvectl screw up now?

let's try removing `mdns wins` from `hosts: files mymachines myhostname mdns wins resolve [!UNAVAIL=return] dns` in my `/etc/nsswitch.conf`

no, still broken

huh, well, in trying to debug [as described here](https://unix.stackexchange.com/a/432077/7733), restarting the service seems to have fixed this...

and then it stops workung again, ffs. Okay, let's put debugging back on, and we'll dive in if this happens again...

## anyway

I'm gonna be basic and use the creation form in the dashboard

calling this "notes-code-server"

selecting codercom/code-server as the image

showing additional options and choosing `household-workspaces` as the namespace

setting up a service with TCP 80 target 8080

hitting deploy

## once it's deployed

giving it an internal name by adding this to the service:

```yaml
  annotations:
    external-dns.alpha.kubernetes.io/hostname: notes.workspaces.internal
    hhk8s.stuartpb.com/internal-name: coredns
```

it's been "ContainerCreating" for at least 5 minutes. It's probably taking a while to download the image because it's based on Debian, but like, how do you check the image fetch progress? Shouldn't there be something on the dashboard for that?

## another name resolution failure...

looks like this time it came from the cache having `NXDOMAIN`?

anyway, restarted systemd-resolved again, can access notes.stuartpb.internal

## connecting

didn't set up a ConfigMap, so I have to go to the Pod's shell on the Kubernetes Dashboard to `cat .config/code-server/config.yaml` for the password

once that's done... `<hacker voice> i'm in`

## okay, so, we've got a workspace

next steps to make this practical:

- create our "Stuart's household workspaces" ssh key as a cluster secret
- make PersistentVolumeClaims with class "work":
  - make a PersistentVolumceClaim for an overlay? or at least the workspace directory
  - make a PVC for the VS Code configuration

useful stuff after that:

- yeah, even a self-signed HTTPS would be nice
  - maybe we get these notes behind an Ingress
  - remember the codercom docs suggest oauth2-proxy or Dex

## about to take the next step

Aaand the dashboard fails again

## oh, but of course

checking the journalctl for systemd-resolved:

```
Jun 01 04:04:07 stushiba systemd-resolved[1743160]: Cache miss for dashboard.stubernetes.internal IN A
Jun 01 04:04:07 stushiba systemd-resolved[1743160]: Transaction 43857 for <dashboard.stubernetes.internal IN A> scope dns on enp4s0/*.
Jun 01 04:04:07 stushiba systemd-resolved[1743160]: Using feature level UDP+EDNS0+DO+LARGE for transaction 43857.
Jun 01 04:04:07 stushiba systemd-resolved[1743160]: Using DNS server 192.168.0.1 for transaction 43857.
```

oh. duh. secondary gets load-balanced, not fallbacked. well, there goes that whole dream

(UPDATE: it's more likely that sd-rd was running into [the failures I would notice next morning](pwsfq-4r7tk-41a1r-9gds5-ck2hn), but it's still a bad idea to have a secondary DNS server that doesn't match the first one, as the system will heuristically *switch* to it if encountering trouble, not just fall back per query, and will cache its NXDOMAINs)

removing that secondary definition from the DHCP settings on my router, then restart NetworkManager and sd-rd (also removing the override for sd-rd since we figured that problem out)

UPDATE: This looks like it wasn't enough - I had to specify the same IP twice, then restart NetworkManager

Aand now it's falling back to the IPv6 DNS server... great

turned off "Automatic DNS" for DHCPv6 which I'm assuming goes straight to the ISP

anyway, now back to our original story

## ok, right, I made key creation *really* easy

I just go to initkey.com and hit "Generate"

Then I go to the Resource Creation on the Dashboard and enter this (obviously I'm not including the actual private key)

```
apiVersion: v1
kind: Secret
metadata:
  name: household-workspace-ssh
type: Opaque
stringData:
  id_rsa: "-----BEGIN RSA PRIVATE KEY----- <screaming> -----END RSA PRIVATE KEY-----\n"
  id_rsa.pub: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfKZ+W4OyyctA80m1gLowD/8tTJLf/0ku1g67+EriDzPJeiy53F+O5ot/wN4riwvYWY7avPTtFPb67J8B1JaONeB0x8UNkcfaCOfCOBr0oboGji/P+Xo6o+ynLw2XbTMrcLTZqXmGgUSHTosloozRgw9a1oXB3Cr3kBNpUYc1cJxrcZQx9qlkpthbwbbmTDoiZ2lH8N4cVL+Cl7r4mXv2bWXdiyu2TMDL4INJvWLq8uzGTv+TRni13qWiozRanR0ANwqLBo8DPEHKtUGV9kbEE8nvH8zKWicHpzFkCtzObEHR3g9YaVTMbKmFcechSuq4ri2AN0Xp4MWgcBsM7AAwv\n"
```

setting the spec in the deployment to look like this:

```yaml
    spec:
      containers:
        - name: notes-code-server
          image: codercom/code-server
          resources: {}
          terminationMessagePath: /dev/termination-log
          terminationMessagePolicy: File
          imagePullPolicy: Always
          securityContext:
            privileged: false
          volumeMounts:
          - name: ssh
            mountPath: "/home/coder/.ssh"
      volumes:
      - name: ssh
        secret:
          secretName: household-workspace-ssh
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
      dnsPolicy: ClusterFirst
      securityContext: {}
      schedulerName: default-scheduler
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: code-server-no-auth
data:
  config.yaml: |
    bind-addr: 127.0.0.1:8080
    auth: none
    cert: false
```

adding this as a volume:

```
        - name: code-server-config
          configMap:
            name: code-server-no-auth
```

and this volumeMount

```
            - name: code-server-config
              mountPath: /home/coder/.config/code-server
```

and that works.

Now I just need the persistent volumes so any of this work can be meaningful...
