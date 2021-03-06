# 2019-09-12

Ran into a similar situation as [2018-02-01](11te6-t4y0w-fz91h-ktfas-11we3): I did a "Restore Image" for Magisk per [the tutorial advice][tut1], then tried to install the OTA to update to Android 10, but the update dialogue just got stuck on "Downloading and installing update..." as a spinner, indefinitely, so I decided to pause that and reboot, thinking that this would solve whatever the problem was, and rebooting would unblock whatever was interfering with the update.

It did not. After rebooting, the phone went into a bootloop at the G logo, and I struggled for a long time trying to connect to it to do something like an ADB OTA sideload. The phone wouldn't register as a USB device to adb, even when I uses the Vulcan Nerve Pinch to reboot into recovery and explicitly put the phone into "Apply update from ADB" [as recommended in the official instructions][ota].

I confirmed when the USB stuff wasn't working by having it plugged into my 24-port USB hub: when the phone was working as a USB client, the light on the hub for its port would turn on - otherwise, I believe it got power over the cable, but the hub didn't otherwise acknowledge its presenve.

I say that the light went on when it was operating as a USB device because the light *did* come on under one circumstance: no matter how much rebooting, powering down, unplugging, flipping, and all that other interference I employed, I *did* see the hub's light go on when the phone was in the Bootloader (the part with the arrow pointing at the power button and the big Android on its back, where you have options like "BARCODES" and "Power off"), and I think it said "Fastboot enabled" on screen - doing a `fastboot devices` actually returned something for the device.

Once I had the phone in this responsive mode (and I tried rebooting / shuffling around a few more times to confirm that `adb` wouldn't respond if I tried rebooting into recovery or letting the phone try to boot normally again), I downloaded `taimen-qp1a.190711.020-factory-6f0233dd.zip` from [Google's page](https://developers.google.com/android/images#taimen) and put it in a subdirectory with the latest version of [Deuce's Bootloop-Recovery & Flashing Script][deuce], which I then ran. I hit "y" for the initial warnings that things could go wrong, then hit "N" when given the option to format user data, leaving me with a phone that had basically just been clean OTA'd!

[tut1]: https://github.com/topjohnwu/Magisk/blob/master/docs/tutorials.md#ota-installation
[ota]: https://developers.google.com/android/ota#instructions
[deuce]: https://forum.xda-developers.com/pixel-2-xl/development/tool-deuces-bootloop-recovery-flashing-t3704761

## Magisk

Going into the app, it says Magisk Manager is installed but Magisk is not - I click "Install" and my only optios are "Download ZIP only" and "Select and Patch a File", so I go into the `_work` directory of the Deuce script and extract `boot.img` from the next-level archive in there, then transfer that over to the phone via MTP

```
- Device platform: arm64-v8a
- Existing zip found
- Copying image to cache
1022+1 records in
1022+1 records out
1047368 bytes (0.9 M) copied, 0.004261 s, 234 M/s
- Unpacking boot image
Parsing boot image: [/data/user_de/0/com.gIC.j.h.B.MeNtRs/install/boot.img]
HEADER_VER      [0]
KERNEL_SZ       [14963074]
RAMDISK_SZ      [10546737]
SECOND_SZ       [0]
EXTRA_SZ        [0]
RECOV_DTBO_SZ   [0]
DTB             [0]
OS_VERSION      [10.0.0]
OS_PATCH_LEVEL  [2019-09]
PAGESIZE        [4096]
NAME            []
CMDLINE         [console=ttyMSM0,115200,n8 earlycon=msm_serial_dm,0xc1b0000 androidboot.hardware=taimen androidboot.console=ttyMSM0 lpm_levels.sleep_disabled=1 user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 service_locator.enable=1 swiotlb=2048 firmware_class.path=/vendor/firmware loop.max_part=7 raid=noautodetect usbcore.autosuspend=7 androidboot.dtbo_idx=12 buildvariant=user]
CHECKSUM        [69705fb4ce3a4a10f8605c]
KERNEL_DTB      [392041]
KERNEL_FMT      [lz4]
RAMDISK_FMT     [gzip]
- Checking ramdisk status
Loading cpio: [ramdisk.cpio]
- Stock boot image detected
- Backing up stock boot image
- Patching ramdisk
Loading cpio: [ramdisk.cpio]
Add entry [init] (0750)
Patch with flag KEEPVERITY=[true] KEEPFORCEENCRYPT=[true]
Loading cpio: [ramdisk.cpio.orig]
Backup mismatch entry: [init] -> [.backup/init]
Create directory [.backup] (0000)
Add entry [.backup/.magisk] (0000)
Dump cpio: [ramdisk.cpio]
Patch @ 0181B26E [736B69705F696E697472616D667300]->[77616E745F696E697472616D667300]
- Repacking boot image
Parsing boot image: [/data/user_de/0/com.gIC.j.h.B.MeNtRs/install/boot.img]
HEADER_VER      [0]
KERNEL_SZ       [14963074]
RAMDISK_SZ      [10546737]
SECOND_SZ       [0]
EXTRA_SZ        [0]
RECOV_DTBO_SZ   [0]
DTB             [0]
OS_VERSION      [10.0.0]
OS_PATCH_LEVEL  [2019-09]
PAGESIZE        [4096]
NAME            []
CMDLINE         [console=ttyMSM0,115200,n8 earlycon=msm_serial_dm,0xc1b0000 androidboot.hardware=taimen androidboot.console=ttyMSM0 lpm_levels.sleep_disabled=1 user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 service_locator.enable=1 swiotlb=2048 firmware_class.path=/vendor/firmware loop.max_part=7 raid=noautodetect usbcore.autosuspend=7 androidboot.dtbo_idx=12 buildvariant=user]
CHECKSUM        [69705fb4ce3a4a10f8605c]
KERNEL_DTB      [392041]
KERNEL_FMT      [lz4]
RAMDISK_FMT     [gzip]
Repack to boot image: [new-boot.img]
HEADER_VER      [0]
KERNEL_SZ       [14961609]
RAMDISK_SZ      [10755539]
SECOND_SZ       [0]
EXTRA_SZ        [0]
RECOV_DTBO_SZ   [0]
DTB             [0]
OS_VERSION      [10.0.0]
OS_PATCH_LEVEL  [2019-09]
PAGESIZE        [4096]
NAME            []
CMDLINE         [console=ttyMSM0,115200,n8 earlycon=msm_serial_dm,0xc1b0000 androidboot.hardware=taimen androidboot.console=ttyMSM0 lpm_levels.sleep_disabled=1 user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 service_locator.enable=1 swiotlb=2048 firmware_class.path=/vendor/firmware loop.max_part=7 raid=noautodetect usbcore.autosuspend=7 androidboot.dtbo_idx=12 buildvariant=user]
CHECKSUM        [6409996c9d5513372a4cbe0a2bbc81a02d6dfb9e]

****************************
 Output file is placed in
 /storage/emulated/0/Download/magisk_patched.img
****************************
- All done!
```

Downloaded magisk_patched.img back to the desktop per [instructions](https://topjohnwu.github.io/Magisk/install.html)

re-enabled USB debugging through a lot of unplugging and replugging, then did `adb reboot bootloader` instead of the Nerve Pinch, then `fastboot flash boot magisk_patched.img`, which put it into `boot_a`.

I think I *could* put it into `boot_b`? But that's what got me into this whole mess

maybe I did one upgrade blindly in the past, and this came about mecause I still had the bad boot on

anyway, hitting the button for "Start"

Magisk Manager says everything's installed

renaming MagiskManager folder in storage to MessinWithAndroid
