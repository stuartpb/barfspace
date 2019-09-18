# How GNOME Wallpaper Definitions Work

There are a few pages that describe what a GNOME slideshow definition looks like:

- https://help.ubuntu.com/community/SlideshowWallpapers
- https://opensource.com/article/17/12/create-your-own-wallpaper-slideshow-gnome kinda covers it?
- https://www.linuxjournal.com/content/create-custom-transitioning-background-your-gnome-228-desktop also

but, like, I can't find any *documentation* for this xml format

I can find a few sources:

- https://gitlab.gnome.org/GNOME/gnome-backgrounds/blob/master/backgrounds/adwaita-timed.xml.in
- https://gitlab.gnome.org/GNOME/gnome-desktop/blob/master/libgnome-desktop/gnome-bg-slide-show.c
- https://gitlab.gnome.org/GNOME/gnome-shell/blob/master/js/ui/background.js

but, like, looking at gnome-bg-slide-show.c, it looks like `type="overlay"` is never parsed?
