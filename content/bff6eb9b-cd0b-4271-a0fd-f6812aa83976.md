# realization about my fears of hitting Pico-8's data limits with code complexity

if you can make the system/engine generalizable yet fast enough, you can fit a bunch of fancy asset descriptions in a *single string*

*especially* if you make the assets use a binary data format

You know what, though, I'm thinking about this some more, and... I think there's still a short raw compiled Lua data size limit, and it's smaller than the rest of the cartridge data map.

but you can always edit that extended data in a text editor (as .p8) - or even write your own toolchain cartridge to edit data on another cartridge!

you've basically just written your own tool with whatever GUI you want! (remember, that binary data's native format is hexadecimal text!)

processing a string you wrote in the editor is still fine - you can use the UI to show a preview / run validation etc, and then you press the button to save it!

this should be a suite of examples in the

don't forget you can also have cartridges read... is it possible to read a string from another cartridge from the Lua component?
