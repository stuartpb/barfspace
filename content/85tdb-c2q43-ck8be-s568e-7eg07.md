# enabling zram

looks like I already had systemd-swap installed, maybe because I was looking to follow up [the time I installed it on Stushiba](c7wxa-v03pk-4w9nk-a02yb-k37mj)

now I'm running `sudo nano /etc/systemd/swap.conf` and setting `zram_enabled=1` (not making any other changes)

running `systemctl status systemd-swap.service` implies that it's enabled, and finished?

```
● systemd-swap.service - Manage swap spaces on zram, files and partitions.
   Loaded: loaded (/usr/lib/systemd/system/systemd-swap.service; enabled; vendor preset: disabled)
   Active: active (exited) since Thu 2019-08-29 17:42:43 PDT; 3h 50min ago
 Main PID: 367 (code=exited, status=0/SUCCESS)
    Tasks: 0 (limit: 4633)
   Memory: 0B
      CPU: 0
   CGroup: /system.slice/systemd-swap.service

Aug 29 17:42:43 stuzzy systemd[1]: Started Manage swap spaces on zram, files and partitions..
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: Load: /etc/systemd//swap.conf
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: Zswap: backup current configuration: start
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: Zswap: backup current configuration: complete
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: Zswap: set new parameters: start
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: Zswap: Enable: 1, Comp: lz4,  Max pool %: 25, Zpool: zbud
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: Zswap: set new parameters: complete
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: swapD: pickup devices from systemd-gpt-auto-generator
Aug 29 17:42:43 stuzzy systemd-swap[367]: INFO: swapD: searching swap devices
```