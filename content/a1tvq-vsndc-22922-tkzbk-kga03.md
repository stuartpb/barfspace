# UUID Dice

## SUPERSEDED

The [QUID spec](mpcz4-k4ygd-mg9xd-4bpgm-53h4f) made me realize rolling [Bitwise Random Dice](bscxw-18ehd-27bj5-p9eeb-1tq0c) to make 5 bits 24 times would be less tedious than the idea here (and there's less to remember to do it - you don't even need a bag with a diagram to remember!)

That said, there's a better idea for using 8-sided dice to generate hex digits in that page, too, so this page is really only tangentially relevant at this point, if you *really want* a D16, or you want to hear ideas from that thread.

## anyway, if you're nasty

The idea: a bag with 4 16-sided hexadecimal dice in it, and the bag has a diagram on the front showing
- two 4-digit groups (as grouped clusters of 4 blank spaces)
- a hyphen
- another 4-digit group
- a hyphen
- a fixed "4" and then three blank spaces
- a hyphen
- a fixed digit, leading down a 01XX table showing 0 = 8, 1 = 9, 2 = a, 3 = b, 4 = 8 etc
- a hyphen
- three more four-digit groups

per the [v4 UUID spec](https://en.wikipedia.org/wiki/Universally_unique_identifier)

and then you'd throw the dice eight times to make a UUID, ignoring the fixed bits appropriately

alternately you could include a four-sided die for the fixed digit but I think masking is more accurate

## links on making D16

so there's your traditional boring biprism or trapzohedron, or you could make something... unconventional

- http://www.aleakybos.ch/sph.htm is kind of the best resource
- https://www.shapeways.com/product/HT87ECPVB/alt-d16-sphere-dice linked from there
  - [archive link for the dead forum thread linked there](http://web.archive.org/web/20150915003851/http://www.shapeways.com/forum/index.php?t=msg&goto=30551)
  - nice opportunity to compare against [this model which looks like the ones below](https://www.shapeways.com/product/5FBH8AFSK/d16-sphere-dice)
- http://members.ozemail.com.au/~llan/mpol.html linked from the above
  - does produce two consistent shapes for 16 vertices, but it's not clear how to turn those into slices on the normal
- https://www.shapeways.com/forum/t/d16-contest.10809/ discusses ways to create a better D16
- http://web.archive.org/web/20130511100353/http://www2.research.att.com/~njas/packings/index.html from a dead link there
  - http://web.archive.org/web/20050909111529/http://www.research.att.com/~njas/packings/dim3/pack.3.16.txt appears to list exact 3D coordinates for an optimal packing
- https://www.thingiverse.com/thing:58408/#files is a SCAD file for generating N-sided dice
  - https://github.com/chr15m/hexadecimal-die is a fork from that that looks like it just changes the font? also its positioning looks like crap
- https://www.mathartfun.com/d141518.html lists a 16-sided die that is "not isohedral" but doesn't elaborate
  - that site has lots of other weird die designs, it's fun to explore
  - https://www.amazon.com/Fityle-Sided-White-Black-Numbers/dp/B07DR44D5P has a similar design
- https://en.wikipedia.org/wiki/Gyroelongated_square_bipyramid is another 16-sided shape that I'm not sure could be made dicey

http://loki3.com/poly/fair-dice.html is a cool assessment of dice design

what if you took a 48-sided die and just listed each digit 3 times? https://en.wikipedia.org/wiki/Disdyakis_dodecahedron

## barely-related links I came across while researching this

- https://crypto.stackexchange.com/questions/6175/how-to-best-obtain-bit-sequences-from-throwing-normal-dice

