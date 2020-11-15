# picking up with bootstrapping postmarketos on stuzzy

pulled boot img via GNOME files ssh and `pmbootstrap bootimg_analyze boot.img`

fails at

```
[12:40:39] (native) install alpine-base
[12:40:44] NOTE: Valid pkgvers are described here:
[12:40:44] <https://wiki.alpinelinux.org/wiki/APKBUILD_Reference#pkgver>
[12:40:44] ERROR: Invalid pkgver '3.x.x' in APKBUILD: /home/stuart/.local/var/pmbootstrap/cache_git/pmaports/device/linux-rca-voyager-pro-mtk/APKBUILD
[12:40:44] See also: <https://postmarketos.org/troubleshooting>
Run 'pmbootstrap log' for details.
```

I go ahead and hack that to `3.4.5` via `code /home/stuart/.local/var/pmbootstrap/cache_git/pmaports/device/linux-rca-voyager-pro-mtk/APKBUILD`, who cares, if all I want to do is the bootimg_analyze thing

(incidentally, also turning off `editor.emptyTextSelection` in VS Code)

```
[12:46:17] (native) install file unpackbootimg
[12:46:20] Put these variables in the deviceinfo file of your device:

deviceinfo_kernel_cmdline="bootopt=64S3,32N2,32N2 buildvariant=user"
deviceinfo_generate_bootimg="true"
deviceinfo_bootimg_qcdt="false"
deviceinfo_bootimg_dtb_second="false"
deviceinfo_flash_offset_base="0x40000000"
deviceinfo_flash_offset_kernel="0x00008000"
deviceinfo_flash_offset_ramdisk="0x15000000"
deviceinfo_flash_offset_second="0x00f00000"
deviceinfo_flash_offset_tags="0x14000000"
deviceinfo_flash_pagesize="2048"

[12:46:20] NOTE: chroot is still active (use 'pmbootstrap shutdown' as necessary)
[12:46:20] Done
```

I immediately `pmbootstrap shutdown` of course

I've been thinking I might throw all this away and retry with the actual model number now, since I've seen enough variants that seem like they have breaking differences

## starting again in earnest

RECAP: starting from [here](https://wiki.postmarketos.org/wiki/Porting_to_a_new_device#Initialization)

[prompt log](1b5ac-w3rtw-6j8wj-nxy37-ferr4)

I immediately open the APKBUILD and deviceinfo files

I rewrite the device name back to just "RCA Voyager Pro" in all three, and change the manufacturer to "RCA" in deviceinfo. The Alco thing is just too obscure, IMO.

Changed screen width to 1024 (the default height of 600 is accurate)

## setting up the kernel package

continuing to [here](https://wiki.postmarketos.org/wiki/Porting_to_a_new_device#Kernel_package)

gonna try [this repository](https://github.com/mbgg/linux-mediatek/) since, from what I can tell, this is one of the core kernel devs for mediatek chipsets

### other links

I also looked at https://github.com/MotorolaMobilityLLC/kernel-mtk or something from https://android.googlesource.com/kernel/mediatek/ but they're both ancient

[more docs on the kernel config for this](https://cateee.net/lkddb/web-lkddb/ARCH_MEDIATEK.html)

Finding https://github.com/LineageOS-MediaTek/android_device_mediatek_common

## continuing to set up the kernel

anyway, copying the commit in that repo for 5.6.0-rc1 as the `_commit`

Now I need to [get the kernel config](https://wiki.postmarketos.org/wiki/How_to_find_device-specific_information#Kernel_defconfig_.28default_config.29)

This isn't listed on that page, but `/proc/config.gz` is suggested [here](https://superuser.com/questions/287371/obtain-kernel-config-from-currently-running-linux-system), and that actually works - I download the config via `adb pull /proc/config.gz` and unzip it to `config-rca-rct6873w42bmf9a.armv7` in the package directory

running `pmbootstrap zap` and `pmbootstrap checksum linux-rca-rct6873w42bmf9a` (after changing the pkgver to `5.6.0_rc1` to meet Alpine packaging conventions)

```
[13:36:24] (native) install abuild build-base ccache git
[13:39:54] (native) generate abuild keys
[13:39:55] (native) generate checksums for linux-rca-rct6873w42bmf9a
[13:46:44] NOTE: chroot is still active (use 'pmbootstrap shutdown' as necessary)
[13:46:44] Done
```

now we try the config:

```
[stuart@stuzzy linux-rca-rct6873w42bmf9a]$ pmbootstrap kconfig edit linux-rca-rct6873w42bmf9a
[13:55:20] PROTIP: You can simply do 'pmbootstrap kconfig edit rca-rct6873w42bmf9a'
[13:55:25] WARNING: package devicepkg-dev: aport version 0.11.2-r0 is lower than 0.11.3-r0 from the binary repository. 0.11.3-r0 will be used when installing devicepkg-dev. See also: <https://postmarketos.org/warning-repo2>
[13:55:25] (native) install bash bc bison devicepkg-dev flex openssl-dev perl ncurses-dev
[13:56:46] (native) extract kernel source
[13:57:21] (native) apply patches
>>> linux-rca-rct6873w42bmf9a: gcc7-give-up-on-ilog2-const-optimizations.patch
patching file include/linux/log2.h
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
3 out of 3 hunks ignored -- saving rejects to file include/linux/log2.h.rej
>>> ERROR: linux-rca-rct6873w42bmf9a: prepare failed
[13:57:21] NOTE: The failed command's output is above the ^^^ line in the log file: /home/stuart/.local/var/pmbootstrap/log.txt
[13:57:21] ERROR: Command failed: (native) % cd /home/pmos/build; busybox su pmos -c CARCH=armv7 HOME=/home/pmos abuild prepare
[13:57:21] See also: <https://postmarketos.org/troubleshooting>
Run 'pmbootstrap log' for details.
```

welp, looks like we need to remove patches

`gcc7-give-up-on-ilog2-const-optimizations.patch` [looks obsolete](https://github.com/mbgg/linux-mediatek/blob/master/include/linux/log2.h) (the checks it removes seem to already be removed), and `gcc8-fix-put-user.patch` explicitly says it's for older kernels, so we can ditch that too. `kernel-use-the-gnu89-standard-explicitly.patch` looks like it's been worked in as well

## configuring

following the notes on [this page](https://wiki.postmarketos.org/wiki/Kernel_configuration#Changing_the_kernel_configuration)

not seeing the PARANOID ANDROID network thingy, can't search in the GTK interface

Also can't find the Qualcomm thing

enabling DRM_MEDIATEK

can't find USE_VFB, probably because VFB isn't enabled

Can't find KINETO_GAN

Can't find LBDAF - is this a 64-bit kernel?

enabling all the MACH_MT bits under ARCH_MEDIATEK

for some reason Trance Vibrator is enabled by default?

firmware sysfs thing is already enabled

turning on KEY_DH_OPERATIONS

## retrying from console

`ANDROID_PARANOID_NETWORK` just isn't here (not in any mainline kernel?)

no `PFT` or `VFB` or `KINETO`

`BLK_DEV_INITRD` is on

no `LBDAF`

actually, none of the symbols they list with ANDROID (ie. the USB Gadget one) seem to be here
