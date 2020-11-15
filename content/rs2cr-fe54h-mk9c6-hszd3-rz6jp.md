# IPFS vs Dat vs BitTorrent

Each one specializes in different stuff.

- Since Dat shines at appending, I'd say that Dat is best for streams and feeds. If you're distributing flatfile appending dump, Dat makes a lot of sense.
   - It's worth noting that a lot of publications can be modeled as "feeds"
- IPFS is good for blob deduplication. It's good if you're distributing, say, system images, or site snapshots, especially where you want to include a lot of "submodule" dependencies.
  - It's mutability facility is either DNS-based or a not-as-extensive-as-you-might-hope IPNS thing
    - Not sure how serving a specific IPNS image is meant to be: a microservice that never garbage-collects it?
    - Maybe pins are read and retrieved by a ConfigMap that a controller updates based on a CRD
      - And I guess that would let each node be responsible for negotiating retrieval?
- BitTorrent is good for coordinating around one big immutable body of heavy media, where you don't need deduplication or mutability
  - "deduplication" in the form of fingerprinting would be kind of awesome, though
    - continues through [torrent app wishlist](cmy5j-yt37s-eca07-4f1px-1pskr)

## when you want to pick IPFS vs Dat

IPFS is if you want to let your renders be transient.

Dat is if you're publishing something where you want to make access to previous versions easy

## Related

- Dedicated notes:
  - [IPFS](4g3s4-t7yp4-yx97b-ptzwy-tj1he)
  - [Dat](8ddf3-z8x3g-ppab4-dzm4g-m3g2h)
  - [BitTorrent](fhpaj-h3r2g-67a3e-jx6jy-0prf7)
- [The Decenthub](rhy2n-yjsw3-8yabd-bazs2-gkb26)
