# stuzzy changes 2019-08-17

Ran `yay -Syu`

was having trouble with mirror issues so I uncommented the line in /etc/pacman.d/mirrorlist for kernel.org

elected to upgrade google-chrome (even though I don't use it any more) and yay itself

skipped updating nvm (not sure why I even have it installed) and signal (because fuck Signal)

thinking about installing [Reflector][] to avoid this kind of issue in the future

[Reflector]: https://wiki.archlinux.org/index.php/Reflector

in fact, on review, the only reason I have nvm was to install signal, so I'm gonna go ahead and remove both of them (`yay -R nvm signal`, done)

installed `reflector` and, just for kicks, `rsync`

updated the mirror list with:

```
sudo reflector --verbose -c US --score 200 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

thinking it might make sense to add this as a pacman hook whenever I `-Syu`
