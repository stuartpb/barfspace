# stumez setup

Booted from [ventoy setup](48f27942-9c45-48c0-9d69-ff5957c17fda.md)

startup for the installer took a while, like at least a solid minute after the bar at the bottom went fully green

set hostname to just "stumez", with dhcp setting disabled

didn't mess with the storage setup.

Couldn't mount the root ventoy partition (of course - also this is probably why startup took so long)

since that meant I didn't have a flash drive to pull the pubkey from, I decided to just use a temporary password

## after rebooting

I SSHed in and did `mkdir .ssh && curl https://github.com/.ssh/authorized_keys`; after exiting and re-entering to confirm this worked, I did `passwd -dl root`

I also go ahead and rename `stumethyst` to `stunster` and reboot it

I'll touch this more once the new sturl arrives
