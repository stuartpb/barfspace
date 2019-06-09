# 2018-02-20

Taking care of the Plushu sandbox migration described in https://github.com/plushu/sandbox.plushu.org/issues/2 - I'm using the MSYS2 SSH for this, and since I had to rebuild the server, I've changed the identity, and *that* means editing `~/.ssh/known_hosts`, and *that* means opening up an editor (I don't feel like puzzling out the appropriate in-place `sed` command), and apparently I don't have `nano` or `vi`, so I'm running `pacman -Syu` right now so I can install one or both of those (powering through `catgets` per the recommendation of https://github.com/StephanTLavavej/mingw-distro/blob/e4603e26554200e280376bf9f3b901276915953a/README.md).

update:

```
(14/73) upgrading vim                              [#####################] 100%
```

so what, y'all didn't set up a `vi` alias here? uuuugh
