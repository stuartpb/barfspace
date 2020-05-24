# a wild idea: Supershuffle

So like, what if you had a place with a radio

And guests could put their own music into the jukebox

but it doesn't just play the music

it feeds it to a neural network which generates songs based on the input

## intersections with other project ideas in these notes

this can overlap with "popcorn bucket" which is my torrent-first entertainment system

I'd love to structure this as, like, it follows one "torrent index"

## a note on that torrent-first-data-model

each Torrent really should be stored in a reference-counted "playlist", where a torrent can be on more than one playlist, but it must be on at least one to not get GC'd

this is the "Pirate Bay replacement structure" - it serves as a synchronization method, but also a serialization method, a syndication channel

should indexes be able to reference other indexes? you run into a potential circular reference situation with that, but like, since it's all just an additive set of torrents, that's fine
