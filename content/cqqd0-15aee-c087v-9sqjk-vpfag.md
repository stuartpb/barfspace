# Setting Up My Pwnagotchi

image downloaded, not yet flashed. still waiting for the Pi to show up

reminder here that I'm thinking about getting a Raspberry Pi A to replace the Zero in my Prusa MK3S, which I could desolder and use as a Pwnagotchi if the package with the Zero gets lost or whatever

## anyway, the new zeroes are here

Inserted the MicroSD insto my little USB reader

Flashed it with Balena Flasher

## post-flash

per https://pwnagotchi.ai/configuration/

Setting up a `config.toml` in the boot partition with sections for `[main]` and `[main.plugins.grid]`, setting:

- main.name
- main.whitelist and main.plugins.grid.exclude
  - why are these not the same thing by default?
  - is it because it should never have data for a network on its whitelist?
- main.plugins.grid.{enabled,report} = true
- main.plugins.bt-tether.enabled = true
- main.plugins.bt-tether.devices.stuixel based mostly on the android-phone defaults listed on that page
  - mac taken from phone in format listed there (lower-case hex separated by colons)
  - share_internet=true
  - it's kind of dumb that there's both a search_order and a priority

not setting ui.display.type for now since I don't have the display yet (here's to hoping it'll arrive within the week)

set up bluetooth tethering on my phone

not setting up any fs.memory

not setting up /.pwnagotchi-crypted until later

now reviewing https://pwnagotchi.ai/usage/ to see what else I'll want to set...

- ui.web.{username,password}

## setting up the RTC

I've already got the RTC I got with this batteried up and socketed on

per https://learn.adafruit.com/adding-a-real-time-clock-to-raspberry-pi/set-rtc-time linked from the Configuration page:

- adding `dtoverlay=i2c-rtc,ds1307` to the end of `/boot/config.txt`
- will do all that other stuff later
  - let's maybe see how bad the fake-hwclock is, especially with BT tethering for ntp
  - might end up not setting this up until some point after I've got the screen installed
    - due to, you know, physical space restrictions

## okay, I think we're ready

ejecting the MicroSD from Nautilus and putting it into the RPi0, then plugging it into the USB port

it gets recognized as "Ethernet Connecting"

I have to do a bunch of shuffling (including copying the MAC from `ip link` to the Network Settings), but I end up getting a solid system going with a separate profile for the Pwnagotchi (bonus: I now have a separate profile for using the hardcoded Household DNS versus respecting DHCP)

I'm a little time limited right now so I'll fill this in later

## web ui

can't get it to work, doesn't accept the config I set in config.toml, idk

Oh: https://pwnagotchi.ai/usage/#bettercap-s-web-ui

> the default authentication credentials are pwnagotchi:pwnagotchi, if you decide to change them in /usr/local/share/bettercap/caplets/pwnagotchi-*.cap, you’ll also need to update the configuration in /etc/pwnagotchi/config.toml to use the new credentials.

???

also, pwnagotchi.local resolves and not the name I gave it??

## anyway

let's go for a walk

## later

got home after about two hours?

was thinking I'd see how long the battery would last, but the battery I put it on seemed to last just fine for 5 hours - it was showing 3 LEDs, though I'm not sure it's ever shown anything else?

after 5 hours, I decide to hold the "test" button down and turn the battery off before trying to unplug it. it is *really* hard without a case.

## stuff went wrong

I tried to access it via HTTPS, but then the connection just kept dying? (worth noting that, in this time, the non-pwnagotchi `.local` name resolved)

I've pulled the data from the most-obviously important locations... the card's still in my reader. I want to see what's recommended for HTTPS and see if I can set that up (not mention review logs to see what might be going down)

(might also need Bluetooth)
