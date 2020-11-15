# Stubernetes Round 1 Plans and Investigations

Note that this revision died with the rest of [Studtop Mark I](kbryw-6dc19-r18n7-6pg5d-4aqwf) in the process of enacting the [June 5 2020 Sprint](0ybvg-vc5qr-wv8pq-y58xr-2da4r)

structures below should probably get moved into State of / Department hubs

## Immediate plans

- [Internal / External ingresses / proxy outlay](j4dn9-y49w2-wja0z-6fxsb-zd7bt)
  - background:
    - [dialing the IP block back massively](0zjjz-schnv-wraas-ewy47-34cp2)
    - [total service restructuring](vs4gx-afmg3-g3acw-8d25s-qaf2k)
  - [Internal Service Household DNS](khe2k-0ygkn-ryank-h0e8h-vs0m6)
    - [Ingress-less Internal Services](5ev3h-pts9d-4dacg-wrhfm-rtrac)
    - [Using external-dns Internally](a0kvx-qz8wp-80arz-y9h2j-bh6rj)
- [Structuring address.expose](shh36-6rpbx-4tar7-3hcvg-d4nch)
  - [namespace for exposed-system ingress server / forwarding components](f1h8y-zbrwh-0cajb-p61yf-gkfmv)
- [Auth layers](6x1cd-7jq0x-5ta4f-5eavs-9649m)
- [Exposing Home Services](myjdr-09ksh-46anh-2r5q5-rdt83)
    - [Authn layers (ie. oauth2-proxy / Dex)](9t7zc-egtyn-tf8jk-naez4-5kegg)

## Other further-future/less-urgent plans

- [distributing internal certificate?](p1xa6-95chp-wd9km-pgvm8-hd2wa)
- Flux for maintaining the cluster state in Git
  - stubernetes-setup is currently a little gimpy
  - will Flux let me put everything in a subpath, so "k3os hacks" can still live in the Git tree?
- [mDNS on k3os?](fap9q-jtpv9-w78hr-qwfrv-fwjgt)
  - [mDNS Within Kubernetes](g8t4j-w7e5t-0g9rc-6h9p6-4y3wn)
- [other vitamins](dtncy-69h9b-ama35-wew11-gyrkk)
  - [rootlesskit](hwxw7-7659m-cp9b3-ane7h-n6c4v)
  - alternate network layer (ie. calico)
  - ipv6
- [out-of-band hardware management](9h7fa-r6jgd-m58zj-s5rap-xv4mk)

## issues under investigation

- [proactive diagnosis and discovery](w48nw-xv2z8-85aqf-5xg70-h338d)
- [household-dns throwing up at normative load](pwsfq-4r7tk-41a1r-9gds5-ck2hn)
- [kubeapps and its stupid cron jobs](32jav-e13x7-w9avt-np3a6-gezmv)

## Alerts that should be set / dashbaords to add

- I should be able to see the power usage of the system on battery, and I should get a notification
- I might want to get notifications for certain classes of error anyway.
- I ought to look into setting this up with an API key to send email by Fastmail.
- Woah, is there a way to set it up so I get notifications through the Push API in-browser?
