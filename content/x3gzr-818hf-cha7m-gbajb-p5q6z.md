# The January 2021 Instability on Stushiba

I installed more RAM to my desktop PC, and then it started getting flakey. I had to disable "CPU Fan Warning" in BIOS (which I guess hadn't been an issue before for some reason?), which led me to believe initially that this was some sort of overheating issue (especially considering the cramped space the box sits in, behind a footrest and under a table), but I started observing the problems happening even at low heat.

After installling `memtest86-efi` from AUR and doing a full memtest run to ensure the issue wasn't with the RAM I'd just installed, I looked around and found [other users describing the same sort of problems I'd been having][kqadu8]. I installed linux-lts, but then I decided that, much like the issues I'd had around booting into MemTest86, this seemed like an opportune moment to switch bootloaders over to the better-maintained (and better designed) [systemd-boot][].

[kqadu8]: https://www.reddit.com/r/archlinux/comments/kqadu8/arch_is_freezing_randomly/
[systemd-boot]: https://wiki.archlinux.org/index.php/systemd-boot

This was also assisted by my noticing I hadn't actually installed `amd-ucode`, which I'd thought I'd installed already - other troubleshooting lists had noted this being a symptom of outdated [microcode][].

[microcode]: https://wiki.archlinux.org/index.php/Microcode

```
[stuart@stushiba ~]$ sudo bootctl install
Created "/boot/EFI/systemd".
Created "/boot/loader".
Created "/boot/loader/entries".
Created "/boot/EFI/Linux".
Copied "/usr/lib/systemd/boot/efi/systemd-bootx64.efi" to "/boot/EFI/systemd/systemd-bootx64.efi".
Copied "/usr/lib/systemd/boot/efi/systemd-bootx64.efi" to "/boot/EFI/BOOT/BOOTX64.EFI".
Random seed file /boot/loader/random-seed successfully written (512 bytes).
Successfully initialized system token in EFI variable with 512 bytes.
Created EFI boot entry "Linux Boot Manager".
```

I also did a `yay -S systemd-boot-pacman-hook` so this'll happen whenever `systemd-boot` gets updated

I add this as `/boot/loader/entries/arch.conf`:

```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root="UUID=1904a37b-1fec-4bc1-8f14-f1c096d051db" rw
```

(the root UUID was found through `sudo blkid`)

Then this as `arch-lts.conf` for good measure:

```
title   Arch Linux (LTS kernel)
linux   /vmlinuz-linux-lts
initrd  /amd-ucode.img
initrd  /initramfs-linux-lts.img
options root="UUID=1904a37b-1fec-4bc1-8f14-f1c096d051db" rw
```

I edited the loader configuration in `/boot/loader/loader.conf` to uncomment the timeout:

```
timeout 3
#console-mode keep
```

I was going to add `default arch.conf`, but after consulting [the man page](https://man.archlinux.org/man/loader.conf.5), I realized I could set that from within the UI itself, and it would be stored as a UEFI variable that would override whatever was configured anyway, so I decided to just leave the definition there and reboot to set it.

Also did a `sudo memtest86-efi -r` and `sudo memtest86-efi -i` for good measure, to put the memtest entry under systemd-boot

Anyway, I've booted into the LTS kernel now, and apart from a freeze I still experience whenever finishing a stage in Path of Giants (regardless of kernel), this one seems much safer with my chosen kernel.
