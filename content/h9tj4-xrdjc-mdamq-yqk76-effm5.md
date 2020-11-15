# Hosting a Private Git Server With Cloud-Like Usability

For work [beyond the Shadow Curtain](wm7ba-3ycgc-wn8h2-pjnsv-xny45), in conjunction with [The Notestack Core of Engineers](63p2w-vj7t2-baaa8-r76as-nntma).

I'm thinking they'll just have some kind of auto-syncing home server dedicated to being the authoritative copy, and it'll live at my apartment with my bins, and my other machines can push to it

Would it make sense then to have a Raspberry Pi or something hosting

[Thoughts on storing this private content on an on-person IoT Git server](hvjcw-eyqqh-rhafq-wh7a2-7qwph), primarily one on a cheaper chip like an Espressif or a FlashAir

Having it all live on a Raspberry Pi would be a neat way to start with Wayside: have it be tunnelable with SSH (which'll work on all my devices thanks to ChromeOS's Secure Shell App, let alone penguin), and keep a working tree living on it - and in the meantime, while I figure out something cool and Kubernetes-y, I can just use it as a Git server and a static file server for browsing, and I just have to edit the pages by opening an IDE session locally and using the shotclock to sync

This might be a neat way to try out Nix on ARM, use a Raspberry Pi Zero W (and I'd have the setup's config live in its own Git repo that'd sync to GitHub as its own thing and all)

Note that this has started to overlap with the cluster of notes emerging around [Ops in a Box](0dehw-8kxsa-81amj-gp4kk-td8cw)
