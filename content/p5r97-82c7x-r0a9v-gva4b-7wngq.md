# Getting Serious about Graphics on Stushiba

Installed `lib32-vulkan-icd-loader` and `lib32-vulkan-radeon` (per [wiki][] and forum) on 2019-08-08, looks like I already had the other stuff

[wiki]: https://wiki.archlinux.org/index.php/Vulkan

Dota Underlords still won't start, though. Bummer.

Looking at https://steamcommunity.com/app/383980/discussions/2/1735465524714627411/ suggests this is also the source for some Proton bugs

I'm doing a `-Syu` now (2019-08-12) and rebooting, seeing if that fixes it

It didn't.

## Let's get fancy

Following [this forum thread](https://bbs.archlinux.org/viewtopic.php?id=239916), I'm going ahead and doing what it takes to move to the AMDGPU driver.

Confirming that I have a "Sea Islands" card via [this table](https://www.x.org/wiki/RadeonFeature/#index5h2) and `lspci`:

```
[stuart@stushiba ~]$ lspci | grep -e VGA -e 3D
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Hawaii PRO [Radeon R9 290/390] (rev 80)
```

Added `MODULES=(amdgpu radeon)` to `/etc/mkinitcpio.conf`

Putting this in `/etc/modprobe.d/amdgpu.conf`:

```
options amdgpu si_support=0
options amdgpu cik_support=1
```

And this in `/etc/modprobe.d/radeon.conf`:

```
options radeon si_support=0
options radeon cik_support=0
```

And running `sudo mkinitcpio -p linux` to regenerate the ramdisk.

Crossing my finders and rebooting now.

## Hell yes

- Dota Underlords starts
- other Proton games work
- PAC-MAN 256 doesn't cause a kernel panic
- the flickering I was seeing in Firefox is fixed (or at least happens less often?)
  - Might want to try the next-levelrendering thing