# MicroSD + USB Microcontroller = Smart flash drives?

This is a thing I was thinking along with other thoughts for the DigiSpark / ESP8266:

What if you used this to add a microcontroller to a USB MicroSD card reader?

Like, if it's possible to put a MicroSD reader into the form factor of these very small readers, it should be possible to put everything that's in the DigiSpark

Also, we know it was possible to fit the circuitry of the FlashAir into a full SD package, so it's possible to get something decent with a NodeMCU-compatible chip

## Variants

This could be used to have the microSD card contain all the routines for the USB controller to run (like an extended flash chip for the Digispark)

But, like, ultimately, except for perhaps some sort of "put the controller into Flash Mode", you don't have to hook the ESP8266/whatever server side up to the USB at all

## Utility

Like the FlashAir, this can give simple Wi-Fi connectivity to devices that just have a USB Storage interface

They already have to be ready for some degree of "the storage being presented changed" because they're used to being used with iPods and stuff for at least a decade

Could also, if you get clever with it, be useful for an out-of-band backup mechanism (or even bootstrapping a cheap storage-swarm thingy)
