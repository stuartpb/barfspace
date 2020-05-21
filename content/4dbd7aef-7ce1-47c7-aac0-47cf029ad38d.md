# Stubernetes

This is an experiment in using K3OS on an old Chromebook (now known as "studtop").

## See Also

- [Kubernetes note hub](f7ab56ca-06db-4c96-808f-4d0b0ee47819.md)
  - [General k8s Projects](950653f7-1ddf-4a58-a8bd-e3d2df544bb4.md)
  - [Idle k8s Research](fe193832-2ffa-4cd4-a458-ec2c73cbe9b3.md)

## system infrastructure plans

- [State of the Cluster](a4389025-9425-4fe1-ab3b-8d086bce6a13.md)
  - [Internal / External ingresses / proxy outlay](911b54f8-89e0-4b92-a07c-cfee57f69d7a.md)
    - background:
      - [naive formulation](aea5717c-3578-4b53-a070-7677e36b1d04.md)
      - [discovering the DNS won't work that way](515478b1-74db-434c-9949-1053d46aa653.md)
      - [dialing the IP block back massively](07e52fe5-91ae-4f98-a565-dcf10e3232c2.md)
      - [rethinking the internal/external ingresses](2bb638db-594b-448d-a643-988be98d612c.md)
      - [total service restructuring](de490ea9-f480-4e03-a671-0d1173753c53.md)
    - [Ingress implementations](948d361e-7a98-43a0-9bad-37bc4ff982ec.md)
    - [serving at least one DNS](ce6da281-bfd6-4c42-a1e9-31e8fda39c08.md)
      - [External DNS for internal/external use](5027bedf-e8e5-4900-ac7f-c988a4b89b32.md)
  - [Longhorn / storage / volume provisioning plan](4359d3b6-185b-40b3-8f00-64c8f1b4b528.md)
    - [Cloning the bulk disk's old content away in the dumbest way possible](50db1a39-be99-42ff-ab74-ab0661d0ca2d.md)
    - [More thoughts about the disk structure](1cf35c69-7e2c-42ba-ac03-ee5258cf426a.md)
    - [More thoughts about the storage classes](c3e85735-1074-4db1-aa59-bf38afb16fa3.md)
    - [Thoughts on a deeper construct of storage class](ec256287-bb4b-4ed3-9417-72f37eb4d063.md)
  - [Structuring address.expose](cc62331b-165f-445a-ac1c-7166e0d25591.md)
  - [Auth layers](3742c69e-5707-449a-a23c-ae56f2931114.md)
  - [Storage Mounting](b07a7c96-040d-405a-aa7f-92e401feede8.md)
- vaguer possible future-addressable concerns:
  - [distributing internal certificate?](b07aa324-ac8d-4b4d-99d2-d0dd11168b4a.md)
  - [other vitamins](6eaacf19-314a-4d54-a197-8ee0430f6273.md)
    - rootlesskit
    - ipv6

## application plans

- maybe some [home automation](92b3ba74-2df9-4879-9e9c-234421cece41.md)
- torrent box to hard drive
- something like syncthing or a Dat server
- Mastodon
- [random ssh gateway idea](b2c1365f-1a45-40a7-a853-1863eef58c38.md)
- [other stuff I wrote originally](aea5717c-3578-4b53-a070-7677e36b1d04.md)

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
- 2020-05-20 or so: [getting the cluster info into Git](a66292a0-b50c-42ac-971b-5cc23cf6e91a.md)

## other useful links

- https://kubernetes.io/docs/tasks/access-application-cluster/access-cluster/#manually-constructing-apiserver-proxy-urls
