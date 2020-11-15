# The Storberry rook-ceph cluster iteration

After much deliberation, I've decided I'm not going to change the name of the rook-ceph namespace (as it's one-cluster-per-namespace, as Rook's isolation mechanism)

but I considered it. I'm not sure, if I do ever extend storage devices out to x64 nodes, I'd want them to be in the same Ceph cluster, or if I might return to seriously considering spanning out to remote nodes...

I feel that I'd be painting myself into a corner less by letting the storberry name be an unofficial one (like "SUMAF")

Anyway, here's the philosophy and plan: if the Raspberry Pis can pitch in with general-purpose computing/hosting, that's great, but in general that's what stunster/stumez are for. they say the rule of thumb is 1MB of RAM for 1GB of used Ceph storage, so if the Storberry nodes all fill up their 2TB drives, then all the pods will have to evacuate to those two (though there ought to be adequate warning before that happens; deployments hitting resource limits, etc).

I've ordered a used RPi4 4GB and 2TB USB drive from Amazon: this is gonna be the new Stumethyst.

## retiring the USB drives
