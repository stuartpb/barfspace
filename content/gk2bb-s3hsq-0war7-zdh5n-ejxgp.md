# Stubarks

it's like a little computer I got for $35 from Walmart, it's such a piece of shit, I love it so much

This is the most "pet" of pet systems

[background](0c3q1-p7qgw-rr8j3-523s2-yan0d)

## important tables

- [Build and model numbers](xzchg-e0wee-42ahw-k69bg-k4z05)
  - [internal chip model info](ryp2z-4jahp-889c2-vg9vs-nfr4r)
  - [info about other Voyager models by contrast](4zhyx-qw3tf-4t943-h7wgr-3g0en)
- [scatter file in recovery log](djaep-jyejg-4waps-7ygwf-4k4re) (partition offsets)
- [output from fastboot getinfo all](cpnw8-mvw3r-ye9b5-5130t-27dys) (has parition sizes)

Note that scatter-file-info is kind of redundant if you've imaged the whole device (or even just the first part) because this metadata is also specified in GPT form

## ongoing

- [getting upstream kernel source](vv13g-a5qqa-gqa07-1pe7x-vj3he)

## day-by-day logs

- 2020-03-11:
  - [pmbootstrap init on stuzzy](0qx01-0psny-939g9-50kz9-qdj84)
  - [the first snag](rwesa-wgs67-c6ap7-3nez3-cay0m)
- 2020-03-12: [various approaches to attaining the boot img](t0t1e-77c0t-w3ajw-xbhvh-jcc04)
  - [getting to know SP Flash Tool](ptd3n-nsprs-cca76-n41kv-hv298)
  - [dumping ROM to Stushiba](f0bth-zz6f7-rv9fd-wxs3h-17f67)
  - [mucking around with Windows dead-ends](phmkn-2mesm-c5a7v-zp3p8-m98fv)
- 2020-03-13:
  - [manipulating the dumps on stushiba](hehse-b5bbn-r4awm-p6xg0-1pj4c)
- 2020-03-13: [back over to Stuzzy](kb1k1-94ywc-45a59-b2a9d-82fgh)

## more links to save

- https://www.reddit.com/r/postmarketOS/comments/c4d917/is_it_possible_to_port_postmarket_os_to_mediatek/
- https://wiki.postmarketos.org/wiki/Mediatek
  - https://wiki.postmarketos.org/wiki/Mediatek:Flasher which is a total stub
- https://forum.xda-developers.com/android/development/tool-cika-carliv-image-kitchen-android-t3013658

general complaints:

- https://www.reddit.com/r/LineageOS/comments/a8ax0n/mediatek_development_problem/

also looking at https://forum.xda-developers.com/android/development/amazing-temp-root-mediatek-armv8-t3922213 but noting the thing where dm-verity will likely screw that up
