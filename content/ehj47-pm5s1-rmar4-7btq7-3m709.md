# An embarassingly obvious issue

Was having problems with my PocketC.H.I.P:

- Ctrl+tab wasn't working (but Alt+tab was)
- Touching icons in pocket-home wouldn't reopen apps that were already open
- Couldn't press the Home button to switch out of PICO-8

It felt like Awesome wasn't running, but I couldn't figure out why

Realized what was wrong by doing `ps -ejH` and noticing pocket-wm was in the tree instead

And then it hit me: "oh, duh, I logged in as chip with Pocket WM as the session, lightdm must have changed the default session it uses when chip logs in"

fixed by doing `pkill -TERM -u chip` then logging back in to awesome as chip
