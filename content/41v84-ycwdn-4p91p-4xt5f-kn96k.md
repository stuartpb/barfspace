# Windowsystem Metabrowser

This is an idea that I have sometimes: that it'd be cool to have a windowsystem where the browser and its apps (and "native apps") can coexist, almost like how Android briefly put Chrome tabs in with native apps

anyway the idea with this is that you'd have nesting levels and tabbing interface selections / constructions enough that the role of a "browser window" can be handled by just a nesting tab (where the top-level "tabs" could be managed like GNOME's interface, or Windows or Android or Mac OS or Chrome OS's repackaging of whatever crap)

I was just using [Code (OSS)](ef70t-zvnhr-8faw2-p3fs5-5qwrd) and thinking "it'd be cool if I could dock a couple Firefox tabs next to my terminal", and that got me thinking, it'd be cool if Code's sidebars could live alongside Firefox's somehow. Anyway, food for thought.

## idea

can VS Code's interface be thrown into Beaker Browser (ie. where browser tabs can live alongside terminals and editors/buffers)? Is Beaker Browser's interface customizable by HTML? Can that serve as the native windowsystem? Is there tooling to experiment with this?

## anyway

I guess what I really want is just a way to write a system (heck, why not in Lua? If you can write documents in Rust you must be able to do it in Lua)

## Related / adjacent

- [Wayside](46qjk-agdzr-a58ez-vypmf-3hxay)
  - [a panel/toolbar/window/tab interconnectable component frame routing model](mzjfd-q9wp4-wra3t-nzrnc-0k3w7)
    - isn't this basically just... frames? and messages?
- [VR/AR Window Decks](145g4-r763p-8d80c-fth7d-84aet)
  - a lot like this idea, but with the surrounding window-management chrome being in 3D space
- [Red String Room](rgvet-f9pds-01985-jef45-ywyew)
- [Binder Explorer Window Model](9vzhy-yr8cb-6v87n-wp4b8-m7v0v)
- FreeCAD's [notion of "workbenches"](https://www.freecadweb.org/wiki/Manual:The_FreeCAD_Interface)
- [Bagtent UI Ideas](pz4va-mx94c-ca9ew-py41b-5e1jp) thoroughly covers the nesting-tree sibling-navigation aspect of how tabs
- "Featurelets" page for VS Code
- [Touchscreen Terminal Window Model](9dp6a-pk4mj-jxaya-gbjh9-ndr0z)

## outside model to consider

- wayland, duh
- Cockpit

## Related "this is a cool feature for the OS" projects

- [rethinking the clipboard](bhc9m-r9s8g-83a9c-em5rc-rvvy8)
- [packaging runtimes and their UI into tabs](mzjfd-q9wp4-wra3t-nzrnc-0k3w7)
  - cross-concern with Wayside, which constructs the concept of an "environment" out of these kinds of tabs and UI constructs
- Another level of packaging: [Honeydew Browser](qfxxj-99818-mkar6-2xdfx-tt10c)
- [Scroll Bookmarks](c27g5-kdtm1-26ar9-t6kdc-5mb4e)
- [Tabalanche](3ex5c-s1wt7-s290e-zx6q3-88jp0) could work as a lightweight manager for saving states
