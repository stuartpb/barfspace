# 2017-12-27

I want to try OctoPrint with my new Qidi Tech I 3D printer, and don't feel like messing with my RPi right now, so I'm using this instead

following the directions from https://github.com/foosel/OctoPrint/wiki/Setup-on-a-Raspberry-Pi-running-Raspbian

Cloned foosel's repo into `git`, then changed my mind and put it directly in my home dir (one less thing to differ from expected)

Installing `python2-virtualenv` because that looks necessary

ran the install script with the venv stuff

did the `mkdir ~/.octoprint` thing

starting OctoPrint and controlling it from my desktop

## octoprint setup

skipping access control (this setup will be local)

skipping connectivity check stuff (let it assume it's online)

sure, enable blacklist whatever

I... guess I'll skip the CuraEngine stuff since I don't have a profile and stuff

setting defaults from a thread on Thingiverse (center origin, build area 227x148x150, top X/Y/Z/E speeds 2500/2500/200/300, 2 extruders)

## stuff not working

installing the GPX plugin in OctoPrint

running `sudo usermod -aG uucp stuart` so I can connect to the serial ports

after doing those I had to open the GPX stuff in settings (failed with no gpx.ini), then log out and back in (reload the user permissions)

got timeouts trying to connect with baud rates above 115200

## working but weird

selected "invert control" for the Z axis in the printer profile because up moved it down and vice versa
