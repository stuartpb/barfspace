# Drone stuff

Most of this is research on the subject of what it'd take to make an [Open Interoperable Component Base](rey3y-7md66-csaqb-af2wj-yrt0f) for 3d-printable drone designs

## Links

https://en.wikipedia.org/wiki/PX4_autopilot links to most of the stuff I'm looking at (related projects, etc)

https://en.wikipedia.org/wiki/ArduPilot#Supported_hardware

https://www.librepilot.org/site/index.html

https://opensource.com/article/18/2/drone-projects also has a good list

## now here's something good

- https://espcopter.com/
  - https://hackaday.com/2019/09/25/espcopter-a-fully-customizable-drone/
  - https://hackaday.io/project/167079-make-a-hand-control-drone
  - [Blockly programmer](https://espcopter.com/1513-2/)

## stuff on this proprietary drone

[This "Dobby" Pocket Selfie camera](https://www.amazon.com/ZEROTECH-Dobby-Pocket-Selfie-Camera/dp/B01IZ7MD1I/) is the UX I'm looking to see if I can match through open-source, low-BOM, 3d-printed-part-centric design below.

https://www.manualslib.com/manual/1171769/Zerotech-Dobby.html?page=10 battery charger reference (note that orange = fast charge)

[piloting app on Google Play](https://play.google.com/store/apps/details?id=com.zerotech.cameratime)

## kit notes

https://makezine.com/2017/05/10/5-quadcopter-kits/ all sounds really complicated and expensive

## 3D Printed Drone stuff

Not all of this is open source: https://www.3dnatives.com/en/top-3d-printed-drones-101220185/

[This All3DP article](https://all3dp.com/3d-print-drone-parts/) closes on a list

[This list](http://blog.layertrove.com/3d-printed-drone/) has more open-source, low-cost projects on it

[Hovership](http://www.thingiverse.com/Hovership/designs) had some interesting designs, but has folded

[PIXXY](https://www.thingiverse.com/thing:272234) (2014, not modular)

[OpenRC Quadcopter](http://www.thingiverse.com/thing:793425) (2015, WIP, no Git)

this [Foldable Brushed Microquad](https://www.thingiverse.com/thing:1604440) (2016, listed as WIP) seems like the closest feature-wise project to the Dobby

also, [this Prusa article](https://blog.prusaprinters.org/how-to-build-a-3d-printed-micro-drone/) is probably the best stepping-off point

[ardupilot has a page on building your own multicopter](http://ardupilot.org/copter/docs/build-your-own-multicopter.html)

## okay so there's a different family of drone controllers here

https://www.getfpv.com/beef-s-brushed-flight-controller.html from the parts description of that microquad ([also here][beef2], twice as expensive) put me on the track of https://github.com/multiwii/baseflight which was reimplemented as https://github.com/cleanflight/cleanflight and forks

[beef2]: https://www.thingbits.net/products/3dfly-beef-s-brushed-board-flight-controller

looks like this is the direction the PRusa stuff points one in

There's a chrome app for settings? Not clear how piloting rolls
