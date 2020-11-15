# Studtop Mark I

The cluster under Studtop Mk 1 was a standard k3os installation, written directly to the internal storage of a (warranty-voided) Toshiba Chromebook 2.

## State of the Cluster at Termination

- A static hostname has been set.
- My GitHub user has ssh key access.
- Deployment of servicelb is disabled, and `metallb` is installed.
- kubernetes-dashboard and kubeapps are installed.
  - The cluster name has been set to "Stubernetes" in the dashboard.
- The native `coredns` manifest has been replaced with a similar `cluster-dns`.
  - A stub manifest exists to recreate the `coredns` ConfigMap, to support k3s's "NodeHosts" item.
- The native local-volume-provisioner has been disabled and Longhorn has been installed from its Helm chart.
  - A udev rule to automount partitons with a specific UUID is added in config.yaml.
- The native `traefik` ingress has been replaced with a `household-ingress` app (based on Traefik's own Helm charts for Traefik 2) in `household-system`.
- The stable/prometheus-operator chart has been installed with default values.

Other things that were in progress:

- A couple Longhorn rules had been specified for storage classes that were expected to be in use.
- A few PersistentVolumes were in place

the [State of the Cluster](mgw90-9cm4r-01ape-wd11n-wwtgk) almost described the complete-rebuild of this K3OS system, but after that failed and we went to Kubic it ceased to matter.

## Other buried pages from this generation

Pages going down with the ship, to be salvaged later by their successors:

- [the Mk1 Notestack Household Workspace](cy160-n7d4r-g681j-axcxz-6n35t)
- [Planning and Exploration](kb2g7-vd6v4-039jt-yhx56-hhr8s)

## Logs

- 2019-08-14: [operation](fh5p2-pg37g-jg9fx-rej49-spq4t)
- 2020-02-28:
  - [creation](s0y70-rpmbc-8v988-0dphf-rbfjb)
  - [ranching](hznbe-6dznn-cc973-hwsef-rs7mj)
  - [dashboard confession](8qxqw-9qk8b-6k82k-2ykb2-3nxg2)
- 2020-03-04: [disabling wifi](hrabn-hv1kr-m39ec-43am0-570y5)
- 2020-03-05: [the new plan](ntjq2-z1nf2-wka0w-3pezh-pp784)
  - [first steps: switching to MetalLB](4ztza-26rd4-nj90d-hgzg6-cnw0m)
- 2020-03-06:
  - [setting up cluster access on stushiba](q6jn3-234fz-8gapt-bdyzh-5sjr4)
- 2020-03-19: [setting up address.exposed](0zjjz-schnv-wraas-ewy47-34cp2)
- 2020-03-31: [executing](a5a7h-cbmvc-tc9jj-8gafa-6n9mk)
  - this is where I ran into a couple enormous hitches and petered off for a month and a half
- mid-May 2020: [latest shenanigans](vs4gx-afmg3-g3acw-8d25s-qaf2k)
  - [Sprint summary](8339y-brw22-r6a82-ydtx6-8w9pz)
- 2020-05-20 or so:
  - [Cloning the bulk disk's old content away in the dumbest way possible](a3dhm-edyk4-rzapx-5b0sg-x1jgd)
  - [getting the cluster info into Git](msh95-85n1g-mc9e6-twr8y-fdt8t)
- 2020-05-23:
  - [formatting the disk](tq85y-f91px-45art-wd1rz-mgfrq)
  - [fixing cluster-dns](72k8s-766nw-x8a4k-1d4c0-55134)
  - [in which we actually do the thing we meant to do all week](jsde8-3epfp-rwaxx-kjea8-drh84)
- 2020-05-24: [Things to Do in Kubernetes When You're Done Fucking with Longhorn](7fxhm-96ag8-gga5c-7th85-tfp6r)
  - [setting up an ingress](6xccy-6g1mx-9986h-4z9sh-1xe67)
- 2020-05-26: created the [household-workspaces](k1c34-ncewq-cdanq-mjvfe-y07w3) namespace
- 2020-05-27: [The SkyDNS half of household-dns](b66ya-c3y6d-8b87k-q1bvf-kmn05)
- 2020-05-28:
  - [Finishing the CoreDNS half](gjz6j-9sfy9-gv90y-46tcf-9yd89)
  - [Making it work](46ds7-xher7-429v2-z2j6a-1fjwk)
    - fixing MetalLB issues caused by k3os's redeployment
    - reverting etcd's rbac
    - starting the router rollout
- 2020-05-29: [o brave new world, that has such servers in't(ernal)](cbepz-whfkc-8cap1-8c26n-ws9wb)
- 2020-05-31: [let's make this simple](zrfr8-hk2k0-mka1b-eta4m-nmkpy)
- 2020-06-01:
  - [dialing back household-dns for the moment](pwsfq-4r7tk-41a1r-9gds5-ck2hn)
  - [installing prometheus-operator](8qp0x-e05wx-tdav3-hhaf1-3pkcf)
  - [fixing the server clock](mneqg-y52kf-8fa2m-acznv-5xew8), ooh wee
  - [Persistent Storage to Make the Workspace Work](agjgk-05zhg-y7a0a-6r713-7qesk)
- 2020-06-03:
  - [We have self-hosting notes, repeat, we have self-hosting notes](2ncae-q5n8d-9da26-enghc-n8ydb)
  - [USB peripheral FAIL](grtqq-msqef-whbrh-rtn70-4wpgp)
- 2020-06-04:
  - PLAN START: [adding more space](wp9bz-01xt9-m996k-s3ejj-8ec4d)
    - this was what killed the installation, pretty much
- 2020-06-05:
  - PLAN START: [Upgrading the Prometheus Operator Chart](zntt9-433t9-rpa7r-x6sb8-66kbx)
    - aborted due to failure of container-opt move
- 2020-06-07:
  - [The Plan for Introducing the containerd-opt Flash Drive](s3e2q-qae76-rq8hh-ew3mm-m2ncq)

