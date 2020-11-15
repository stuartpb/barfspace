# Dumping the RCA Voyager Pro through Stushiba

After [getting to know SP Flash Tool on Stuzzy](ptd3n-nsprs-cca76-n41kv-hv298), I started sshd on stuzzy (sudo systemctl start sshd`) and copied all the work I'd done over to Stushiba by logging in via ssh (I used password auth because I haven't set up keys, though I really should)

## once I got it working

After a few tests pulling 256M sections, then pulling a whole gig and doing something like `cat ROM_*.bin | cmp -l ROM_0-big.bin` with the merged version, I determined I could get the on-board ROM as easily as running SP Flash Tool's Readback function 15 times, advancing the address by 1 GiB (0x40000000) each time

the size was 0x40000000 each time except the last, from address 0x380000000, when it had to be reduced to 0x1d000000 (the device's total "UA", which I think is "usable area", being 0x39d000000, per the EMMC info on the sidebar on the left)

as I was trying to get the device layout, I tried [mucking around with Windows-only tools](phmkn-2mesm-c5a7v-zp3p8-m98fv) that I'd found posts about using, but after I ended up finding [a description of the scatter file layout in the onboard recovery log](djaep-jyejg-4waps-7ygwf-4k4re) I abandoned that altogether

the real action continues in [manipulating the dumps on stushiba](hehse-b5bbn-r4awm-p6xg0-1pj4c)
