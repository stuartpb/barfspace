# Bringing more browser/"IDE" interface into the window system

splitting off (I think accidentally) from the notes on [Wayside](46qjk-agdzr-a58ez-vypmf-3hxay), a [windowsystem metabrowser](41v84-ycwdn-4p91p-4xt5f-kn96k) would have a way of handling tab/UI management (including toolbars)

See also: [Scroll position](c27g5-kdtm1-26ar9-t6kdc-5mb4e)

On this thought, why doesn't VS Code have a sensible application menu in GNOME? There are menus like "File", "Edit", etc, but they're inescapably attached under the titlebar.

## another idea bouncing off that

every "editor" or view or whatever you call it - whatever headless/chromeless browser runtime - ought to be composed of whatever configurable UI within its window, and any poput windows must conform to a certain kind of window spec... and really ought to use the API that can be nested in icon/tile "remote control" togles (like the different views from the left sidebar on Mid-2019 New Twitter)

oh yeah, the other thought was that it should have a switch management interface for being spawned

So I guess the idea is that you're either a trusted browser or code editor (in which case you have special interfaces for interfacing with semantically-out-of-window UI constructs like tab-bar icons / sidebar / toolbar), or you're an "app" that doesn't have any kind of integration (ie. an old-school windowed app), which you could enhance

I think my thinking in this was to cover how X tabs might use Y container identities (which put a color underline in Firefox), while sharing toolbar definitions between the containers (but different tabs using different configurations). And these differing layered configurations would be navigable in something like Inkscape's filter / gradient editor, where making a change produces a new spec, and specs that are not currently applied to any element can still be referenced, reattached, and revisited

## possible event loop interface idea?

(at this point we're getting heavy into the "system interface" aspect of this idea)

a program can be responsive by returning `nil, "whatever heartbeat message here"` - the thread doesn't exit until it returns an exit code and any output text (this could also be a model for streaming to file handles, which could be negative values)

wait, is that how signals work? they're like a signed integer you give when sending the resume signal that's usually 0, and they're usually negative, and that's actually why it's `kill -9`?

now I feel like we're starting to get into my old Lash idea (referenced in the June Judgment),

also this kind of reminds me of the good design of NodeMCU in needing scripts to return to the event loop within a few seconds or get reset by the watchdog timer - I think that same logic is sensible to pop a "Your application is unresponsive"

This can be implemented as having the whole tab dim (or even fade to static, maybe as an easter egg config option after the user approves a photosensitivity warning) and a pinwheel come up? Or the "not responsive" slides down from the Chrome Zone (which the app has agreed to divide from the Content)

Is it possible to spawn a version of Chrome that will eschew its own responsiveness detection, and the OS (windowsystem) is expected to handle it?

## compatibility engine locking

did I have the idea of providing a "tested against" that's like ROBOTS.TXT but for user agent browsers, and sites can use it to opt into notifications if a future framework is anticipated to break something (you know, like the engine field in package.json), and if they don't fix it a warning gets displayed

packages without this compatibility info (at the top level, for both the runtime (ie gecko/servo/blink/electron/nwjs/chromium/firefox)) get a warning when installing them to the user that they could break at any time, and it'd be the user's problem to figure out

## While we're on the subject

One key idea to this is that this engine spec - it all has web compatibility as its baseline, so it can be ported from a "desktop" environment to a "browser" environment where the "apps" are rendered in pages (the only thing that falls down, ironically, is browser tabs)

## anyway, bottom line

I guess the core to this would be that there'd be a "runtime process" backing a number of tabs (though they should be able to fragment/containerize it based on whatever need), and that native level is WASM or equivalent, with "what APIs do you need access to" that starts with the DOM (and maybe someday a subset that's just "I need canvas access"), and then they can opt in to get Electron, Node/nwjs, WASI as part of their package.json definition
