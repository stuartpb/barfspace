# configuring the swap disk

I had a whole thing about how I was adding my SSD swap to Stushiba? I guess that note's been lost?

Anyway, I aded an SSD to Stushiba, formatted it as swap because systemd-swap is bad, and then uninstalled systemd-swap, so now I have to manually set the partition up to be used at startup (since by default systemd only auto-mounts swap in fstab or the same GPT disk as the root system).

My original plan was to add a `.swap` unit for the disk and not touch fstab, but after seeing that I'd have to call the file `dev-disk-by\x2duuid-fdbd512b\x2d5164\x2d45dd\x2daa10\x2da569a9abf642`, I decided, you know what, actually I think I'll just add a line to fstab

per https://wiki.archlinux.org/index.php/swap

```
UUID=fdbd512b-5164-45dd-aa10-a569a9abf642 none swap defaults 0 0
```

The wiki says to enable `discard`, but I'm not sure that's right looking at [the linked man page](https://jlk.fjfi.cvut.cz/arch/manpages/man/swapon.8) (emphasis mine):

> -d, --discard[=policy] Enable swap discards, if the swap backing device supports the discard or trim operation. This may improve performance on some Solid State Devices, but often it does not. The option allows one to select between two available swap discard policies: --discard=once to perform a single-time discard operation for the whole swap area at swapon; or --discard=pages to asynchronously discard freed swap pages before they are available for reuse. If no policy is selected, the **default behavior is to enable both discard types**. The /etc/fstab mount options discard, discard=once, or discard=pages may also be used to enable discard flags.
