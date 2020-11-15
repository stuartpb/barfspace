# kernel issues and the case of the broken wifi

after doing a `pacman -Syu` due to some screen-flickering issues, I rebooted only to find [my wifi was broken](https://bbs.archlinux.org/viewtopic.php?pid=1871255#p1871255)

added a `/etc/modprobe.d/blacklist-gsmi.conf` with `blacklist gsmi` in it

Now I'm going to try updating my firmware and BIOS and stuff to see if I can make it work without the blacklisting via [the script I used to set all this up in the first place](https://mrchromebox.tech/#fwscript)

after doing `pacman -S dmidecode`, it tells me I need to boot with `iomem=relaxed`, so I'm rebooting and seeing if I can swing that

added `options nopat iomem=relaxed` to the bottom of `/boot/loader/entries/*.conf` (there's only one, and I don't feel like recapping the machine ID here), since I didn't feel like figuring out how to make the boot menu appear (space at boot drops me to the firmware menu, not systemd-boot's menu)

script reran successfully - rebooted and removed the line from the bootloader entry

now I'm going to see if commenting out the gsmi blacklist works
