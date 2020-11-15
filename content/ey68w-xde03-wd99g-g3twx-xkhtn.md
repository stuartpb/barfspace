# trying to run a WS2812 from an ESP32, 2019-06-09

continuing from [the setup log on stushiba](qjmq0-8n0xw-8c81v-vsqhs-85jmd)

spent a while the other night trying to make anything happen, realized I had the light strip connected to 5v and the ESP32 outputs 3.3v data.

ran into some issues, looking at the code I noticed there seems to be an assumption of an 80hz clock, so there might be a timing issue. Did `make menuconfig` and tried lowering the processor speed from 160MHz to 80MHz...

nothing. trying it bumped up to 240hz... still seeing issues, a run like `ws2812.write{pin = 4, data=string.char(16):rep(24)}` produces an output like "halfbright white, light pink, bright lime"

I'm remembering a note now about putting a 300 ohm resistor on the data line... it's in [Adafruit's Uberguide's Best Practices](https://learn.adafruit.com/adafruit-neopixel-uberguide/best-practices)

yeah that did nothing, still observing the same behavior. looks like I'm going to have to fail back to the ESP8266 while the root of this issue can be tracked down...

moving on to [Revisiting My ESP8266](tn2pt-0fmbp-8n9ca-w1367-961je)
