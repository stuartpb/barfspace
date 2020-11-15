# PICO-8 Extremely Extended Memory Addresses

- A lot of the cool thoughts around [Casettic](v54am-trnme-0yak2-dbnsk-dhvmz) and [Dataturf](g0q2b-3wp8z-c6avy-yy5jb-6fx07) overlap with stuff you see in the Pico-8
- What if this was added as an extended method: PICONET, an addressing scheme that's a hybrid of save data and the BBS
- "The Tape Casnette"
- Maybe it's presented as an elaborate addressing series of PICO-8 numbers (like Drive/Cylinder/Sector/Head), and has performance implications accordingly
- OMG, just call it "XAN": the Extended Address Network

This could eventually have visualization layers like what I described in [Very Wide Mountable Address Space Memory Inspector](d2xmj-z49kx-e580m-s0t4n-8phrb)

## realization

You could actually have an external daemon that watches for writes to the cartridge / save data, and uses another cartridge as a bus / fetch buffer for requests.

## more intersection

[Okay, But Seriously, Base32 Address Space](rmjve-fe322-4ybtc-rw68d-4w0w4)
