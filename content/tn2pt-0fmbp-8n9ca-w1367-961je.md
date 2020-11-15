# Revisiting my ESP8266

There's some beautiful wiring on this breadboard that I don't ever want to mess with hooking the ILI9225 up to the ESP8266, but myeh I'll cover that later

Looks like there's just a typical drawrest installation on here right now, and I don't think the firmware that's currently on here supports WS2812s, so I'm going to go ahead and blow this away with a new image I just built via the cloud service that has 16 modules (from the email: color_utils, crypto, file, gpio, http, mdns, net, node, spi, tmr, uart, websocket, wifi, ws2812, ws2812_effects, tls)

actually, reading the nodemcu-tool README, I should tack encoder onto that list...

I'm wondering if I should keep it light, though - I feel like I used to have out-of-memory issues with firmware with so many modules like this, and found it better to just keep things to what's needed to run the app

...and then I decided to just go ahead and run a more complicated build.

while I'm waiting on that, I do a `cd ..` to go to my root workspace directory and then

```bash
git clone --recurse-submodules https://github.com/nodemcu/nodemcu-firmware.git
```

to create a working tree for the master branch (sure, I could do a lightweight clone, but why bother?)

ok, looks like there's no menuconfig in ESP8266 master, and I don't feel like editing text files right now...

anyway, my new monster image has downloaded (with bit, color_utils, crypto, encoder, file, gpio, http, mdns, net, node, rtctime, spi, tmr, uart, websocket, wifi, ws2812, ws2812_effects, tls)...

so I'm gonna cd to ~/Downloads and flash it

As I'm no Stushiba, like [stuzzy before me](a70es-06g3f-e59rc-b1qdq-0qwck), I `sudo pacman -S python-pip`, then `pip install esptool --user` to get the flashing script. (the ESP32 version did a thing where it was tree-local and you could flash the built image with `make flash` but eh, might as well have it user-global if I'm gonna experiment with pipelines like I do)

doing `esptool.py write_flash 0 nodemcu-master-19-modules-2019-06-09-22-15-17-float.bin` from downloads to flash this new firmware, the lights are activated by startup garbage and are *blinding*

oh, derp, I had it on the wrong line. Okay, it works now, hooray
