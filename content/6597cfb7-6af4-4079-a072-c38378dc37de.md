# NES Emulation Ideas

[FCEUX](https://github.com/TASVideos/fceux) is pretty cool

## Earthbound Toggler

A thing that lets you toggle the run state of an "Earthbound" cartridge (or other games that had localization changes) at will:

- https://earthbound.fandom.com/wiki/EarthBound_Beginnings#Censorship_and_Localization
- You could have each of these under a checkbox group

I'm thinking this kind of patch applicator must have some kind of generalized format, where you can swap between data from two different images?

Also, an ability to see "patched regions that are currently / recently accessed", to know when you're subject to a localization difference

another thing I'd want to have as an optional switch would be community patches like "flip that one guy's elbow around" or "remove the hitbox that's off Blanka's body and below the floor"

and one further idea I had was "bake the user who selected the optins into the credits, which can be easily checked like an "about menu" through the Cheat Engine"

## Rewinder

- check out the [FCEUX Stock Rewinder](https://github.com/TASVideos/fceux/blob/master/output/luaScripts/Rewinder.lua)
- see also [this Enhanced Rewinder](https://github.com/BillyWM/FCEUX-Lua-Script-Collection/blob/master/rewind.lua)
- [another rewindable emulator](https://www.reddit.com/r/programming/comments/662tgc/i_created_an_opensource_nes_emulator_that_can/)

Is anything out there as smooth as Megaman Legacy's rewinder, or Braid?

the idea I had that would interact with the Eartbound thing is that, like, when you switch a toggle, it replays the game state (as feasible) to real-time switch, like the Secret of Monkey Island Special Edition

### UI idea

a "rewinding tape" effect (not necessarily at the shader level), where the "Rewinding" symbol is lit and the bar is put to the left of the screen to show how much "rewind" buffer is available
