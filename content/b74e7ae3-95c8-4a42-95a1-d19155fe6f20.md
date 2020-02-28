# original brainstorm / notes for dockitall all-linear-extrusion-bevel-fillet-boolean-based redux

these were notes I wrote when drafting the original idea for dockitall v0.2

> make "phone cross-section" module, which gets offset to form the vertical walls of the dockblock (which are then extruded)
>
> consists of hull of back and front corner circles with a front and back radius
>
> facing forward the body of the block can be a linear extrusion too (unified with the walls)
>
> extend the dockblock to the current hacky prism's base so it'll now be just cut under the Z axis
>
> have "just the plug" and "belt/ring for around case" printable draft test piece modules derived from some of the above structure
>
> front, back, and sides are also implemented as 2D shapes: walls are designed as intersections between the ring/belt top-down silhouette described above and the front / back halves of the block
>
> front can now be curved - start as square, then do speaker knockout by differencing the hull of some circles. You can difference circles from the negative to round corners more
>
> curving around the screen's corners contours would be cool, and making the back have rounded corners like the phone itself (while the wall around curves too) would be cool, but those *side* corners are what *really* need to be rounded
>
> ofc there's striping but that's already done

## one idea that didn't get done

> make the triangle a hull of "front-facing corner radius" circles

didn't do this because the front two corners are already like that, and the back one is cut for the cable track anyway.

## a thing that got done slightly later

> TBH, I think I'd rather make an "X origin, Y origin, X shift, Y shift" 90-degree point-plotter function (which'd actually be pretty easy), following a specified number of divisions (which could be scaled according to $fn and $fa), then use that to just create the rounded rectangles as polygons. Circles don't get any kind of special treatment internally in OpenCSG (even though, y'know, they should), so this'd be just as good as the wacky, complex, unscalable solution we have now. And, it'd make it more tenable to plot more complex paths like the front face!
>
> Taken a little further, this could be used as a basis for resurrecting the Millwork idea, generalizing it to "rounded paths"... I don't know, that's a problem for another time.

right now this'll probably get generalized into "plot from X angle to Y angle from Z origin with these scales" before it becomes a millwork thing, but I did have a heck of an exercise getting the throughhole refactored

## throughhole refactor

Before I revisited this:

> I'm gonna punt on this again, but it'd be cool to have the channel to get the cable head in be hidden within the dock body, which would allow the cable to go straight through the base
>
> I'm messing with this again... I feel like, even though the inner width is less than the plug width, I can make this work if the channel is wide enough - the cable can slip in at a slight Z rotation.

