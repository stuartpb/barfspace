# NeckFX new thing

## Pocket 8266 / Pocket WiFi hardware

TODO: attach links to sources for origin of this chip

## new design

Was going to do a 2-side jig using pogo pins

Made a "spacer" to evaluate

Eventually realized the around-the-battery stuff wasn't useful, so reduced it to just a "pogo header"

Eventually got everything nice and shiny

Then I designed a straight tube

## trying to flash the chip

Went through 3 cables that didn't work - I call them POND cables: Power Only, No Data

cheating off [this](awj3p-md20q-gp95c-g43ga-het35) and [this](tn2pt-0fmbp-8n9ca-w1367-961je)

```
[stuart@stushiba ~]$ esptool.py flash_id
esptool.py v2.6
Found 1 serial ports
Serial port /dev/ttyUSB0
Connecting....
Detecting chip type... ESP8266
Chip is ESP8266EX
Features: WiFi
MAC: b4:e6:2d:70:84:42
Uploading stub...
Running stub...
Stub running...
Manufacturer: 20
Device: 4015
Detected flash size: 2MB
Hard resetting via RTS pin...
[stuart@stushiba ~]$ esptool.py -p /dev/ttyUSB0 read_flash 0 0x200000 Downloads/battery_default_stock_firmware.bin
```

triggering new build with bit, color_utils, crypto, encoder, file, gpio, http, mdns, net, node, rtctime, sjson, sntp, spi, tmr, uart, websocket, wifi, ws2812, tls

resulting firmware is only ~280k bigger (757.8 vs 471.0), so heck, this ain't some rinky-dink ESP-01, let's flash that, we'll still have a meg of Lua space

## Wiring trouble

Initially thought D2 was GPIO2, forgetting there's the whole GPIO2/D4 thing

had to sync the file I grabbed from the ESP-01 to my laptop in October. not sure where exactly
