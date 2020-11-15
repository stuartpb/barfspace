# 2018-09-26

I want mDNS, so I'm reading https://wiki.archlinux.org/index.php/avahi#Using_Avahi and doing `sudo pacman -S nss-mdns`, `sudo systemctl enable --now avahi-daemon.service`

inserting `mdns` in `/etc/resolv.conf` on a line that now reads `hosts: files mymachines myhostname mdns resolve [!UNAVAIL=return] dns`

still can't find my flashair, so I'm trying to set up NetBIOS via Samba. Enabled a bunch of services, but then realized they all failed to start because I hadn't made an `/etc/samba/smb.conf` (per [the wiki][]), so I took the wiki's advice and downloaded [the default from their git repository][default] and made the following changes:

- changed the workgroup to "WORKGROUP" (per the wiki's sort-of advice)
- `server string = Stushiba`
- changed the log file location to `/var/log/samba/%m.log` per the wiki's advice

okay, now I've enabled winbind.service and added `wins` after `mdns` in `/etc/nsswitch.conf`... still nothing. I don't know. I might reboot into stutendo and flash the newer firmware to this card. After that, I can boot back to here and see if I can find the card then.

[default]: https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD

[the wiki]: https://wiki.archlinux.org/index.php/Samba#Server
