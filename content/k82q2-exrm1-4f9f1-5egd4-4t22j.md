# Value types in Understanding Lua

Numbers are abacuses, with beads representing the sign, exponent, and mantissa, along with an engraving of the decimal representation. (See [this page][numbers] for more on the representation and explanation of numbers.)

[numbers]: 5tk2a-b69r2-32808-4kbhm-cec23

Strings are cards with the string written on them (or maybe it would make more sense to describe them as *banners* with the textual representation of the bytes on them, and the 8 bits of each byte on the back of each character).

Booleans are represented as [lightbulbs][La Verite], with a dark bulb representing `false` and a bright bulb representing `true`. Moments of boolean conditional analysis - where boolean conditions naturally occur - show the true/false bulb appearing over my head. If I don't grab it, it technically doesn't refer to a real value, but yeah.

[La Verite]: https://en.wikipedia.org/wiki/File:Truth.jpg

`nil`, the absence of a value, is merely represented as empty space. Assigning a value of `nil` to something is represented by taking a deep breath and blowing it away.

Tables, I'm thinking, will be represented as an end table, with a large "keyhole" where indexing keys are inserted to pop out the drawer for that key. (I'll be going into a little more detail about how tables work once I've finished covering the last few types.)

Functions are comics. (See [this page][functions] for thoughts on the representation of functions.)

[functions]: ypqj4-z5n8d-g18sx-jshhs-p5qwj

Coroutines are a little diorama of the Dashseat stage, and we're not really going to go into them. (See [this page][coroutines] for more thoughts on coroutines.)

[coroutines]: rpv18-h1fjc-w486j-z30qp-wbaqz

Now, there's only one type left. That might sound restrictive, although within Lua you'll find you can actually represent pretty much any concept using the primitives I've just described. However, there are things that exist outside of Lua, and that is what the last type represents. Userdata - everything that falls outside of these primitives. (See [this page][userdata] for thoughts on on how userdata may be represented visually.)

[userdata]: qqa16-vvtr0-c29wf-ys5gw-pep8d
