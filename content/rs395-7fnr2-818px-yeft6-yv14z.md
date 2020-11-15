# Stubernetes Monitoring and Instrumentation

I have the default prometheus-operator chart installed, with no modifications (either within the cluster or Grafana).

## Things that would need to happen

- [](j79pg-7bey6-r599n-g4zrj-dzfy3)

Grafana would need some kind of persistent volume store for new views. This should be provisioned as Work.

Prometheus should probably have persistent storage for its data, too. I'm realizing that instrumentation is kind of a different class of data from what I had generally classified as "bulk": you want to have it on hard disks, just like other "big data", but you still want more than one copy, since you want redundancy in case, you know, you need to recovera damaged file to figure out why the system was failing.

is there a normal way to get Longhorn to copy across different disks? Like, if I have two magnetic-platter disks and one SSD, I want one copy on the SSD and one on a hard disk?

anyway, I'm gonna go with "bulk" for now. I'm also thinking abut

Prometheus plans make up a good chunk of [Planning and Exploration](kb2g7-vd6v4-039jt-yhx56-hhr8s)
