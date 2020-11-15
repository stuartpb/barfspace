# Silencing the wpi-pearl fan

I think I'll add a `st8s.testtrack4.com/hats` as a label to identify nodes that need the daemonset for a specific set of hardware to apply to them, ie. for driver rollout

`kubectl label node wpi-pearl st8s.testtrack4.com/hats=argon1`

now I've written a DaemonSet, and while I'd love to have it rolled out as part of the system, I'm still working that one out, so I'm going to try creating the namespace and DS manually

Okay, I created the DaemonSet:

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: argononed
  namespace: argononed
  labels:
    app.kubernetes.io/name: argononed
spec:
  selector:
    matchLabels:
      name: argononed
  template:
    metadata:
      labels:
        name: argononed
    spec:
      nodeSelector:
        st8s.testtrack4.com/hats: argon1
      tolerations:
      - key: node-role.kubernetes.io/master
        effect: NoSchedule
      containers:
      - name: argononed
        image: docker.io/jmercha/argononed
        securityContext:
          privileged: true
```

okay, so, it's deployed, but nothing's happening. I look at the pod and there are no logs - unsurprising, considering

I SSH into the node and `crictl exec -it f87dc bash` to root around in the node. First up:

```
root@argononed-phdp9:/# systemctl status argononed
● argononed.service - Argon One Fan and Button Service
   Loaded: loaded (/lib/systemd/system/argononed.service; enabled; vendor preset: enabled)
   Active: active (exited) (Result: exit-code) since Sat 2020-10-10 02:06:23 UTC; 32min ago
  Process: 53 ExecStart=/usr/bin/python3 /usr/bin/argononed.py (code=exited, status=1/FAILURE)
 Main PID: 53 (code=exited, status=1/FAILURE)

Oct 10 02:06:23 argononed-phdp9 systemd[1]: Started Argon One Fan and Button Service.
Oct 10 02:06:23 argononed-phdp9 python3[53]: Traceback (most recent call last):
Oct 10 02:06:23 argononed-phdp9 python3[53]:   File "/usr/bin/argononed.py", line 3, in <module>
Oct 10 02:06:23 argononed-phdp9 python3[53]:     import RPi.GPIO as GPIO
Oct 10 02:06:23 argononed-phdp9 python3[53]:   File "/usr/lib/python3/dist-packages/RPi/GPIO/__init__.py", line 23, in <module>
Oct 10 02:06:23 argononed-phdp9 python3[53]:     from RPi._GPIO import *
Oct 10 02:06:23 argononed-phdp9 python3[53]: RuntimeError: This module can only be run on a Raspberry Pi!
Oct 10 02:06:23 argononed-phdp9 systemd[1]: argononed.service: Main process exited, code=exited, status=1/FAILURE
```

Now, I know why this is, and there's [a patch to fix it](https://github.com/kounch/argonone/tree/feature/RaspberryPi4), but that patch hasn't been applied in this image. So, my plan is to:

- make a workspace on arm
- make a buildah script from the Dockerfile, but for the RPi4 feature set
- push, use, etc.

For a while, the fan was really annoying, but that was a problem with how it was sitting in the case: I opened the lid and poked around a bit, and it's much quieter now. I was thinking about setting up a pod and adding a LoadBalancer service to connect to it directly, but that looks unnecessary now.

## actually, further development might be needed

[Why Rewrite and How](hn0wg-nmmyk-gda0a-5thr1-scrvd)
