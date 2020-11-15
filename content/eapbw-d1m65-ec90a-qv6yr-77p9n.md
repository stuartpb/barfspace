# Updating Stushiba

```
yay -Syu
:: Synchronizing package databases...
 core                                                                                            134.1 KiB  2.62 MiB/s 00:00 [############################################################################] 100%
 extra                                                                                          1677.4 KiB  1831 KiB/s 00:01 [############################################################################] 100%
 community                                                                                         5.0 MiB  2.70 MiB/s 00:02 [############################################################################] 100%
 multilib                                                                                        163.7 KiB  3.40 MiB/s 00:00 [############################################################################] 100%
:: Starting full system upgrade...
:: Replace deepin-qt5dxcb-plugin with community/deepin-qt5platform-plugins? [Y/n]
:: Replace intel-tbb with extra/tbb? [Y/n]
:: Replace libretro-redream with community/libretro-retrodream? [Y/n]
resolving dependencies...
looking for conflicting packages...
:: xorg-fonts-alias-100dpi and xorg-fonts-alias are in conflict. Remove xorg-fonts-alias? [y/N] y
error: failed to prepare transaction (could not satisfy dependencies)
:: installing perl (5.32.0-1) breaks dependency 'perl<5.31' required by glade-perl
Error installing repo packages
```

I don't want to get into all the orphans I could prune right now, but `pacman -Qdt` shows that `glade-perl` is one, so I go ahead

after removing, I rerun the `yay -Syu`

I got prompted to import one guy's key about 30 times: https://bbs.archlinux.org/viewtopic.php?id=255968

having held enter down to get through that, it started upgrading all my AUR packages, which takes several hours (MeshLab has like a thousand objects to compile, and I still havenn't gotten rid of that lib32 video bullshit).

okay, it eventually ended (skidding to a halt like it's DBZ with about a dozen lines of prompt as the queued newlines flushed) - gonna commit all these notes, then restart
