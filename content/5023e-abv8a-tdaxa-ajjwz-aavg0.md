# Fixing Two Major Google Fonts Repo Issues

See [this comment about Rubik](https://aur.archlinux.org/packages/ttf-google-fonts-git/#comment-693383), which has been a problem in Firefox, and [this comment about emoji](https://aur.archlinux.org/packages/ttf-google-fonts-git/#comment-703121), which had been mentioned elsewhere in these notes.

Ran `yay -S --editmenu`, specified `code --wait` as my editor, and inserted this above pkgver:

```bash
prepare() {
        cd fonts
        git revert -n dfd435109b718b1c5a8da7bd0872c751e2ae1820
        rm --recursive "./ofl/adobeblank"
}
```

It looks like Adobe Blank is still here, so I'm doing `yay pacutils` and `sudo pacreport --unowned-files` to see if maybe it wasn't removed properly?

Okay, so looking into the cache a bit more, the "fonts" dir appears to be the *bare repo* in the `prepare()` phase, so... I'm just going to go ahead and add `adobe-blank` to the [`omitted_font_families` array](https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-google-fonts-git#n95), as that seems like the path of least resistance, and rerun this package (after modifying the PKGBUILD accordingly) via `cd .cache/yay/ttf-google-fonts-git/; makepkg -si`

I think that worked - adobe-blank is gone, and, after restarting Firefox, Rubik displays correctly.
