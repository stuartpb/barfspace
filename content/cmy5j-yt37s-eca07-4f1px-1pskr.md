# features I'd like in a streaming-torrent-box platform or app or whatever

for the top project [tracked here](n4t1w-fr4pr-ctav0-xpd77-xkf8e)

- everything is a torrent. like, that's the native data structure. it's the only way to import: you give it a magnet link
  - this could maybe be expanded to the other distributed filesystems like Dat and IPFS
  - torrents are, at some level, indexed by content, right?
  - or, like, anyway, torrents are the current most common publication format
    - you could maybe have a torrent-to-ipfs gateway
      - but, like, I don't think you can make IPFS all that
        - hence why
  - point is, they're immutable
    - and it's all under one natural DHT namespace, right?
      - like I don't have to run yet another etcd cluster to maintain the state
        - I suppose this would mean Kubernetes might have a custom Torrent resource, then?
          - the Torrent having a PersistentVolumeClaim, and the node currently responsible for it
            - and I guess that would let Kubernetes balance the torrents based on
        - oof, but, like, even in a namespace, isn't that putting a lot of
          - does this maybe need... its own control plane?
            - if you connect that subcluster's API server to a Pod in the "main cluster"
          - I'm realizing now that this might be an example of how "bulk" and "work" classes might get separated...
            - oh man, yeah, that impacts the design of my personal storage
              - like, what if you want to run Longhorn instances
                - Actually, can they share a physical volume?
                  - since I'm not doing this for any overlapping storage media, I'm gonna operate on the assumption they can for now
                    - And, you know, I'm not mounting multiple Longhorn instances to the same class of drive right now because it's a simple cluster
  - and you know their size
    - or at least, you don't have to download anything before you know its size
      - awesome how this technically-useful information comes as a consequence of the natural design of the protocol
- announce lists.
  - this of course couldn't be a torrent (though it could be a .dat)
  - every torrent has to have a responsible announe list tracking it (and distributable)
  - you can have "just cache this list for discoverability/searching" index source lists
    - like, uhh, let's say, your distro's package publishing announce list, that's a legitimate example
  - and then you can have derived lists like "all torrents published on any of these lists with a name that matches this pattern"
    - or just "the one with the highest number of seeds" or "most recent" or "first" or "largest"
    - this would change the "active torrent set" dynamically
      - if torrents are in-cluster, then a Kubernetes API client or something like that would manage this
      - you'd have some degree of "eviction strategy" so that, like, two torrents that jockey for the top spot aren't immediately deleted when one overtakes the other
        - you'd probably want some mixture of "positional stability" and "degree of interest" versus "amount this accounts for resource pressure"
  - to reframe this:
    - you could have Canonical Sources, which are an explicit list of torrents,
    - and then DownloadSets, which select which torrents are mapped to which nodes' volumes
      - would be cool to have a way to make the source for this dynamic, like subscribable by the user
        - oh shit, is this PeerTube? Is this how PeerTube works?
  - priority
  - this also makes it so that things like patreon-only podcasts, that you wouldn't naturally want to pirate, should be made private some way
    - tracker authentication?
    - you could also just have secret magnet links that are excluded from sync / publication / export
      - you could even do this like Humble Bundle, which provides a native torrent transfer
- duplicate detection and differencing
  - ie. a quick way to say "it looks like this video is the same as this one you watched earlier, but without the Korean subtitles across the bottom of the screen: would you like to switch this to the primary source for this movie?"
  - the torrents created by a transcoder would also provide some precomputed stats to sidestep this, I suppose
- [supershuffle](mbqsv-kpfjs-wkane-nhrfg-zrzcd)
- [open x-ray](ytdpn-tz8ta-wy8jw-72wk0-r7j4d)
- in the player:
  - built in easy screenshot / clipping
    - and optionally one-touch
    - where does it output to? does it initialize a torrent for each screenshot / clip? and that's how it transfers / syncs?
  - the player should have options for when to present UI
    - like "gyro motion" for tablets,
      - some other kind of outside source would make it easy to, like, wire a tilt switch to a GPIO
    - or "cursor movement" for mice / touchpads
    - or "touch, so require two taps to pause",
    - "on keypress like shift" seems like a no-brainer
      - but you can't wire that to the GPIO because shift does change modality when another key is pressed