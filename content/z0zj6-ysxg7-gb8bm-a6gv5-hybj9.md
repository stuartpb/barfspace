# postdark

(these are notes for my own edification, the context will come later)

constructor takes a scale argument that it multiplies the sprite sizes by - can be used in conjunction with the window setting to load it in a little mini-preview window

sprite algorithm looks at sprite coordinates, looks at the screen / window section extents, sets the window (using appropriately translated coordinates via screenx and screeny functions - or maybe just all screen variables are set like `screenx, screeny = orient(--[[actual x expression]], --[[actual y expression]])` - I was even going to suggest the function use them as return registers, then I realized that'd make it way more complicated to set multiple x and y pairs), and then calls a function that calls screen.fill taking which sprite, the size of the window, and the offset into the sprite of the upper-left-hand corner (where negative values will offset the start of the sprite and draw transparent black) (and scale and I guess brightness come from self)

images use 16-color palettes packed 2 pixels per byte

scaling uses rounding for each pixel read to convert screen scale

at startup time, rgb888 palettes are read in as ~~hex~~ ~~binary~~ number tuples, and are converted to rgb565 as `string.char(hi) .. string.char(lo)`: g is divided by 4, r and b are divided by 8, and then

```lua
local hi = red * 8 + floor(green / 8)
local lo = (green % 8) * 32 + blue
```

(man I wish lua 5.1 had the integer division operator, I'm starting to see the genius of it)

maybe darkness palettes rederive from the rgb

caching is another parameter, that I guess takes a table to save sprites to (call it `.cache`), and you don't want to pass it unless you're loading the sprites from SD


