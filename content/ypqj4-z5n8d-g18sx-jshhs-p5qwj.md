# Functions in Understanding Lua

## Notes from OneNote

> - Functions: metal boxes with an in pipe on the top (for arguments) and an out pipe on the side (for returns).
>   - When I construct a function, I do some stuff in a whooshing metal tunnel (?): at the end of the tunnel, the tunnel shrinks into a function box and the chair goes down (leaves the scope)
>     - Lua functions have a window you can see any upvalues through.
>     - C functions are a different color metal, and they have no glass.
> - New thought: NONONONO- Functions are COMICS.
>   - THAT'S how procedures get transcribed- we just zoom out on the page (woah, man! Trippy! Meta!)
>     - Hopefully that meta-ness, of holding this fabric of reality in your hand, can convey the power of first-class functions
>     - The idea came to me when thinking about how to represent upvalues: they're sort of like "Draw the monster's head!" sections in coloring/activity books. I was thinking that those parts would be something like an advent calendar.

## Comments from Trello

> C functions are black-bagged comics. You just kind of have to trust that they work.

---

> Executing a function = the panels of what I'm doing are shown in the flow (made tiny / inset / etc) when they're too complex to show full size, but the first function call should show me taking the actions of the function as it was defined, full size, twice.

---

> Functions as "drawn" should be like rough sketches, to show the difference between function definition and execution.

---

Here's some stuff from the Trello list on introducing functions (Constructing and Calling Functions):

## Say we have an action we want to do a lot

> Like, um, converting Fahrenheit degrees to Celsius? or Kelvin?

---

> I also described the depicted actions of the function as "taping a thing to another thing", like taping a duck to an umbrella, where the tape, the duck, and the umbrella are userdata, but that's a little too far removed from the real-Lua world that we've constructed thus far. It'd be better to just make the practical operation that the function entails more visually engrossing (maybe I size the number up, count on my fingers, put on some glasses, stick my tongue out, stuff like that)

## Draw that function

> Or rather, it comes forth fully sketched, because that's what functions do. We see the sketch comic big enough to kind of make out the sketched forms, and be able to tell that's what's about to happen.

## Live that comic with an argument passed in

> Chair rises, or falls?
>
> Rises lets the ground floor be a physical floor that I could walk on, but I don't really need that.
>
> Lowers works better (we talking about going calls "deep" into the stack, which has a deep limit), although it means that I'm lowering my chair temporarily and then raising it, which seems slightly counter-intuitive.

## See how functions completely evaporated the need to pour in time and effort to calculating?

## Maybe briefly touch on memoization

> This also means less data that the computer has to store, but it also means more work that the computer has to do. This is usually fine - computers are really good at doing the same thing over and over again. It's what they're here for. However, for really tough stuff that can prove to be too much for the computer, there's a way we can combine this function with our previous table-based approach that we'll touch on in Chapter [Let's make a memoization function].
