# adding new hardware to Studtop

I'm not wild about how studtop looks to be rapidly approaching the limits of its

## A Harrowing Ordeal of Stupidity

So, I got a cheap seven-port USB 3.0 hub (with power supply) and a 64 gig USB 3.0 flash drive today.

I plug them in and, since I've also run out of ports on the power strip powering studtop +  my 3D printer + the router + a lamp + air filter + more, I decide to replace studtop's power connection with another daisy-chained power strip, and plug studtop's power supply into that as well as the new hub's power supply. "Good thing studtop's a laptop", I think to myself. "I can move its power supply around because it's got a built-in UPS."

I decide to unplug the combination USB ethernet adapter + 3-port hub I've been using, so I can route everything through the 7-port hub (where the ports run parallel to the top, rather than perpendicular to it). As I'm plugging this in, I have the thought: "Huh, that's weird, the lights signifying which ports are powered just kind of run out of juice by the sixth port."

"Well, the hub's power supply is plugged in, and the LED is on. Must just be a defective LED strip. Cheap USB hub."

A little while later, I decide I want to start looking into how I might set up this new USB drive (as well as another USB drive I already had lying around, which I was planning to use for swap, [not realizing until right now as I type this that Kubernetes, by design, can't actually use swap](https://github.com/kubernetes/kubernetes/issues/53533)). I try to `ssh rancher@192.168.0.22", and it tells me there's no route to host. Huh, okay, that's weird.

I check the router's DHCP table, and it shows there's still a record for the Wi-Fi adapter requesting a lease?

On a lark, I decide to `ssh rancher@192.168.0.37`, and this actually *works*, which is a sign that the old configuration with my wi-fi setup isn't as dead as I thought (or, at least, connman still has a standing config file for it). At the moment, I'm thankful for this: I'm not gonna bother reversing it, since, with MetalLB taking care of service IPs across interfaces, it's ultimately a win for reliability. However, I still want to know why the Ethernet isn't working.

Right then, the SSH connection dies and everything goes to shit.

I see the lights on the hub (and its connected peripherals, including the hub's power supply for some strange reason) flashing on and off, over and over. I run over to the machine to open the lid, and see that it's caught in a boot loop. I swear loudly and hit the power button to break the cycle.

*Shit*, I think to myself. *A power surge from this cheap hub must have tripped the polyfuse.* I eject/unplug everything I can, and take studtop over to my desk.

I keep trying to boot, and it only lasts a few seconds before looping. I decide to unplug the power, let it cool off for fifteen minutes, then I'll try a boot again and see how long it lasts (presumably, until the battery runs out).

I start to wonder: *why would a USB overvoltage issue kill the whole machine?* If it were just the hub going overvoltage, you'd only expect it to blow the USB port. This mainboard isn't *that* cheap.

After some time waiting, I start it up, and it gets far enough to get to the Rancher cow at the k3os MOTD. I decide to go finish what I was doing (making lunch), and  back, to find that the machine is dead, and won't turn back on... did the battery die?

I go over and take a look at that power strip I plugged everything into when I was setting this up earlier.

Oh. Fuck. Duh. Of course the battery died shortly after starting up. That's what the bootlops were. This OS doesn't have any provision for monitoring the battery. It had been dying all along. The system was running out of power, because the switch on the power strip was off.

## GROAN

I turn the power switch back on and plug everything back in as close as I can remember.

I try booting with the hub installed, but no matter which side I plug the hub into, Coreboot keeps getting stuck. If I wait until we're past Coreboot to plug the devices in, it gets stuck on "Loading device drivers."

Now, this *could* be a side effect of me having effectively caused a brownout within the hub, but in my experience with USB 3 chipsets (especially ones dating back to 2014), it's more likely that the hub and the mainboard aren't getting along.

Sure enough, I swap things around until the Ethernet adapter is plugged in directly, the hub is plugged into a port on the Ethernet stick, the hard drive is plugged into the next port on the Ethernet stick, and all the other devices are plugged into the Hub, and now everything looks right. (At least, I can see all the disks I would expect. I'm not sure if this hub works with the Coral.)

## Now that that's over with...

[Adding More Hardware](wp9bz-01xt9-m996k-s3ejj-8ec4d)
