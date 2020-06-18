# Optimizing for Flash Media

I'm thinking we could set up udev rules to make sure our flash media is used optimally:

- https://unix.stackexchange.com/questions/65595/how-to-know-if-a-disk-is-an-ssd-or-an-hdd
- https://wiki.archlinux.org/index.php/Solid_state_drive
- https://wiki.debian.org/SSDOptimization

I was thinking this might be an alteration/adjustment that could live in udev:

- https://www.linuxquestions.org/questions/linux-laptop-and-netbook-25/modifying-mount-options-ro-rw-etc-during-automount-via-udev-510341/

Actually, if the kernel has this info, won't the driver mount them like solid-state media by default? Is this only needed if you have some emulation layer like Logical Volumes in the way?
