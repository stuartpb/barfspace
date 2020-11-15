# stubarks pmbootstrap init take 2

```
[stuart@stuzzy voyager-pro-mtk]$ pmbootstrap init
[01:34:17] Location of the 'work' path. Multiple chroots (native, device arch, device rootfs) will be created in there.
[01:34:17] Work path [/home/stuart/.local/var/pmbootstrap]: 
[01:34:19] NOTE: pmaports path: /home/stuart/.local/var/pmbootstrap/cache_git/pmaports
[01:34:19] Choose your target device vendor (either an existing one, or a new one for porting).
[01:34:19] Available vendors (47): amazon, asus, bq, chuwi, fairphone, finepower, fujitsu, google, gp, hisense, htc, huawei, infocus, jolla, leeco, lenovo, lg, medion, meizu, motorola, nextbit, nobby, nokia, oneplus, oppo, ouya, pine64, planet, purism, qemu, raspberry, rca, samsung, semc, sharp, sony, surftab, t2m, tablet, teclast, wiko, wileyfox, wingtech, xiaomi, yu, zte, zuk
[01:34:19] Vendor [rca]: 
[01:34:20] Available codenames (1): voyager-pro-mtk
[01:34:20] Device codename [voyager-pro-mtk]: rct6873w42bmf~9a
[01:34:52] You are about to do a new device port for 'rca-rct6873w42bmf~9a'.
[01:34:52] Continue? (y/n) [y]: n
[01:35:01] Vendor [rca]: 
[01:35:03] Available codenames (1): voyager-pro-mtk
[01:35:03] Device codename [voyager-pro-mtk]: rct6873w42bmf9a
[01:35:18] You are about to do a new device port for 'rca-rct6873w42bmf9a'.
[01:35:18] Continue? (y/n) [y]: 
[01:35:24] Generating new aports for: rca-rct6873w42bmf9a...
[01:35:24] Device architecture (armhf/armv7/aarch64/x86_64/x86) [armhf]: armv7
[01:35:29] Who produced the device (e.g. LG)?
[01:35:29] Manufacturer: Alco
[01:39:04] What is the official name (e.g. Google Nexus 5)?
[01:39:04] Name: RCA Voyager Pro
[01:43:15] Does the device have a hardware keyboard? (y/n) [n]: y
[01:43:18] Does the device have a sdcard or other external storage medium? (y/n) [n]: y
[01:43:21] Which flash method does the device support?
[01:43:21] Flash method (fastboot/heimdall/0xffff/uuu/none) [fastboot]: 
[01:43:23] You can analyze a known working boot.img file to automatically fill out the flasher information for your deviceinfo file. Either specify the path to an image or press return to skip this step (you can do it later with 'pmbootstrap bootimg_analyze').
[01:43:23] Path: boot.img
[01:43:30] NOTE: You will be prompted for your sudo password, so we can set up a chroot to extract and analyze your boot.img file
[01:43:35] Update package index for x86_64 (4 file(s))
[01:43:41] *** pmaport generated: /home/stuart/.local/var/pmbootstrap/cache_git/pmaports/device/device-rca-rct6873w42bmf9a
[01:43:41] *** pmaport generated: /home/stuart/.local/var/pmbootstrap/cache_git/pmaports/device/linux-rca-rct6873w42bmf9a
[01:43:41] Username [stuart]: 
[01:43:43] Available user interfaces (12): 
[01:43:43] * none: No graphical environment
[01:43:43] * gnome: (Wayland) Gnome Shell (not for armhf)
[01:43:43] * hildon: (X11) Lightweight GTK+2 UI (optimized for single-touch touchscreens) (DISABLED FOR ARMHF, ARMV7!)
[01:43:43] * i3wm: (X11) Tiling WM (keyboard required)
[01:43:43] * kodi: (Wayland) 10-foot UI useful on TV's
[01:43:43] * mate: (X11) MATE Desktop Environment, fork of GNOME2 (stylus recommended)
[01:43:43] * phosh: (Wayland) Mobile UI developed for the Librem 5 (works only with numeric passwords!)
[01:43:43] * plasma-mobile: (Wayland) Mobile variant of KDE Plasma (slow without hardware acceleration, allows only numeric passwords!)
[01:43:43] * plasma-mobile-extras: Plasma Mobile with more apps pre-installed (video and music players, pdf reader, etc.)
[01:43:43] * shelli: Plain console with touchscreen gesture support
[01:43:43] * sway: (Wayland) Tiling WM, drop-in replacement for i3wm (DOES NOT RUN WITHOUT HW ACCELERATION!)
[01:43:43] * weston: (Wayland) Reference compositor (demo, not a phone interface)
[01:43:43] * xfce4: (X11) Lightweight GTK+2 desktop (stylus recommended)
[01:43:43] User interface [weston]: 
[01:44:32] Build options: Parallel jobs: 3, ccache per arch: 5G
[01:44:32] Change them? (y/n) [n]: 
[01:44:35] Additional packages that will be installed to rootfs. Specify them in a comma separated list (e.g.: vim,file) or "none"
[01:44:35] Extra packages [shelli]: ''
[01:44:42] ERROR: Input did not pass validation (regex: ^([-.+\w]+)(,[-.+\w]+)*$). Please try again.
[01:44:42] Extra packages [shelli]: -
[01:44:56] Your host timezone: America/Los_Angeles
[01:44:56] Use this timezone instead of GMT? (y/n) [y]: 
[01:44:59] Device hostname (short form, e.g. 'foo') [stubarks]: 
[01:45:01] Would you like to copy your SSH public keys to the device? (y/n) [y]: 
[01:45:03] WARNING: The chroots and git repositories in the work dir do not get updated automatically.
[01:45:03] Run 'pmbootstrap status' once a day before working with pmbootstrap to make sure that everything is up-to-date.
[01:45:03] Done!
```
