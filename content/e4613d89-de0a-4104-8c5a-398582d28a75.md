# Against Globerlays

Or, Why It's Probably Ultimately Best to Stick With the Lexical Namespace Sort Model

## Why overlays are so hot in a nutshell

The filesystem usually creates the lexical sort as a data structure for you, and spanning a bunch of directories is going to cause a bunch of cache misses (part of the reason people didn't go the .d approach from the get-go: I don't know if `cd` has necessarily always been free, especially when you're moving to a new device/network mount, like you might have to on a directory-to-spool system, idk just spitballin' here)
