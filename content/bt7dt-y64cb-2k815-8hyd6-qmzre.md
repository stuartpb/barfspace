# octopi first incarnation

## origins

I didn't start out logging my changes to this system, but it started from the Prusa OctoPi image as described [here](https://help.prusa3d.com/article/Loz15FAgEk-octo-print-raspberry-pi-zero-w).

## 2019-06-14

long story short, I haven't used this in seven months and I forgot my password.

Apparently I both changed the pi password and I made an octoprint user for myself.

Anyway, I pulled the chip, put the MicroSD card into a USB reader, and put that into Stuzzy (note: I had to reboot first, probably a kernel update thing).

from there, I moved to the home directory for pi (having the same number as my user on stuzzy makes this next stuff easier)

I did a `mkdir .ssh` and a `chmod 700 .ssh`, then `cp ~/.ssh/id_rsa.pub .ssh/authorized_keys` and chmodded that to 600, then I pulled in the keys for stutendo and stushiba so I'd be able to do this next stuff

I also made the YAML changes to reset OctoPrint to its first-run wizard per https://community.octoprint.org/t/i-forgot-my-octoprint-password-how-can-i-reset-it/215#heading--single-user

anyway, my plan now is to ssh into the pi user once the system is turned on, then reset the user password, and also go through the wizard

to do both of these, though, I want the system on its fixed-assigned IP address, which is through the stock firmware on my router, which doesn't let you manually preempt DHCP records, so I'm just waiting it out until two hours have passed and it'll consult its static assignment table. (looks like I spent long enough getting around to writing this note that it's cycled out already.)

this got me on the train of thought of [reflashing my router](hbsf7-0ab83-rg8v3-7751k-xf80a) to something where I could clear an entry from the DHCP cache, which is why it took me so long to get around to just making this page and writing this stuff
