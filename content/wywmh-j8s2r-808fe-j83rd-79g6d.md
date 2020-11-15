## tweaking systemd-swap

setting `zswap_zpool=z3fold` instead of the default `zbud` as [the wiki recommends it](https://wiki.archlinux.org/index.php/Zswap#Compressed_memory_pool_allocator)

https://bbs.archlinux.org/viewtopic.php?pid=1854212#p1854212

setting `zswap_compressor=zstd` as `cat /proc/crypto` does list it, so I'm guessing it's fine

https://askubuntu.com/questions/471912/zram-vs-zswap-vs-zcache-ultimate-guide-when-to-use-which-one

## a thought occurs

could part of the reason for all the freezin' be that `zswap_max_pool_percent=25` is more than `swapfc_free_swap_perc=30`, which means it's trying to compress (and getting stuck in a loop) [every time it gets closer to the compression threshold](https://wiki.archlinux.org/index.php/Zswap#Maximum_pool_size), when it really needs to start allocating space (as the resources to decompress back to swap will tax the already-diminishing memory pool)?

trying `swapfc_free_swap_perc=30` to see if that fixes it. heck, `sudo systemctl restart systemd-swap.service`

this does mean scale-down is going to be a beast - [letting that be configurable](https://github.com/Nefelim4ag/systemd-swap/issues/81) would be nice

## also

hey, could PSI be integrated into systemd-swap?
