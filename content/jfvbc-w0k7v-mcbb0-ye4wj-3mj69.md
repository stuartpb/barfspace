# Sturling 2020

The successor to the late [sturling](e2c8j-t79g3-8n97k-gt5vn-pfsww) (Arch Linux on a 32GB flash drive)

I think that makes this something like Mk 4, technically? Kind of depends which died-within-the-week iterations you count

## Plans

- Gonna provision it from Stushiba.
- Good old maximum-compatibility layout:
  - Hybrid MBR/GPT
  - Hybrid BIOS/EFI install
  - Keep a few install images in the EFI
- Gonna do as much as I can under LVM partitioning.
- Gonna have an encrypted /home.
  - Potentially shared between other distros (installable through the aforementioned LVM resizable-partition magic).
  - This even means I could potentially bootstrap an emergency 32-bit x86 OS install
    - probably booting from the live meda
  - This'll probably be on ext4
    - Kind of want to do as much else as possibly on btrfs, though
    - looking now, though, trusting btrfs is pretty much just a SUSE thing
    - TODO: build page on assessing btrfs
- Gonna use it to rescue Stuzzy.
- Gonna use it on my 2013 Chromebook Pixel.
- Gonna make a case for it in my watch (like a cufflink).

## Possible future extensions

- [Sturling Arges](9tvhs-2fhtq-cr86r-ryq7j-wr351)
