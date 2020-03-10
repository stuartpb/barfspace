# the key difference between printacle and octoprint

OctoPrint primarily models itself like a serial controller for the printer's axes

printacle primarily sees itself as a content processor that manages a cache of instructions on a FlashAir

printacle can span multiple machines, with the dev side of the pipeline living on a developer desktop and the gcode-dispatching and flash-drive monitoring on the RPi

printacle is more fundamentally modular, using MODULE_TREE as a base (where you can use `node_modules` as that MODULE_TREE? what about name collisions since installed Node modules might have spec-matching-looking structure)

maybe there's a PLUMBUS_PREFIX where Plumbus-related dirs should be searched for in subtrees? that just sounds like a way to make nightmare incompatible MT modules (or ecosystems)?

more likely we just have NPMed modules symlinked in if they've got some kind of Plumbus component

anyway yeah I was thinking you could have a module-tree module that starts a skeleton Node process like Envigor that constructs an Express server by passing a shared app object through all the middleware constructors defined as their modules' entrypoint

that'd include a module adding the in-process API (ie. adding methods to the app object) for contacting the JSON-to-terminal server, and all the other "basic OctoPrint-like functionality" bits

the module that adds a router for handling `GET /` (ie. the dashboard) adds the functions to register "dashboard plugins"
