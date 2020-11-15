# 2017-05-07

I got kind of fed up with emoji and CJK characters not displaying, so I did a `sudo pacman -S --needed noto-fonts noto-fonts-emoji noto-fonts-cjk` (turns out they were *all* yet-to-be-installed so the `needed` was superfluous), and then the system hung for *minutes* (I went downstairs and did laundry, so I don't know how many minutes, but it was probably somewhere between 5 and 15) - popping over to tty3 or whatever (ctrl-alt-f3) and running `top` showed that it was children of `gnome-session-b` (like `gsd-xrandr`, `gsd-color` etc) getting pegged, one after the other (probably propagating the font updates).

Anyway I think I'll do a `ssh-keygen -t rsa -b 4096` now
