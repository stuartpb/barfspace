# 2018-02-01

After the January update came out and wouldn't install to my phone (the installation failing every time, probably because I inadvertently hadn't checked the "preserve dm-verity" checkbox in Magisk), I managed to successively screw the system up more and more with botched attempts to make the problem go away until, after flashing a factory image with outdated Android developer tools (which may or may not have been the problem), the system just altogether froze at boot.

I fixed it by extracting the images from latest factory image's zip and running [this script](https://forum.xda-developers.com/pixel-2-xl/development/tool-deuces-bootloop-recovery-flashing-t3704761), which made the problem go away.

After that, since I already had the new `boot.img` extracted (and, even if I hadn't uninstalled Magisk in one of my botched recovery attempts, Deuce's script probably would have wiped it anyway), I ran it back through the Magisk patcher and re-ran the steps I did above to flash the patched boot image (running `fastboot --set-active=_b`, redoing it, and `fastboot --set-active=_a` again afterward for good measure).

## addendum 2019-09-12

[something like this happened again](m1r14-mty9t-gm8ff-76t1r-vf36z), and this time I remember more of the details about how it went wrong
