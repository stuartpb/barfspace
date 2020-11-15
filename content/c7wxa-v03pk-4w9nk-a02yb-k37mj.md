# systemd-swap setup

I've been flying without swap for a while, since this machine has 12G of RAM or something, but I'm trying ambitious OpenSCAD renders and it's starting to freeze my system.

I hit Ctrl+Alt+F2 to get to a text terminal, then ran `top -o %MEM` to see what had the most consumption (unsurprisingly, it was `openscad`), then used `kill` to kill that PID.

Since the WM still seemed frozen, from the PTTY, I continued to follow https://wiki.archlinux.org/index.php/Swap#systemd-swap (reading off of a nearby Chromebook) to run `sudo pacman -S systemd-swap`, then `sudo nano /etc/systemd/swap.conf` to set `swapfc_enabled=1`, as well as `swapfc_max_count` to 0 (since I want to be able to potentially use this to swap out a full RAM state, eg. for hibernation, though I'm not sure if that's supported).

Well, okay, reviewing https://github.com/Nefelim4ag/systemd-swap/blob/master/README.md#about-configuration it definitely isn't supported, but, you know, whatever

I don't honestly get why systemd doesn't provide some kind of mechanism to auto-generate a swap file on hibernation... whatever

reviewing `journalctl -u systemd-swap` showed that I was getting the ENOSPC failures, so I set forced preallocation to "on"

Curious about why I needed this, I looked at the source, and it looks like [this should be forced on for anything that isn't btrfs](https://github.com/Nefelim4ag/systemd-swap/blob/master/systemd-swap#L264), not sure why I didn't see that behavior

I also set the `swapfc_max_count` to 32 since the output showed that, rather than supporting 0 as "unlimited" as the comments claimed, the actual value gets rounded up to 1 as it only supports values from 1 to 32

Okay, I tried following this just now

2018-06-08: today was the day systemd-swap finally freed a bunch of chunks it allocated a few days ago, my swappiness is still at 90

anyway I rebooted and now I think everything's basically fine
