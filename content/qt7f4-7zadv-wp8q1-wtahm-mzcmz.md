# NodeMCU and Espressif chips

This can be a page aggregating all my NodeMCU notes and projects, including documentation I've been yoinking.

- [postdark](z0zj6-ysxg7-gb8bm-a6gv5-hybj9), for rendering modules out to a screen (via spitblit)
  - [slideshow module or whatever](dadp6-zrqph-g495b-5ee5g-rjjwf)
- drawrest, a simple HTTP-to-screen-or-LEDs gateway (again, via spitblit)
- [smart plugs etc](jasvm-x1dz6-4s9x7-138gg-wxkm1)

## support libraries

- spitblit, for rendering to screens like the ILI9225 (current)
- httpserv, a more-complete version of the incomplete Lua one in the nodemcu tree

## things I've made that are using NodeMCU

[my WS2812 necklace][necklace] (there should probably also be a page for WS2812s, really, especially since I'm planning to try controlling them from the Raspberry Pi at some point)

[necklace]: dq31f-kkzr3-2q96z-h6atq-qhxk4

## things I may make using NodeMCU

I might use something like this for a future revision to my [Infinity Gauntlet][MBIG] design (though, at this point, I think I'll hold off on anything like that for a few years until a really good Infinity Gauntlet model comes along to use as a basis, since I'm realizing now that the one I'm basing my current build on is kind of rough and clumsy)

[MBIG]: 2s3yy-78sq8-v79dk-zfbfy-3n1cv

## Data Sheets and Pinout Diagrams

https://hackaday.io/project/61727-rhobythe-social-robot/log/157461-ke32-wrover-c10-pinout has a couple good links:

- [this image summarizing the pinout for the breakout chip I'm using][ESP32 pin table]
- [the underlying datasheet for the ESP32][ESP32 datasheet]

[ESP32 pin table]: https://cdn.hackaday.io/images/13181545593365404.png
[ESP32 datasheet]: https://www.espressif.com/sites/default/files/documentation/esp32-wrover_datasheet_en.pdf

## Old Journals

These are pages pertaining to the ESP8266 from the old Petlogs structure:

- [stukilla 2017-12-02](tmh80-49fmx-w68ky-12mcd-yaqrq) and a small but significant update [2017-12-04](thgsp-dpjvm-41890-nce93-9vajr)
- [stuzzy 2018-09-08](a70es-06g3f-e59rc-b1qdq-0qwck)

## New Journals

These are entries more or less from the new petlogs structure (though sometimes I might not bother rigging them in there):

- [Getting the WS2812B strip to light](ey68w-xde03-wd99g-g3twx-xkhtn)
  - [Continuing to Try with the ESP8266](tn2pt-0fmbp-8n9ca-w1367-961je)
- [Flashing an ESP-01](awj3p-md20q-gp95c-g43ga-het35)
