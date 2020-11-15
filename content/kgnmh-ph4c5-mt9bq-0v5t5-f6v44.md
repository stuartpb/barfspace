# 2018-03-13

okay so a week ago I tried a `pacman -Syu` right before I had to leave for a meeting, which was a bad idea. I tried to have the update running with me with the lid closed in the car after all the packages were downloaded, but it appears that it went to sleep at some point

when I tried to wake it up, it was installing boost

anyway I'm too busy to recap right now but long story short I resolved the broken installation but wifi is still not working

### attempt to recap from memory three months later

I bought a USB ethernet adapter to work around the broken wifi problem but, as I mentioned, dhcpcd was failing (I feel like I pasted the manner in which it is failing somewhere I can't definitely remember), so I brought up the adapter with

```bash
sudo ip link set eth0 up
sudo ip addr add 192.168.0.200/24 dev eth0
sudo ip route add default via 192.168.0.1
```
