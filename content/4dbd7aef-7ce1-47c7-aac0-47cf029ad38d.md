# Stubernetes

This is an experiment in using K3OS on an old Chromebook (now known as "studtop").

## See Also

- [Kubernetes note hub](f7ab56ca-06db-4c96-808f-4d0b0ee47819.md)
  - [General k8s Projects](950653f7-1ddf-4a58-a8bd-e3d2df544bb4.md)
  - [Idle k8s Research](fe193832-2ffa-4cd4-a458-ec2c73cbe9b3.md)

Logs of projects running alongside this:

- [Pluskube Org](5a693b09-a5ea-4305-a375-2aaff05f1048.md)
- [Wayside Org](3d49b071-e0f1-4c21-99f0-c8be7b2361dc.md)

## Hot Notes

- [Quick Access Commands/Links](8b628486-97a4-4439-a7ab-8cde0c7b6b59.md)
- [Household Internal IP Address Numbering Plan](13a3f35d-bc38-4427-85e7-30ce8352e1d7.md)

## system infrastructure plans

- [State of the Cluster](a4389025-9425-4fe1-ab3b-8d086bce6a13.md)
  - [State of Stateful Storage](c43b76d1-1f70-493e-ade8-1fe2bcba0a03.md)
- Pending Plans:
  - [Internal / External ingresses / proxy outlay](911b54f8-89e0-4b92-a07c-cfee57f69d7a.md)
    - background:
      - [dialing the IP block back massively](07e52fe5-91ae-4f98-a565-dcf10e3232c2.md)
      - [total service restructuring](de490ea9-f480-4e03-a671-0d1173753c53.md)
    - [Internal Service Household DNS](9c5c2983-d09d-46de-aace-207223bc82a6.md)
      - [Ingress-less Internal Services](2bb638db-594b-448d-a643-988be98d612c.md)
      - [Using external-dns Internally](5027bedf-e8e5-4900-ac7f-c988a4b89b32.md)
  - [Structuring address.expose](cc62331b-165f-445a-ac1c-7166e0d25591.md)
    - [namespace for exposed-system ingress server / forwarding components](78628f7d-78e4-440c-a92e-c60f9f09be7b.md)
  - [Auth layers](3742c69e-5707-449a-a23c-ae56f2931114.md)
  - [Exposing Home Services](a7a4dc01-33cc-4466-aac4-582dcb86e8e3.md)
- vaguer possible future-addressable concerns:
  - [distributing internal certificate?](b07aa324-ac8d-4b4d-99d2-d0dd11168b4a.md)
  - [mDNS on k3os?](7aac9bcb-56da-4767-88e2-fc7e36fe4a1a.md)
    - [mDNS Within Kubernetes](82344970-ee2e-4830-9c30-d14d8c4f0f55.md)
  - [other vitamins](6eaacf19-314a-4d54-a197-8ee0430f6273.md)
    - [rootlesskit](8f3bc39c-c54d-4156-958d-5571e353309b.md)
    - alternate network layer (ie. calico)
    - ipv6
  - [out-of-band management](4c4ef560-d283-4665-8fcb-25c2addd9253.md)

## application plans

- [Suite Brainstorming](a6b94843-8569-4a45-a25d-ae69a2d9fc22.md)
  - maybe some [home automation](92b3ba74-2df9-4879-9e9c-234421cece41.md)
  - torrent box to hard drive
  - something like syncthing or a Dat server
  - Mastodon
- [Notestack workspace](40517705-1f53-4629-8fe3-cc6733bcf3b0.md)
- probably starting a stuartpb namespace with a CouchDB server on it that I can sync my Tabalanche tabs to
- [random ssh gateway idea](b2c1365f-1a45-40a7-a853-1863eef58c38.md)
- [TensorFlow via Coral](09282b35-a21c-4c97-a5ed-7f015d6735d1.md)
  - Voice recognition for an Alexa clone

## logs

- 2019-08-14: [operation](7c4b615a-033c-4230-97f7-0e91139b5c9a.md)
- 2020-02-28:
  - [creation](c83c7062-d45b-411b-9420-0db45f85be2b.md)
  - [ranching](8feab719-bfad-45ac-938e-3ccb9f8c9e72.md)
  - [dashboard confession](45fb7e26-f342-4cd3-814c-5e9ac43af602.md)
- 2020-03-04: [disabling wifi](8e14bac7-619e-42a3-9730-8355005383c5.md)
- 2020-03-05: [the new plan](aea5717c-3578-4b53-a070-7677e36b1d04.md)
  - [first steps: switching to MetalLB](27f5f508-d869-4292-9036-30fc0ccaf014.md)
- 2020-03-06:
  - [setting up cluster access on stushiba](b9a55188-647f-4cd0-ab69-6df7e25ccb24.md)
- 2020-03-19: [setting up address.exposed](07e52fe5-91ae-4f98-a565-dcf10e3232c2.md)
- 2020-03-31: [executing](515478b1-74db-434c-9949-1053d46aa653.md)
  - this is where I ran into a couple enormous hitches and petered off for a month and a half
- mid-May 2020: [latest shenanigans](de490ea9-f480-4e03-a671-0d1173753c53.md)
- 2020-05-20 or so:
  - [Cloning the bulk disk's old content away in the dumbest way possible](50db1a39-be99-42ff-ab74-ab0661d0ca2d.md)
  - [getting the cluster info into Git](a66292a0-b50c-42ac-971b-5cc23cf6e91a.md)
- 2020-05-23:
  - [formatting the disk](d5d05f3d-21b7-4445-ac6b-8d0e3f483f37.md)
  - [fixing cluster-dns](38a68c9c-c6af-43a8-a24c-2d2300528464.md)
  - [in which we actually do the thing we meant to do all week](965ae40d-d67d-4adc-aef6-727290dc44c4.md)
- 2020-05-24: [Things to Do in Kubernetes When You're Done Fucking with Longhorn](3bfb1a24-ca82-41f0-a2b0-fa8a0ba7d8b8.md)
  - [setting up an ingress](3758cf1a-01a7-4529-8344-9f4e621eb8c7.md)
- 2020-05-26: [Trying out household-workspaces](98583255-8ee5-4d4d-aade-92dbdde01f63.md)
- 2020-05-27: [The SkyDNS half of household-dns](598de530-7e33-44eb-83ce-e15edf3a5405.md)
- 2020-05-28:
  - [Finishing the CoreDNS half](84be6927-2ff2-461b-9078-86d31e9f3509.md)
  - [Making it work](219b93f6-2ec1-4c82-9d8b-e2919417cbb3.md)

## other useful links

- https://kubernetes.io/docs/tasks/access-application-cluster/access-cluster/#manually-constructing-apiserver-proxy-urls
