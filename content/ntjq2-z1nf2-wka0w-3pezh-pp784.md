# A Snapshot of Early Stubernetes ideas

I went through a tumultuous relationship with the network adapters and this device.

At one point, I wanted to get a Raspberry Pi 0 W, just so it could host all my "internal" services (or at least an ingress server that would route their traffic), and studtop could handle the "external" services (ie. so I could have an IP address I could point the router to, and an IP I could point internal browsers to).

Then I was like "oh, duh, I don't need to get a second device to have two network addresses! I can just add a wired network interface, and then that'll let me give the device a second DHCP reservation!"

And then it was like "oh wait, I don't need to do this with DHCP reservations, I can just reserve an unused part of the 192.168 block on the internal network and resize the subnet mask, then I can spawn new IPs on the fly"

in hindsight, I could have even reserved part of 192.168.0, if I felt like it, but I've decided to let 192.168.0 be "DHCP"

see [Numbering Plan](2ehz6-qdw71-178bs-sgst1-n5req)
