# Fixing tearing in Firefox on stushiba

https://wiki.archlinux.org/index.php/Firefox#Tearing_video_in_fullscreen_mode

https://wiki.archlinux.org/index.php/Firefox/Tweaks#Enable_OpenGL_Off-Main-Thread_Compositing_(OMTC)

about:support shows all the issues this describes, so I'm taking its advice and going to about:config and setting `layers.acceleration.force-enabled` to `true`

## Why do I have to do this?

Some Googling turns up these Reddit threads:

- https://www.reddit.com/r/firefox/comments/9c2t6b/hardware_accelerationomtp_situation_on_x11linux/
- https://www.reddit.com/r/firefox/comments/9dkj17/why_is_acceleration_blocked_by_platform/
- https://www.reddit.com/r/archlinux/comments/8w8jxi/video_tearing_in_firefox_only/

which point to these Bugzilla comments:

- https://bugzilla.mozilla.org/show_bug.cgi?id=594876#c95
- https://bugzilla.mozilla.org/show_bug.cgi?id=594876#c117

TL;DR: there were historical issues with OpenGL acceleration on Linux, and rather than trust that they're fixed by now and risk things breaking again, they just want to hold off and punt the whole thing until WebRenderer replaces the whole OpenGL pipeline altogether and makes "layer" stuff obsolete.

UPDATE: Actually, I just looked at some of those "depends on" issues, and a fair number of them are actually pretty recent, so maybe I'll have to go ahead and jump to WebRenderer early? I'll see if any of those problems materialize, but for now it seems like this is a safer bet

See also:

- https://wiki.mozilla.org/Blocklisting/Blocked_Graphics_Drivers#On_X11 (see how old this complaint is - it's complaining about fglrx and 2.6 kernels)

## Stuff that's happened since I enabled this

Some stuff occasionally flickers, like image carousels on Twitter when transitioning images

## tracking the stuff that fixes this

- https://wiki.mozilla.org/Platform/GFX/OffMainThreadCompositing
- https://wiki.mozilla.org/Platform/GFX/Quantum_Render

## continuing

[this page](61ahg-ahkzg-asarf-j58mn-rcp8j) has the next steps I took after installing the AMDGPU driver

## legacy note

this probably doesn't matter - just something I found in an earlier search before thinking to try "firefox tearing arch linux" as a search query (bringing me to the wiki page that put me on track)

- https://bugzilla.mozilla.org/show_bug.cgi?id=1315230 covers some vsync issues
