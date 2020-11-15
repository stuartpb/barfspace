# 403 Network Setup for October

adding `option domain '403.testtrack4.com'` under `config dhcp 'lan'` in `/etc/config/dhcp` (duplicating the entry under `config dnsmasq` which is most likely not getting read) per docs in https://openwrt.org/docs/techref/odhcpd (I suppose this also duplicates the one in `/etc/config/unbound` for the DNS system)

needed for [The New systemd-resolved plan](18rma-ergve-37b22-0wrya-f8ygz)

I restarted odhcpcd to test this, and it looks like it worked (`hostname -d` prints the local domain, `hostname -f` works, `/run/systemd/resolve/resolv.conf` ends with `search 403.testtrack4.com`, etc), but that appears to have cleared out all my lease records, so I'll head to bed and check after I wake up
