# Samsung Chromebook Resources

- http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook
- http://www.chromium.org/chromium-os/firmware-porting-guide/using-nv-u-boot-on-the-samsung-arm-chromebook

## MrChromebox resources

- https://mrchromebox.tech/#fwscript
- https://github.com/MrChromebox/scripts

## Arch Linux (ALARM) resources

These are frequently the best resource on various issues with the system you'll find:

- https://archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook
- https://wiki.archlinux.org/index.php/Chrome_OS_devices
- [forum thread from 2013 talking about reflashing](https://archlinuxarm.org/forum/viewtopic.php?f=27&t=4016&start=130)

## Hacking recovery

I completely rewrote the machine because I couldn't boot from USB, but this probably would have been the simpler way to do it:

http://dev.chromium.org/chromium-os/developer-information-for-chrome-os-devices/workaround-for-battery-discharge-in-dev-mode#TOC-How-to-recover

Maybe next time, if I can't get the flashrom/GBB stuff working

## flashrom

- https://dev.chromium.org/chromium-os/packages/cros-flashrom
- https://chromium.googlesource.com/chromiumos/third_party/flashrom/+/refs/heads/master
- https://archlinuxarm.org/packages/armv7h/flashrom-google

## GBB

- https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/refs/heads/firmware-snow-2695.B/firmware/include/gbb_header.h
  - this is the branch for the Snow board that runs this machine - the file's been removed from master
