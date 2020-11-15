# Seedbox/Youtube/Netflix/Peertube/Popcorn-Time Hybrid

So, you start from a base of PeerTube

you extend PeerTube to have YouTube's "Movies and Actual TV" interface - I think it's best to model this to work based on a different set of announce peers than PeerTube

maybe it's a separate app, but I think it's worth considering what interface attributes / elements can be integrated. I certainly thing they could benefit from a shared player UI / HUD (considering they have the same backing store format for "seeking" on a stream - if there's a problem with codecs you can have some kind of operator-like thing process media into torrents through ffmpeg )

## anyway, the shared bit

these both use the same torrent pool under the hood. You know, Archive.org makes public domain movies available in (probably) a format like this, this is a fine model to base this on

## the thing / ideas that could apply for upstream

How easy is it to have whatever user experience as PeerTube through whatever list source? I'm thinking Dat, IPNS, or Archive.org Totally Legitimate Public Domain Compilations, and things like that, not any sort of "KickEZAssBay" list host or something like that
