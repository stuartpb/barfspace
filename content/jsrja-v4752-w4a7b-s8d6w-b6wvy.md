# 2013-09-02

EVERYTHING from when I started the system image!

- Ran pacman -Syu (after noticing pacman -S systemd was failing due to the record being out of date).
- Had to quit that, run pacman -S pacman -f to force some BS library conflict or somthing
- Ran the key init things (connected again in another terminal and ran ls -R / a couple times)
- another couple pacman -Syuf runs, ignoring errors
- pacman -S systemd, pacman -S systemd-sysvcompat
- reboot through Linode's interface because I just put the system in a state where it can't reboot via "reboot"
- login as root again, remember I forgot to add /etc/hostname and /etc/timezone (ignoring the locale-configuration stuff right now because boring)
- systemctl enable multi-user.target #(dammit jim, I'm a server, not a desktop!)
- notice there's no network when trying to pacman -S mosh, so systemctl start dhcpcd@eth0.service
- systemctl enable dhcpcd@.service #so networking will work in the future
- Added stuart with adduser (group is users, also belongs to wheel)
- Sudo was already installed (probably a Linode thing, that), so I just had to uncomment the wheel line in visudo
- replaced root's password in /etc/shadow with !
- installed node, mongodb, redis
