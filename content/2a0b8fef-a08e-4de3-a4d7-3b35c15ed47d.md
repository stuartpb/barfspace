# Prusa i3 Modular Toolhead

What if you could take the motor off your extruder and replace it with a soup stirrer without having to unscrew or rewire anything?

Thinking about how you'd do this:

- The only connected piece you *really* need to keep on this for other tools is the PINDA (since it's so sensitive to being moved)
- Taking the rest of the extruder off so something could go right where the nozzle goes would be cool.
- It'd be nice to be able to swap the extruder axis motor onto other parts (ie so it can be used to rotate a calligraphy pen) - this'd probably be an easy one to convert into a connection-stays-put with a port on the end.
- The filament sensor seems less like something that'd be so reusable in other contexts, but a generic "here's a few data lines" port next to the Extruder connection (and the filament sensor lines living in the same bundle with the Extruder and the PINDA) would be cool
- Same goes for the fans: you'd have two more port connections for DC motors. (Could one of these be hijacked for a laser? Does the Extruder line get that? Does it have to use the same power source as the Hotend did?)
  - this is answered if I look a little more into Prusa laser cutting rigs
- The connection to the hotend... looks kinda delicate - this might need to become a kind of connector swap at the motherboard (and, like, a side connection)

## possible approach

- [ ] Redesign the Prusa's X carriage to more easily detach from the extruder assembly.
- [ ] Redesign the Prusa fan bracket to clip into the extruder assembly without screws.
