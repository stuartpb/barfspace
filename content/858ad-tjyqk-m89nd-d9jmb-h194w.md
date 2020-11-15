# more on automounting

["Unprivileged filesystem mounts, 2018 edition"](https://lwn.net/Articles/755593/) notes that you can crash a system just by mounting a maliciously-crafted filesystem.

as such, permitting automounting it `/media` does now require USB access to become a trusted boundary. which I guess it kind of was already

found that via https://unix.stackexchange.com/questions/464959/udev-rule-to-automount-media-devices-stopped-working-after-systemd-was-updated-t

also looking at https://unix.stackexchange.com/questions/461700/how-to-mount-usb-drive-in-udev-rule

## the main thing

there's a lot of documentation out there saying to leave this to systemd, but not if you aren't running systemd

see, this is why I wouldn't want to design a system without systemd. it always ends up pulling the rug out from under you where you need it
