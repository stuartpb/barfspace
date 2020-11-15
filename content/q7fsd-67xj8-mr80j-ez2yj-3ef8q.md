# Backlight Blues

I want to look into whether my board has what it takes for the new backlight-adjusting circuitry - and what it'd take to alter it if not.

## archived quest

Your printer's backlight was too bright, so you fixed it by introducing a trimpot to the LED circuit - but isn't there a better way?

- [x] Order a new RepRap Discount board and a bag of sockets.
- [x] Fix the RRD board to work with your Prusa by flipping the pin housings.
- [x] Test that fix by running a print or two with the board.
- [x] Cut the trace to the backlight.
- [x] Epoxy a socket to bridge the connection through a custom circuit.
- [x] Solder the socket.
- [x] Place a trimpot in the socket.
- [x] Print new parts for your modified board in translucent PETG.
- [ ] Make a refined version of the dimmer circuit that's more sophisticated than a trimpot just sitting awkwardly in a socket on the board.
  - [ ] Complete the "A Little Jig" and/or "Better Than a Breadboard" quests to unlock the techniques necessary to run the circuit off a small ESP8266 (so it can be IOT-controlled).
  - [ ] Progress on the "Conductivity" quest to open up a 3D Printed Linear Trimpot as a potential design option.
  - [ ] Remember that you can do both: an ESP that reads the trimpot for the PWM value it spits to the LED, unless a REST command overrides it, in which case the solution is to jank the slider to "wake" manual control back
  - Honestly, the more time I've spent with this, the more I'm satisfied with just the mod that I originally got this idea from: a switch with full-brightness, half-brightness, and off.
- [ ] Make a writeup for this.

I've been noticing that it seems like my SD card malfunctions around when I try changing the brightness: is there maybe a capacitor I can put on this that eases the fluctuations of the brightness change?
