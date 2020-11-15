# Printacle "Odometer Card" Tool Scheduling System

Part of [Printacle CI/CD Integration(esque) Model](5359r-v4yxp-16b0n-vnj5r-wf2cs)

A system for selecting a spool / tool based on Material Resource Pressure (and even "already-mounted nozzles")

so a job could say "print on any translucent material we have" or "print on

## Physical model

- You'd have a pluggable block in the plastic frame model

## Data model

You'd post events maybe to Prometheus? Or maybe just this drive is readable by Grafana

anyway, you add (or append to) a file for an event every X seconds reporting how much filament the current print has extruded, etc

you also list the spool's measured characteristics, like its market mass, its measured mass (make sure your scale is properly calibrated for 1kg at your gravity!), its mass at the end of the spool (for measuring density)

you'd also want to note for posterity if a malfunction (eg. a brittle spot of PLA broke) made you have to yank X length of filament out of the extruder/MMU and put it in your "3D Pen" bag - this helps

you might also want to put in "rough estimates", to just allow for a better margin of error ie. if building a profile based on samples

## More thoughts on this kind of automation for hardware / printer farms

- Is Prusa going to be releasing their farm system soon?
- Could this be extended to a rack-maintenance human-operator scheduler?
  - like, "go down to the mailbox and get this drive", or "look on the mail wagon", or "fetch the piece off this printer"

## speaking of data: Prusament API?

hey, how does Prusa let you get the record on your spool's production?

this general train of thought proceeds into [A DCIM for Printers / Filaments](gxtp5-nks9r-m8b1w-e59bt-mk4wj)

## oh snap, though

You could use full-size SD card adapters for the filament - that's probably less stressful on the circuitry, and I'd imagine probably cheaper to source (though, if not, hey, maybe go for the chip model)

## going too far with

and even use FlashAirs, if you wanted to be real rich about it to add "wireless" spool data
