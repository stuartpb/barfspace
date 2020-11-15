# pocketchip's battery handling is... not great

`/etc/systemd/system/pocketchip-batt.service` calls `/usr/sbin/pocketchip-batt` which calls `battery.sh` which fails because i2cset/i2cget aren't available?

Oh, right, it's this thing I've only ever seen on Debian, where rather than make root scripts just fail because the user isn't root, they put them in /usr/sbin so normal users *don't even have them in their path*

## aside about sbin

(I really ought to make a note branch for "weird legacy quirks about the Linux filesystem and how, if you use Arch, you don't need to care about them")

https://askubuntu.com/questions/308045/differences-between-bin-sbin-usr-bin-usr-sbin-usr-local-bin-usr-local

## anyway

pocketchip-batt is a script that gets called on a systemd timer and writes the average of the previous and current reading to /usr/bin/pocketchip-batt/voltage (and assumes the voltage is 3700 if it can't get it for some reason?)

also puts the charging status at `charging` next to `voltage`

it had been prompting me to shut down at 15% -- once it hit `3479` it started shutting down saying the battery had reached "0%" :thinking_face:

not sure where the component that does this lives
