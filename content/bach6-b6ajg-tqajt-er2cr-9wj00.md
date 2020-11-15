# A Model for Kateskit Boxes

this is about partitioning and shipping

also, my new current working name for this is "HiveBug"

uh, let's just go ahead and ignore that that's a furry/tentacle porn Twitter handle (really should have checked that before I bought the domain...)

## hardware outlay

each HiveBug has an onboard disk and the onboard SSD / MicroSD

each HiveBug also comes with installation / recovery media, as a microsd card in a USB reader

the purpose of this is to serve as an alternative boot source if the system gets messed up by an automatic update

## how they're formatted

The onboard SSD is formatted the way k3os does it: one installation, and the updater handles overwriting.

(I'm actually getting less and less sure about that)

the hard disk is one big bulk partition

## install disk / recover media

The install media, however, is different: it reserves the first part of the partition not needed for 2x the install media

This boot section includes all the UEFI stuff to boot, as well as the top-level configuration (which inlcudes the pre-flashed cluster)

## more hardware / functionality for SKUs

- [router functionality](pr1f6-5k6qs-0hacc-1ymrg-0nf8n)
- [display/blinkenlights](ech2q-n3zmw-ppar5-g5q1k-8p8cy)
- [A neat idea for a USB hub](0kfpj-gn9ba-6nbas-a5nzy-76d60)
- [Server-As-Pet-Model-To-Be-Named Case Design](jq5sk-h74wg-81a8s-1jp07-csa6t)
- [The Core of Cuteness to the CubiePet Brand](1pd39-g44hk-02asz-hpzm0-v6p8m)
