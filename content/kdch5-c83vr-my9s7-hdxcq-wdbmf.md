# updated 2016-12-11

booted back into Linux because Steam on Windows is being horrible (1-byte-per-second disk write times) and Windows Update is hung and I think I just need to let that disk cool off a bit and I should check out what's new Linux-side.

I haven't touched this since probably September (going by my Tabalanches), so I ran a BIG HONKING STINKING HUGE 500+ PACKAGE `packer -Syu`, it required some geoclue magic and the ttf-dejavu force that's listed on the Arch frontpage right now.

got everything updated and installed some stuff (that new package that makes steam native runtime work correctly, *finally* installed `bash-completion`), rebooted.

wifi adapter kernel module is somehow broken again roflofloflasdgf;;;;;, went over and grabbed my ethernet cable and plugged in

searching for what's up (googling "rtl8812 arch")... not really sure but I think I might pivot on over to https://aur.archlinux.org/packages/rtl8812au_rtl8821au-dkms-git/ which looks a lot more actively maintained

No amount of `packer -S rtl8812au-dkms-git` has resurrected the old driver so I'm moving on over to gnab's

when I update/remove it it keeps saying there are no instances of it in the dkms tree which is weird:

```
:: Running pre-transaction hooks...
(1/1) Remove DKMS modules
==> dkms remove rtl8812au/r62.be75251 -k 4.8.13-1-ARCH
:: Processing package changes...
Error! There are no instances of module: rtl8812au
r62.be75251 located in the DKMS tree.
error: command failed to execute correctly
(1/1) removing rtl8812au-dkms-git                  [######################] 100%
```

probably because it removes it first, idk

moving to rtl8812au_rtl8821au-dkms-git fixed it so whatever
