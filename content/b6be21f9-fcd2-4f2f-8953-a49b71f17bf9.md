# cancelobject in printacle

## link stash

https://plugins.octoprint.org/plugins/cancelobject/ is a thing mentioned there to consider: note that it uses comment metadata

https://github.com/paukstelis/Octoprint-Cancelobject for the implementation

## a thought on supporting stuff like cancelobject

we could upload the canonical code, check the printer's position, halt the print, upload a new version of the code, and start that (I don't think we can jump into a reworked fully-reprocessed file? so this wouldn't be a reusable file for if the same object got cancelled in a reprint of the file, but whatever)

this might just need direct control to modify the live commands, so it could just assume direct control from a position in the original stored data file, which is still an improvement
