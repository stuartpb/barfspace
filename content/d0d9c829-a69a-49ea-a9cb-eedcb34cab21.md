# Websocket-to-Serial Pipelines

for [printacle](d984a489-8c56-4665-a106-d6b4909319c8.md) use.

https://github.com/chilipeppr/serial-port-json-server would be a sensible basis for managing connection to the serial port

https://github.com/hallard/WebSocketToSerial is a neat firmware for the ESP8266 - this'd be the lightest-weight way to do printacle, but it'd mean the same "print dies when your client disappears" issues if not running off SD (so maybe a sensible idea if running entirely FlashAir-based - this should be a permitted form factor)
