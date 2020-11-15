# Getting an ESP-01 to flash

I was trying to get my ESP-01 to respond to esptool.py, but nothing I would do would get it to respond.

I was finally able to get it to work after **pulling all unused pins either high or low**. I'm not sure that all of these are necessary to get it to flash, but here's the pin configuration I used to get here at power on - when I had GPIO2 or Reset floating, all my connection attempts timed out:

- Reset low
- GPIO2 high
- GPIO0 low
- Chip Select high

I didn't need any resistors, just this pin configuration at startup.

I had some problems after messing with these wires a bit: once all this is set, you need to **power cycle the USB side**, not just the chip side.

When it says "Hard resetting via RTS pin", I'm not sure how that's supposed to function, but I've been power-cycling the chip by pulling the pin from the FTDI and that seems to be good enough

`esptool.py -p /dev/ttyUSB0 flash_id` works and tells me the chip has 1MiB of flash

downloaded stock image via `esptool.py -p /dev/ttyUSB0 read_flash 0 0x100000 Downloads/esp01_default_stock_firmware.bin`

After switching to NodeMCU mode, I kept getting issues with the file uploads being corrupted. Eventually, the USB TTY just stopped being accessible, no matter how much I reinserted it (I'm guessing a driver snafu). I'm swapping over to stuzzy to see if it can be rectified before I restart.

Had to do a `npm uninstall -g nodemcu-tool` and `npm install -g nodemcu-tool` to update it for my current version of Node (just reinstalling didn't rebuild the outdated dep)

And I kept having problems and eventually I just bailed and bought a couple ESP-01 USB flashers from Amazon.

## Experience with the flashers

Well, they say you should solder some switches / button to it to enable firmware flashing and the reset button and stuff (like, the vendor says this, on their seller page), but... I'll hold off on that until I have spare switches lying around (maybe I can look into some of my old junk for salvage?)

Anyway, they got init.lua uploaded just fine

I was trying to drive the LEDs from the board via just a USB power connection, but I wasn't able to get that proper boot until I put all the pins in the port (some via taps), at which point it worked, and then I removed all of them but Chip Select, Power, Ground, and GPIO 2 connected to the LEDs, and power cycled the USB side, and it *still* worked. Weird. I guess it's a floating-pin issue? Not sure if there are things I need to do to ensure this won't be a problem (like tie reset to ground - you know, I do have a spare case reset button from the set I'm not using for case intrusion on Abe...)

https://www.instructables.com/id/Definitive-Guide-to-Setting-Up-Your-New-ESP01-Modu/ says reset should be pulled high for normal operation, I guess that makes sense
