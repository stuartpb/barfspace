# wifi hackery

Trying to bridge on the same interface:

I did `sudo iw dev wlp2s0 set 4addr on` (found via https://serverfault.com/a/554663/207854), and I didn't test if I got the same error as before (I don't think I've changed anything), but this was the failure I got now (after connecting to the SSID I was trying to repeat):

```
$ sudo create_ap -m bridge wlp2s0 wlp2s0 Skye-Fi
Config dir: /tmp/create_ap.wlp2s0.conf.aXYxBKyX
PID: 7365
Network Manager found, set ap0 as unmanaged device... DONE
wlp2s0 is already associated with channel 36 (5180 MHz), fallback to channel 36
Creating a virtual WiFi interface... ap0 created.
Sharing Internet using method: bridge
Create a bridge interface... br0 created.
hostapd command-line interface: hostapd_cli -p /tmp/create_ap.wlp2s0.conf.aXYxBKyX/hostapd_ctrl
Configuration file: /tmp/create_ap.wlp2s0.conf.aXYxBKyX/hostapd.conf
Channel 36 (primary) not allowed for AP mode, flags: 0x53 NO-IR
ap0: IEEE 802.11 Configured channel (36) not found from the channel list of current mode (2) IEEE 802.11a
ap0: IEEE 802.11 Hardware does not support configured channel
Could not select hw_mode and channel. (-3)
ap0: interface state UNINITIALIZED->DISABLED
ap0: AP-DISABLED 
ap0: Unable to setup interface.
ap0: interface state DISABLED->DISABLED
ap0: AP-DISABLED 
ap0: CTRL-EVENT-TERMINATING 
hostapd_free_hapd_data: Interface ap0 wasn't started
nl80211: deinit ifname=ap0 disabled_11b_rates=0

Error: Failed to run hostapd, maybe a program is interfering.
If an error like 'n80211: Could not configure driver mode' was thrown
try running the following before starting create_ap:
    nmcli r wifi off
    rfkill unblock wlan

Doing cleanup.. done
```

also reading:

- https://serverfault.com/questions/152363/bridging-wlan0-to-eth0
- https://unix.stackexchange.com/questions/554331/theoretical-tap-interface-w-wifi-parent-interface
- https://wiki.debian.org/BridgeNetworkConnections#Bridging_with_a_wireless_NIC
  - https://wiki.debian.org/BridgeNetworkConnectionsProxyArp
- https://www.reddit.com/r/VFIO/comments/9qxyrg/need_help_with_a_wireless_bridge/
  - not very helpful