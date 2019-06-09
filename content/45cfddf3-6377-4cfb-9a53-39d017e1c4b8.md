# 2017-05-07: Raspberry Pi (NOOBS)

Threw latest NOOBS onto a new 16GB MicroSD (Class U3) yesterday.

Used NOOBS to just install Raspbian with PIXEL, at least to start (I'm guessing there'll be room to experiment with more later).

Enabled ssh (via `sudo systemctl enable ssh`, which the GUI picked up on) because my headful setup is a pain.

Didn't change the locale before installing, so after installing, I had to change the locale and everything (time zone etc) to US West Coast stuff.

After changing that stuff, it said it had to restart, so I did - after restarting, it pointed out that enabling SSH without changing the password is a security hole, so I changed the pi user password.

Somewhere around here I might have fidgeted with some of the other options like splash screen

Also enabled VNC because hey GUI access via headless might not be bad (though I did see someone saying the default resolution is miserable).

Might have enabled some other access methods, can't recall off the top of my head

Found a recommendation to update via `sudo apt update` and `sudo apt full-upgrade` so I did that

Noticed the preinstalled Node is an ancient 0.10.x, so per https://nodered.org/docs/hardware/raspberrypi I'm running `update-nodejs-and-nodered` - looks like this might take a while

Okay, it took about 5 and a half minutes, not too bad

Now I'm setting up a keypair for the device with `ssh-keygen -t rsa -b 4096` and adding stushiba's new keypair to `~/.ssh/authorized_keys`
