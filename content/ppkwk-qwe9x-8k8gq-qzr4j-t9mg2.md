# New case etc

Used the stylus to [calibrate the touchscreen](http://www.chip-community.org/index.php/Calibrate_Touchscreen)

setting hostname via `hostnamectl set-hostname stuchip`

rebooted. changed first line of /etc/hosts to match the new hostname

## bluetooth headset

reading http://www.chip-community.org/index.php/Bluetooth#How_To_Connect_to_a_Bluetooth_Speaker

installed `bluez-tools pulseaudio-module-bluetooth`

```
bluetoothctl
power on
agent on
scan on
pair 06:ED:91:65:0C:DA
connect 06:ED:91:65:0C:DA
quit
```

## later

went back into bluetoothctl and did `trust 06:ED:91:65:0C:DA`; hoping this will auto-pair?

[this RPi Stack Exchange question](https://raspberrypi.stackexchange.com/q/53408) suggests it's excruciatingly difficult :frown:
