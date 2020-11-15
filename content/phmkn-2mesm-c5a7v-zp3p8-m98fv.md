# Logging back into stuquart

Running Windows Update

installed Firefox, set as default browser, turned off multiple tab closing warning

downloaded MTK Droid Tool

Installed a bunch of updates and sought out the MTK driver bundle

Even when running the tool as administrator, I can't get it to work

After installing PDANet and other drivers (CDC), still no change - also downloaded Carliv Image Kitchen which does nothing

Looking into it a little more, and [there's a glaring compatibility issue](https://forum.xda-developers.com/showthread.php?p=70240791#post70240791)

this is backed up by [the original release's OP](https://forum.xda-developers.com/showthread.php?t=2160490), which repeatedly notes it's not compatible after Android 5

someone later in the thread posts a solution: https://forum.xda-developers.com/android/general/fix-impossible-to-start-adb-error-t3582571

That gets me far enough to establish a connection and have it print a hardware string (MT8167B), but nothing else

it's starting to look like this app is going to be just too old, and I'm better off just analyzing the flash dump I got from the SP Flash Tool (unpack YAFFS2 was one of the options in the MTKDT?)

## moving on

[rebooting into recovery](djaep-jyejg-4waps-7ygwf-4k4re)
