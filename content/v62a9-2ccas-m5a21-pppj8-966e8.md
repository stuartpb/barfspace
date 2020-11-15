# printacle

this is my project to make an OctoPrint killer

## Subpages etc

- [the key difference between printacle and octoprint](nthtm-69rh8-gp9kz-9dsz6-zx281)
- [best practice / pipeline for versioning printed models](psd23-mzd7m-ccam8-gj5na-h818e)
  - [revisiting the thought June 2020](5359r-v4yxp-16b0n-vnj5r-wf2cs)
- [cancelobject for printacle](ptz23-yfwtb-rf8jm-x4kdr-z2z0s)
- [Slicer Thoughts](h6y0k-2wkws-8zavg-ndx1s-mc0mr)
  - [some config thoughts](kta0w-qc5w2-g0ahw-pw7yp-9xf85)
  - [other config format thoughts](6qqvs-bs18z-nt86d-g1v81-wm6wg)
- [Snippet architecture](n25x4-9eexs-rb9hd-ytvnn-wn14s)
- [Module Tree based design idea](dkpzk-06tb0-e782s-3xway-z4zr7)
- [Cockpit: imagine if OctoPrint was based in this](9yk3d-nants-j7ax1-af3mn-n1rm5)
- [DCIM-like standard for 3D printing](gxtp5-nks9r-m8b1w-e59bt-mk4wj)
- [Base32 GCode?](hgry3-n5r8p-g99rj-7v6dt-0h5w6)
- [Odometer Cards and Material Scheduler](nk586-7dpxf-8pajm-d6ynk-gxh4s)

## the latest 2020-06-01

This idea is starting to merge with a resurgence of Module Tree thoughts (see Cockpit)

## implementation notes

see [WebSocket-to-Serial Implementations](t3cwg-ad6ka-gaakj-zevjs-msar1) for thoughts on how to structure that whole shebang

gotta look up the stuff about how Chrome OS does image swapping - that could maybe be generalized out to a tool for "define your module_tree loadout as an image" (though, really, doesn't this eventually just become Docker images and volumes?)

anyway, even the simplest partition swapper would be better than OctoPi's "back up your settings then re-flash the microsd"

note 2020-03-10 that systemd has made a thing for A/B partitioning

## to note

https://github.com/3MFConsortium/spec_production/blob/master/3MF%20Production%20Extension.md
