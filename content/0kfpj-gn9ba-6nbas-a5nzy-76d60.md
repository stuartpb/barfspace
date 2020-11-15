# A neat idea for a USB hub

Okay, so it's more than just a hub, it's kind of the prototype for my "level that operates below Longhorn for provisioning disks"

## the plastic / housing level

so, you'd take one of those, let's say for the kit you use one of those "octopus USB hubs", and you basically put all of those in a shell

and the shape of the shell is designed so each one is in a different identifiable position

my original thought for this was going to be

## anyway, the clever idea

The idea was, you'd have it set up so, if the hub is recognized as one of yours, like, you can distinguish which stick is which by port

and, like, you could even configure it so each port is connected to a different pod, so, like, you could move your videos from the editing pod to the disc-burning pod by moving the stick in the hub, if that's how you wanna roll, old school like that

## Dismount Interface

In contrast to the raw power switches on this 7-port hub I have now, and the power LEDs on them

let's say we have the LED panel controllable... like, if there's a thing that's a five-way switch and a WS2812 in one (I think there is), we use that

## How a unmount switch interface would work

- you can have it so you have to hold the "NeoPixel Nubbin" button to the side to unmount a device
  - or even a specific side, like "down" to take the disk down
  - and it won't start to unmount until the light dims to the "OK" point
    - like shutting down a Chreombook
    - visually, maybe it fades from Blue (like the "powered on" light on my hub) to Orange
      - or the other way around
      - I feel like "to Green" is a little played out
      - Maybe it's to-white? Or to-blue-or-orange-or-purple
      - I like a "sunset" metaphor:
        - the LEDs can keep a responsible color temperature for time of day
        - and holding the button transitions to a "sunset" dark purple
          - which then switches to a dim-light "moonlight" to symbolize that the disk will be unmounted
          - The light can switch to something like "solid dim glowing white"
          - All this can be ordered and/or monitored on the Web Dashboard as well

Hmm... What if the "button" was the actual port? And it handled differently for different storage types: USB sticks are expected to be tilted to the side, and hard disks / other cabled devices are expected to be pushed in

Or what if that's enough: you could just have it so your ports are lit and on switches, and you unmount a device by pushing in until it "sunsets"?

## Driving the interface

Also, damn, I guess this would be overkill to drive these through Prometheus: you'd just have a daemon that mounts the device to read the switches and insert / track pod-disk-enabled updates to Longhorn (once in Moonlight Mode)

This might be more reasonable to go through Prometheus / Grafana, though: when it starts "sunsetting" a device, the stats for it get displayed on the LED / E-ink display on the front, like "this many volumes out of this many with a replica here currently being rescheduled, please wait..."

- and the core thing is that you'd want this drive and its replicas to be re-introducable at a later time
  - and once it's reintroduced, its replicas can be synced / restored to the schedule / de-provisioned as applicable
    - like "we don't need a fourth copy of our three-replica workspace that hasn't been synced in six months, go ahead and destroy that"

## a possible way this could work in Longhorn?

Once a disk is known to the system, it is tracked in some outside store (we can use that), and if it disappears and reappears on any other node, the udev rule lets us know and we re-add it to the node it's added to

the "get ready to unmount" works by disabling a volume on a Node, then unmounting it - once it's gone, the volume is deleted from the node

or do we have to keep it on the node for it to remember, like, what persistentvolumes were on it? Can we track / restore that from the actual filesystem?

anyway, it's unmounted once it's all sunset, and not enabled until it's added to a node where it was just plugged in and mounted by udev

## transitioning disks

if one of your disks breaks and goes read-only (ie. a MicroSD), can you insert a new MicroSD and transfer the volumes over by "enabling" the new one as elegible for the same classes of volume, then disabling the old one?

## animal style?

this could maybe be the "head" of the cases work...

okay, awesome, so that's the aesthetic of the "animals": they look like robots, so it's totally cool if you replace one's "eye" with a USB cable to a webcam or screen, they'd just look like Inspector Gadget or those robots from Fallout New Vegas's Old World Blues

and you make it so the whole thing can be modular, each "limb" or whatever has some kind of through-hole

so you can put an Ethernet cable in through the foot/leg, which would look normal

that's another thing, this makes it normal to replace your animal's eyes/face with a screen - you could even go the eInk route like the Pwnagotchi (imagine you have Unikitty making a face!)

## anyway, why you'd have the ports pre-labeled like this

this would make it so you wouldn't have to know who made your flash drive to know you plugged it into the "FEATHER" port, or the "WORK" port, or the "MEDIA" or "PLAY or whatever port

and I guess these would probably be mounted by a udev rule under some special name? or they wouldn't have to be, the higher-level daemon could handle figuring out this metadata (though udev could have a rule that inserts it some readable way)

anyway, in the interface it'd be like "The USB disk inserted into "EAR" is blank, and formatted for Any Old Thing (FAT, the "For Any Thing" filesystem).

and there's a button that's like "It's safe to Reflash

- and you could even have a plugin here that's like "Forensically Recover Disk", if it only *looks* like "everything's deleted" (ie. it was fast-formatted)

Also, this could maybe be a Cockpit module?

## Skipping ahead a bunch

Okay, so, like one thing it would provide would be a facility - maybe with some kind of integrated buttons that enumerate as, I don't know, whatever kind of device is easiest to reprogram as a "buttons controller" that won't interfere with your command line or anything, ie. won't register as an HID to the system by default

anyway, you'd have a daemon / dashboard where you could click a port (on a model of your hub, which I'm thinking these special hubs would be designed for, but also you could make your own labels)
