# getting the boot.img for Stubarks to root the device to etc.

There are several ways to do this I'm looking into:

## ways involving combing through junk data

googling "RCT6873W42BMF9A firmware" turns up a lot of trash in the top results

Found a page that has what appears to be a flash dump of the initial ROM, which might give us access to the boot image?

https://forum.hovatek.com/thread-26146.html

Found by searching `rom "0-376" "unticked"` from [this page](https://androidfilehost.com/?w=files&flid=288657), found from something like "rca rct6873w42 mtk firmware download"

[this page](https://rootmydevice.com/download-rca-stock-rom-firmware/) has a few firmwares that look kind of like this model. Probably Intel chipsets, but what the heck, I'm downloading the one for RCT6873W42MKC and RCT6873W42M F7 in the hopes that maybe one of those is close enough

looks like that's just piggybacking https://stockromfiles.com/download-rca-stock-rom/ - oh, reading the bottom, I guess they have a symbiotic relationship or similar? anyway

they said these were provided by RCA Mobile? https://rcamobilephone.com/pages/downloads-center only has a few manuals - maybe they asked nicely?

(incidentally, it's worth noting [PostmarketOS's steps for acquiring kernel source](https://wiki.postmarketos.org/wiki/Troubleshooting#My_device_runs_the_Linux_kernel_.28e.g._Android.29.2C_but_the_vendor_does_not_provide_the_source))

Anyway, I left a comment asking for it, old-school

https://androidmtk.com/download-rca-stock-rom-for-all-models seems to also have these files

## ways that require Windows

https://www.xsfirmware.com/how-to-backup-mtk-android-firmware/

https://ifindhub.com/backup-dump-mtk-android-firmware-spflash.html

https://drfone.wondershare.com/root/safely-root-android.html probably wouldn't work, but it's neat that there's such a slick UI for this

## bingo

https://spflashtools.com/category/linux

## ways that require special hardware

also probably Windows

NOTE: I'm not sure that all of these would necessarily do the job

- https://www.amazon.com/EFT-Dongle-5823784534/dp/B07284PHQZ
- https://www.amazon.com/Infinity-Box-Dongle-service-decode-firmware/dp/B00WXLIUTM
- https://www.amazon.com/multifunctional-solution-flashing-unlocking-Samsung/dp/B00T9TNXK2
- https://www.amazon.com/NCK-Box-Pro-multifunctional-servicing/dp/B01N4KWANS
- https://www.amazon.com/NCK-Dongle-unlimited-unlocking-calculation/dp/B00HN7TJ2S

## ways that rather involved being on the other side of this airtight hatchway

https://forum.hovatek.com/thread-1405.html

## ways for the other chipset

- https://androidfilehost.com/?w=files&flid=152555
- https://androidfilehost.com/?w=files&flid=285501 I think

## other things that might be useful after ganking the image

[Mediatek (MTK) Auto TWRP recovery porter by Team Hovatek](https://forum.hovatek.com/thread-21839.html)
