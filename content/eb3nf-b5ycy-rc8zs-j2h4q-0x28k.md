# Browsing for ideas for cluster storage array construction

All these Raspberry Pi chips for SATA are all just USP peripherals with a duPont connection augmenting the power drive

- https://www.conrad.com/p/renkforce-usbsata-converter-usbsata-converter-shield-compatible-with-raspberry-pi-1333031
- https://www.amazon.com/Geekworm-Raspberry-Storage-Expansion-Compatible/dp/B07VXF2HJG
- http://linuxgizmos.com/sata-hats-support-up-to-four-drives-on-raspberry-pi-4-or-rock-pi-4/

## MicroSD RAID cards

From what I can tell, these all do hardware-level RAID0, so it's only workable if you want one massive MicroSD card, basically

- 10 microsd:
  - https://www.amazon.com/1Pack-Micro-Memory-Adapter-Converter/dp/B01MU59ACL/ref=as_li_ss_tl?ie=UTF8&qid=1509538124&sr=8-2&keywords=10+x+micro+SD+to+SATA+SSD+Adapter+&+RAID+Quad+2.5%22+SATA+Converter=&dpID=51aZ7RZ500L&preST=_SY300_QL70_&dpSrc=srch&linkCode=sl1&linkId=a96d41c20aa1a8d9e7687458bb289e38#customerReviews
  - https://usb.brando.com/10-x-micro-sd-to-sata-ssd-adapter-raid-quad-2-5-sata-converter_p13939c0046d015.html
  - https://www.youtube.com/watch?v=3frnBoqqI_Q
  - https://www.newegg.com/p/1B0-007S-000N0
- 2 full sd:
  - https://www.youtube.com/watch?v=ASoCcntxTHg
- 4 full sd:
  - https://www.amazon.com/4-Port-SATA-Adapter-Inch-Housing/dp/B00B4KO0A6
- 4 micro sd:
  - https://www.microsatacables.com/4-micro-sd-to-micro-sata-adapter-raid-tf-card-to-1.8-inch-micro-sata-converter-sd-4xmicro-1.8-ms
  - https://www.walmart.com/ip/4-Micro-SD-to-Micro-SATA-Adapter-RAID-TF-Card-to-1-8-Inch-Micro-SATA-Converter/182378706
  - https://www.newegg.com/p/0DS-00FD-00061
  - https://www.amazon.com/Micro-SATA-Adapter-RAID-Converter/dp/B00C5MUILM/ref=pd_sbs_147_21?refRID=6ASX1G7AM8QK82Y0EEMM
- lots more:
  - https://www.aliexpress.com/popular/micro-sd-sata-adapter.html

anyway, if I really wanted this I'd attach it to a USB-to-SATA cable

## best option

What I think looks nicest, and is probably easy enough to clone, is this suite from Lexar:

- [4-station USB 3 Hub ($35)](https://www.amazon.com/Lexar-Professional-Workflow-Four-Bay-LRWHR1RBNA/dp/B00EJ8CKRU/)
- [3-slot MicroSD reader](https://www.amazon.com/Lexar-Professional-Three-slot-microSDHC-microSDXC/dp/B012PQM9HI/)

So you'd keep buying MicroSD cards and 3-slot readers and putting them into a tower like this

## baseline cost-wise

let us observe that a micro-sd usb 3 card reader costs [$8 each](https://www.amazon.com/dp/B07ZSFS7WR/)

so if I buy 3 of those, I've spent $24.

Now, I still need the added ports - but if I buy a 7-port hub, I can trick it out with 7 of these, and I don't even need to bring in a whole power-tower scaffolding for it, I can stick with the OGEL architectures

- could also exploit the ability of a reader like [this](https://www.amazon.com/Reader-Zedela-T-Flash-Adapter-Windows/dp/B07QQC491J/ref=psdc_516872_t4_B012PQM9HI) to read 4 MicroSDs (2 or 3 in adapters) for $18
  - that page also has a good graphic on transfer rates
  - https://www.amazon.com/Funturbo-MagicGate-Playstation-Portable-Handycam/dp/B07F68FCHD looks like MemoryStick adaptation is easy enough
