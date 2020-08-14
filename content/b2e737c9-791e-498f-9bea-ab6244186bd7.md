# houston, we have cluster

running `kubectl get nodes`

```
studrang.nodes.403.stuartpb.com   NotReady   <none>   18s   v1.18.4
studtop.nodes.403.stuartpb.com    NotReady   master   25h   v1.18.4
```

oh wait, *not* ready

after a bit, studrang is ready... but studtop seems to find itself unreachable?

oh herp derp. same hostname problem. set it and restarted kubelet

```
studrang.nodes.403.stuartpb.com   Ready    <none>   5m56s   v1.18.4
studtop.nodes.403.stuartpb.com    Ready    master   25h     v1.18.4
```

alllloalloallo
