# retiring stukilla

Seeing as how the wifi still won't work, a bunch of other stuff never worked (like the video driver), and I have [stuzzy](gsmaa-6w3x5-mw9af-frvsb-j074b) for my Arch-on-Chromebook needs now (which works with Arch Linux proper rather than the ARM fork), I've decided to repurpose this machine for [a new project](9pyqn-vvww5-y7ang-27sw1-9nmwd).

I put the SD card I'm planning to wipe and replace with the install-media image into the machine, then ran `cp ~ /run/media/stuart/that-card/stukilla-home` to make sure I won't lose anything important. This had a bunch of failed link creation errors, which I copy-pasted from the terminal into a `cp-errors.txt` file.

After doing this (and copying the directory to my archive drive), I realized that I should probably also save `/etc`, so I went back and did a `sudo tar cf /run/media/stuart/that-card/stukilla-etc.tar /etc`, plus `sudo tar cfv /run/media/stuart/that-card/stukilla-home.tar ~` for good measure (so I could go ahead and take stuff from the copied live directory without worrying about damaging the preserved archive).

## destroying everything without even trying

USB boot was disabled, so, like an ass, I hit spacebar to re-enable signing, and now I'm reflashing recovery media

Having reset the machine to its original state, let's take this again, [from the top](mbcn7-xn7es-mca2t-6e4qf-h28a2)
