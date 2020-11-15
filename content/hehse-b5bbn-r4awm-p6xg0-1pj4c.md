# back on stushiba with the stubarks noise

after [getting file offsets from recovery](djaep-jyejg-4waps-7ygwf-4k4re) and giving up on [accomplishing anything on Windows](phmkn-2mesm-c5a7v-zp3p8-m98fv)

having [attained the raw data in 1GiB blocks](f0bth-zz6f7-rv9fd-wxs3h-17f67)

## Now it's time to merge the images

```
[stuart@stushiba dumps]$ fallocate -l 15518924800 ROM_DUMP.bin
[stuart@stushiba dumps]$ cat parts/* > ROM_DUMP.bin
```

(this took a while so I went to bed)

## identifying the filesystem

Once I've merged everything together and opened the whole thing up in a hex editor, the presence of `EFI PART` near the top of the ROM makes me think this looks like it's GPT-formatted

However, the MTK Droid Tool suggested MediaTek uses YAFFS2, so before I merged the files, I tried `yay -S unyaffs`

but yeah, once I had the completed file, unyaffs does nothing - but, lol, I can go ahead and open it with GParted, because yes, this is a GPT disk image

## anyway

I extract the boot image using the offsets I've found by multiple sources via `dd if=ROM_DUMP.bin bs=$((0x10000)) status=none skip=$((0x4d8)) count=$((0x100)) of=boot.img`

after all this, I hop [back over to Stuzzy](kb1k1-94ywc-45a59-b2a9d-82fgh)
