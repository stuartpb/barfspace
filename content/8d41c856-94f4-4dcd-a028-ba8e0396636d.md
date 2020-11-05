# Rewriting argononed

While there is [a patch to fix it](https://github.com/kounch/argonone/tree/feature/RaspberryPi4), it's still using [raspberrypi-gpio-python](https://sourceforge.net/projects/raspberry-gpio-python/), which uses [the `/dev/gpiomem` device](https://sourceforge.net/p/raspberry-gpio-python/code/ci/default/tree/source/c_gpio.c#l78), which is pretty much [Raspbian-kernel-specific](https://github.com/raspberrypi/linux/pull/1112/files). If that's not there, it falls back to the `/dev/mem` interface, which is way more dangerous and requres root privileges.

A good replacement should use the `/dev/gpiochipX` system, namely the one set up by libgpiod.

## more links that probably don't matter

- https://pypi.org/project/RPi.GPIO/
- https://www.ics.com/blog/control-raspberry-pi-gpio-pins-python

## what about...

when it comes to just nudging the python:

- [gpiozero is just a layer over the same lib](https://gpiozero.readthedocs.io/en/stable/migrating_from_rpigpio.html), and [it's not clear that using a different implementation would change anything](https://gpiozero.readthedocs.io/en/stable/api_pins.html#changing-pin-factory)
- [RPIO](https://pythonhosted.org/RPIO/) just goes [straight to `/dev/mem`](https://github.com/metachris/RPIO/blob/master/source/c_gpio/c_gpio.c)
- [WiringPi is even more a mess](https://www.raspberrypi.org/forums/viewtopic.php?t=243166)

## libgpiod

https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/README

this would make it so I could just pass this device in to the container and no root access would be needed

heck, I could even swap it in the python, https://pypi.org/project/gpiod/

[I don't know what this is but it looks vaguely helpful](https://developer.toradex.com/knowledge-base/libgpiod)

you can find the man pages in Debian's system, ie. https://manpages.debian.org/experimental/gpiod/gpiomon.1.en.html

## containerizing

it seems like libgpiod is AUR-only on Arch, but as luck would have it [it's in Alpine](https://pkgs.alpinelinux.org/packages?name=libgpiod&branch=v3.12)

and, oh hey lucky, it looks like this script uses `vcgencmd` to determine the fan speed, but [that's packaged in Alpine too](https://pkgs.alpinelinux.org/contents?name=raspberrypi&branch=v3.12)
