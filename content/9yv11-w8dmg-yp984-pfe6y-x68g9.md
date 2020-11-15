# stushiba plans

## 2019-10-15: code-oss is missing from the Applications list

see [the day log](8x3nv-vvtsm-j5avx-vzfg1-ahf06)

GNOME's Application list has some real bugs, too. Look around late-December-early-January Tabalanches for ways to fix the "default application switches every time I do an Open With" bug.

## possible future changes

- [installing scilab](wwtts-tz2yq-g093f-204k0-qtcv5) for a gig

## Miscellaneous thoughts

- Add microcode updates for AMD
- How hard can I make rEFInd be the default boot option? Can I clobber the default location without breaking Windows boot?
  - Not sure how old this note is, because rEFInd has been working at boot for a while now
- the GNOME Screen Keyboard is *hella broken* (should check how it looks on stuzzy)
- What's with the Deepin greeter? Didn't I set my default greeter to be GTK? Do I need to uninstall Deepin?
  - I think I installed Deepin a while back (it's 2019-06-08 now)? Don't think I have a deepin greeter problem any more

## Fixing Avahi

Oh hey, wasn't there something about enabling the `mdns` resolver causing these massive hitches you've been seeing in Chrome? And why haven't you been able to resolve any .local addresses, anyway?

*This is a legacy quest: the reason for Chrome's problem is listed on stushiba's main page or something like that. It's something to do with fonts. Anyway, the non-resolution of .local is still a thing to look into.*

## Default audio device

I constantly have to screw with the audio device.

https://askubuntu.com/questions/1038490/how-do-you-set-a-default-audio-output-device-in-ubuntu-18-04/1038492 lists how to set it so at least Line Out will be the default instead of my Vive
