# stuzzy remote difficulties

this was when running `yay -Syu` during [initial Voyager work on Stuzzy](0qx01-0psny-939g9-50kz9-qdj84)

## after starting

rerunning `sudo reflector --verbose -c US -f 200 --sort score -p https --save /etc/pacman.d/mirrorlist` because I'm getting weird slowdowns downloading packages... it's still going slow!

Running `sudo reflector --verbose -c US -f 200 --sort score -p https --save /etc/pacman.d/mirrorlist` - maybe I just need to set it to use a faster remote?

oof, it's up and down - going from 3MiB/s to 50KiB/s.

okay, you know what, screw it, I'll just log out and back in and mess with this later
