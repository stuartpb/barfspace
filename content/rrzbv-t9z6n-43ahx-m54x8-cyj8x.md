# More about automounting partitions

[Systemd has automounting](https://wiki.archlinux.org/index.php/Systemd#GPT_partition_automounting)

Automounting /var requires an elaborate PARTUUID construction involving the machine id: see [the discoverable partitions spec](https://systemd.io/DISCOVERABLE_PARTITIONS/) and [systemd-id128 man page](https://www.freedesktop.org/software/systemd/man/systemd-id128.html)

there's also swap automounting, which is the next thing I want to add in udev

in all these specs, partition flag bit 63 turns off autodiscovery. should add that to my udev rule

Bit 60 sets read-only - this should also be part of the udev rule
