# 2017-11-07: the quest for lid stuff

I want to do some fancy stuff like "just turning the screen off when the lid is closed" (and maybe introducing some kind of audio alert when the system is unplugged), so I'm looking into how to read lid state

stuff like https://unix.stackexchange.com/questions/148197/determine-status-of-laptop-lid suggests there should be a tree to read under /proc/acpi, but there isn't

running `ls -l /usr/lib/modules/$(uname -r)/kernel/drivers/acpi` as mentioned at https://wiki.archlinux.org/index.php/ACPI_modules failed with that entire `acpi` directory not existing

installed evtest based on https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=854388 and I can definitely see the information about the lid when I look at `gpio-keys.7`

welp, this sucks, but it's where I ended up: https://unix.stackexchange.com/questions/244767/sysfs-alternative-to-proc-acpi-button-lid-lid-state/403171#403171

okay, diving into some more heavy nuts and bolts with https://unix.stackexchange.com/questions/265890/is-it-possible-to-get-the-information-for-a-device-tree-using-sys-of-a-running (lol hi @cirosantilli): installing `dtc` and running... well this doesn't tell me much I didn't already know:

```
[stuart@stukilla ~]$ dtc -I fs -O dts /proc/device-tree/gpio-keys/lid-switch/ -f
<stdout>: ERROR (name_properties): "name" property in / is incorrect ("lid-switch" instead of base node name)
Warning: Input tree has errors, output forced
/dts-v1/;

/ {
	name = "lid-switch";
	gpio-key,wakeup;
	debounce-interval = <0x1>;
	linux,code = <0x0>;
	linux,input-type = <0x5>;
	gpios = <0x8 0x5 0x1>;
	label = "Lid";
};
```

the [gpio-keys][dt-docs-1] and [gpio][dt-docs-2] docs don't help me understand much more from this. I thought it might mean something on gpiochip8, possibly gpio13 (gpio8 + 5, the second byte of gpios), but that doesn't appear to reflect the lid state

[dt-docs-1]: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/input/gpio-keys.txt
[dt-docs-2]: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/gpio/gpio.txt

I even ran through and retried this for every pin from 8 to 13 via `PIN=8; sudo bash -c "echo $PIN > /sys/class/gpio/export" && cat /sys/class/gpio/gpio$PIN/value && sleep 5 && cat /sys/class/gpio/gpio$PIN/value && sudo bash -c "echo $PIN > /sys/class/gpio/unexport"` etc, closing the lid during the sleep, and no change

OK, so by doing `for pinctrl in /proc/device-tree/pinctrl@*; do dtc -I fs -O dts $pinctrl -f; done | less '+/phandle = <0x8>;' -j.5` I was able to figure out that the device would be labeled gpx3, and by doing `grep -l gpx3 /sys/class/gpio/gpiochip*/label`, I got that the device is gpiochip156, but trying PIN values like 156 and 161 via my test script above, the initial echo to `export` failed with `write error: Device or resource busy`, so I'm guessing there's some kind of exclusive-mode thing there. What a dead end waste of time.

## whatever ugh

Going ahead and installing + enabling acpid:

`sudo pacman -S acpid && sudo systemctl enable acpid && sudo systemctl start acpid`

UGH, it only has an event for when the power key goes down, not up, that's insufficient for what I need

anyway I could go ahead and configure this to set the display brightness to 0 when closed (xsetting dpms is overkill imo), but I'm kind of worn out from all this and am just going to cut it here
