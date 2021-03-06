# stustudio network numbering plan

branching off from thoughts [here](q6jn3-234fz-8gapt-bdyzh-5sjr4)

I have a numbering plan for my internal network, and I've been keeping it proprietary, but, I mean, screw it, there's more to be learned from the best practices going into this

## related stuff I should write

TODO: build a "ranges to avoid" reference to cover stuff like "most routers pick these" or "some devices default to these" or "minikube uses this range"

also, an explainer of how these addresses work for people just getting into this stuff (ie. how IPv6 would completely make this a thing of the past) would be *dynamite*

## notes

This is probably going to turn into a VPN Hub of some kind for my "network", so I guess this addressing scheme

## 192.168.0.0/24: "Personal device" DHCP reservations

- 192.168.0.33: stuflair
- 192.168.0.54: stuixel
  - my phone, its number ending in 0054
- 192.168.0.69: stuwich, my Nintendo Switch
- 192.168.0.79: abe
  - Primer's runtime being 79 minutes
- 192.168.0.83: unnamed octopi
- 192.168.0.99: stuzzy
- 192.168.0.101: stushiba/stutendo
- 192.168.0.117: Misty II ("Misty Chief")

If this range ever fills up too much, I'll probably start allocating more DHCP reservations starting with the 192.168.8.0/24

If that happens, my "terminals" / "desktops" will be the ones keeping 192.168.0.0/25, and stuff like servers (abe, octopi, stuflair, studtop) will probably get kicked to the higher ring

## 192.168.1.0/24: DHCP up-for-grabs dynamic pool

I'm using this, and not a different pool, because these IPs do have a way of working their way into configs ("soft reservations" and all), and I'd rather not have 192.168.6.0/24 be the "headers-that-arbitrarily-start-with-X" of those adoptions.

I'm actually not 100% sure what my dynamic DHCP pool is right now, but OpenWRT makes it less of a big deal

## 192.168.2.0 - 192.168.3.255: Reserved

The first few ranges are reserved for devices assigning themselves to 192.168.2.1 or whatever.

## 192.168.3.0 - 192.168.7.255: On-Device Static IPs (if needed)

These are for IP Addresses that aren't provisioned by DHCP

6 and 7 may be Static Wireless and Static Wired

reminder that devices using these should still send out a DHCP INFORM where possible

## 192.168.32.0 - 192.168.32.250: Stubernetes "household-internal-dynamic" MetalLB pool

this is the dynamic pool of IPs for household LoadBalancer services without a static IP reservation (like Contour ingresses, I guess)

## 192.168.42.0 - 192.168.42.250: Stubernetes household-internal static service assignments

- 192.168.42.53: DNS server
- 192.168.42.80: reserved for static ingress service

## 192.168.63.0/24: reserved for "exposed service" IPs

not sure if I'm going to use this yet

## 192.168.86.0/24: Subernetes Zone 403 (Household Nodes)

These are still handled by DHCP reservation

they have

- 192.168.86.23: ethernet adapter for studtop.403.stuartpb.internal
  - as this is a MAC-based reservation for a USB device, this address can migrate by plugging the hub into a different machine
  - the Ethernet adapter is also a hub with storage plugged into it
    - as such, you can thusly kind of think of the Ethernet stick as the body of the system
      -  the underlying compute node is hot-swappable
        - this would be REALLY true if we didn't use the node's onboard storage a *little*
- 192.168.86.29: the raspberry pi
- 192.168.86.37: studtop (wireless interface)
  - not in use
  - still reserved in case of emergency
    - ie. if we migrate the wired adapter somewhere else and need to access studtop, we can still do it wirelessly
  - actually, can't we just reserve the same IP as the ethernet adapter, which can be de-provisioned to associate it to another node?
    - a little googling:
      - https://www.juniper.net/documentation/en_US/junose15.1/topics/example/configuration/ip-shared-interface-configuration.html
      - https://serverfault.com/questions/705919/the-same-ip-on-multiple-interfaces
    - so: yes?

## another thought on the future of this / sharing IPs across interfaces

is there a way to do DHCP reservation based on something like machine-id instead of MAC?

how does Talos / Arges / that one blog post model it?
