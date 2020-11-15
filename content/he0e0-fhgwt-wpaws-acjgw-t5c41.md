# updating stushiba again

doing `yay all-repository-fonts` to adjust to a change in the upstream repos

now doing `pacman -Syu`

got a warning about old perl libs so I checked on them like it said:

```
[stuart@stushiba ~]$ pacman -Qqo '/usr/lib/perl5/5.28'
glade-perl
perl-alien-wxwidgets
perl-extutils-typemaps-default
perl-extutils-xspp
perl-module-build-withxspp
perl-opengl
perl-wx
perl-wx-glcanvas
```

went ahead and took a look at my orphaned repos:

```
[stuart@stushiba ~]$ pacman -Qtdq
acpid
artwiz-fonts
boost
brltty
caribou
ccache
chrpath
cmake
cpio
cython2
dcadec
dkms
enca
fcgi
fonts-tlwg
gamin
ghostpcl
ghostxps
gmime
gnome-icon-theme
go
gtest
gtkglext
jbigkit
js52
kdelibs4support
leatherman
lib32-gconf
libdbusmenu-qt4
liblightdm-qt4
libnm-gtk
libplacebo
libuser
libvirt-python2
mediainfo
meson
netcdf
newt-syrup
octave
openslp
oxygen-icons
perl-alien-wxwidgets
perl-class-accessor
perl-devel-checklib
perl-extutils-typemaps-default
perl-io-stringy
perl-local-lib
perl-module-build-withxspp
perl-moo
perl-opengl
perl-test-base
perl-test-differences
perl-wx-glcanvas
polkit-qt4
profont
python-jieba
python-sip
python2-ftputil
python2-ipaddr
python2-ipy
python2-magic
python2-opengl
python2-peewee
python2-pillow
python2-pycurl
python2-pygame
python2-pysrt
python2-sip
python2-wnck
python2-xlib
python2-xpybutil
python2-yaml
qtav
rarian
rustup
schroedinger
sip
source-highlight
swig
ttf-cheapskate
ttf-freebanglafont
ttf-mph-2b-damase
ttf-ubraille
vala
xclip
xine-lib
xorg-server-xvfb
yasm
```

I saw that there were some non-orphaned packages in the first list, and I could have filtered those out using a command first, but since I had a bunch more orphans (like `dkms` from misguidedly installing the DKMS version of VirtualBox's kernel module), I decided to just go ahead and do a purge

incidentally, the fact that there doesn't appear to be a way to preview the `-s` recursion of this operation by query, or at least not without resorting to [external scripts][deps] that still (probably) don't have the same "if not needed elsewhere" conditional filter logic

and the lack of symmetry in remembering these commands is one of the reasons why there should be a wrapper script with smarter verbs

it can have a verb for `delete` that works like flat `-R`, `uninstall` can imply `-Rs`, `forget` can purge pacsaves (and be included with uninstall as `--forget`)

[deps]: https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Getting_the_dependencies_list_of_several_packages

## anyway, the purge

`sudo pacman -Rs $(pacman -Qtdq)`

as I suspected from looking at the lists, the only remaining obsolete perl library now is the one for my label printer, so I'll go ahead and reinstall:

`yay -S glade-perl`
