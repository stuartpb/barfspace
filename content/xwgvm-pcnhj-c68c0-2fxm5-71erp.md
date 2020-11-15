# 2017-05-03

some finagling over https://www.archlinux.org/news/ca-certificates-utils-20170307-1-upgrade-requires-manual-intervention/

pacman complained about gstreamer0.10-good-plugins conflicting with something, put a pin in that and ran the suggested commands

I tried the aforementioned procedure but apparently messed it up, solved by re-running `sudo pacman -Su ca-certificates-utils` after the full upgrade

reran `reflector --verbose -c US -f 200 --sort score -p https --save /etc/pacman.d/mirrorlist` because [the current configuration's primary mirror has some kind of certificate problem](https://www.archlinux.org/mirrors/localmsp.org/714/)

returning to the aforementioned issues with gstreamer, there were some weird issues around trying to remove it (possibly because I hadn't updated yet or something), anyway, after updating I ran `sudo pacman -Rs $(pacman -Qdtq)` to clear out the cruft of whatever'd been replaced in the past, this removed:

```
Packages (88) dleyna-connector-dbus-0.2.0-2  dleyna-core-0.5.0-1  faac-1.28-5
              gnome-mime-data-2.18.0-7  gstreamer0.10-bad-0.10.23-20
              gstreamer0.10-ugly-0.10.19-16  gupnp-av-0.12.10-1
              gupnp-dlna-0.10.5-2  js17-17.0.0-4  json-c-0.12.1-1
              l-smash-2.9.1-1  ladspa-1.13-6  libakonadi-qt4-1.13.0-12
              libcdaudio-0.99.12.p2-1  libdmtx-0.7.4-5  libidl2-0.8.14-4
              liblrdf-0.5.0-3  libmp4v2-2.0.0-4  libyaml-0.1.7-1
              musicbrainz-2.1.5-7  net6-1.3.14-5  orbit2-2.14.19-3
              perl-ipc-system-simple-1.25-1  perl-xml-parser-2.44-3
              python-appdirs-1.4.3-1  python-beaker-1.8.1-2
              python-mako-1.0.6-2  python-markupsafe-1.0-1
              python-packaging-16.8-2  python-pyparsing-2.2.0-1
              python-setuptools-1:35.0.2-1  python2-cssselect-1.0.1-1
              python2-lxml-3.7.3-1  python2-mpd-0.3.0-5  qjson-0.9.0-1
              raptor-2.0.15-6  soundtouch-1.9.2-1  spandsp-0.0.6-1
              wildmidi-0.4.0-1  xapian-core-1:1.4.2-1  cddb-py-1.4-7
              clutter-gst2-2.0.18-1  cython-0.25.2-2
              deepin-dbus-factory-3.1.4-1  deepin-file-manager-backend-0.1.16-4
              deepin-nautilus-properties-3.14.3-1  dleyna-renderer-0.5.0-1
              elfutils-0.168-1  faenza-icon-theme-1.3.1-4
              flattr-icon-theme-1.3-2  gnome-vfs-2.24.4-10
              gobject-introspection-1.52.1-1  gperf-3.1-1
              gstreamer0.10-bad-plugins-0.10.23-20
              gstreamer0.10-python-0.10.22-2
              gstreamer0.10-ugly-plugins-0.10.19-16  intltool-0.51.0-2
              kdepimlibs4-4.14.10-11  lcms-1.19-5  lib32-jansson-2.9-1
              lib32-js17-17.0.0-6  lib32-json-c-0.12.1-1  libbonobo-2.32.1-4
              libgtksourceviewmm2-2.10.3-2  libkactivities4-4.13.3-3
              libxml++-3.0.1+4+g2af973f-2  metacity-3.24.1-1  mutagen-1.37-1
              obby-0.4.8-3  perl-file-basedir-0.07-1  prison-5.33.0-1
              python2-atspi-2.24.0-1  python2-bottle-0.12.13-1
              python2-crypto-2.6.1-5  python2-deepin-vte-0.28.2.20130904-1
              python2-keybinder2-0.3.1-1  python2-pyasn1-0.2.3-1
              python2-pyquery-1.2.17-2  qca-qt4-2.1.3-3  qtwebkit-2.3.4-4
              ruby-2.4.1-3  sonata-1.6.2.1-13  strigi-0.7.8-9  vte-0.28.2-8
              webkitgtk-2.4.11-6  x264-2:148.20170121-1  xdotool-3.20160805.1-1
              zeitgeist-1.0+1+g1bcc8585-1
```

still some stuff I wasn't sure I wanted to ditch riding along here, so I looked into it and found that I'd missed [a brief window where xfce4-mixer had been replaced by xfce4-pulseaudio-plugin](https://bugs.archlinux.org/task/52686), so I installed that and uninstalled xfce4-mixer, and then `sudo pacman -Rsc gstreamer0.10` was basically fine
