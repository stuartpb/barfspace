# 2018-09-05: cleaning up after stuquart

(continuing from the "Booting stutendo" of the 2018-09-05 stuquart changelog)

Had to go to Time/date settings and toggle off-on the "Automatically set time" option to undo Windows' asinine local-time default for the system clock (can't they have the system just check what time it *is* when first setting up, and then set whether the clock's UTC or local accordingly?)

## boot menu

Looking into the issue I'm having a little and jogging my memory, I go out and install EasyBCD (by going to https://neosmart.net/EasyBCD and scrolling down to where it says "Non-commercial", clicking "Register", then clicking "Download!" and running the installer), so I can use that to fix my Windows boot entries (unchecking the "Desktop Shortcut" option in the installer).

I go into the list, remove the Windows 10 entry that points to the installation of stuquart I did on this machine, and (just for kicks / in case I ever need to do this again) rename the entry for this installation "Windows 10 (Stutendo)".

I don't change the "Count down from 30" selection, since I'm expecting that to not matter when there's only one selection.

I hit the "Save Settings" button to commit (though it looks like that's probably only for changing Menu Options like the timeout).

I reboot to see if I actually need to mess with that countdown option. It looks like it's fine, so I reboot back into stushiba.


