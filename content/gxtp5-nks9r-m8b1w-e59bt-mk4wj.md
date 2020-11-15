# A DCIM for Printers / Filaments

I humbly suggest that SD cards are cheap enough that every filament vendor should pack one in with every spool, and then that card can be used as an identifier for the spool

## reconsideration 2020-09-23

I've thought about this, after getting all the pieces to prototype this (ten 128 megabyte MicroSD cards, five MicroSD USB readers, and a hub), but then I realized... messing with some MicroSD cards when I just want to change the filament spool would just be a pain in the ass.

I *have* been thinking about something like a dynamic label system, where you can refresh an E-Ink tag on the spool (if it's made from an in-house batch) with the date of manufacture and summary label (keeping the same UUID)

## anyway, more on this goofy idea

Anyway, at its base you'd just have manufacturer, color name, material, suggested temperature range, othr slic3r metrics like density, a link to where to buy it?

and then you could get fancy with Prusament-level metrics

## also

you'd want an intercompatible ["odometer format"](nk586-7dpxf-8pajm-d6ynk-gxh4s) for Printacle to interoperate with other applications somehow

also you want some format where it makes sense that this'd be on a shared card that's plugged into the printer, like maybe something the firmware itself could track and export per run? just a thought
