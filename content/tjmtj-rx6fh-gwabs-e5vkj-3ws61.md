# the First Agnostic Wayside iteration

## the pitch

This was originally going to be my idea to "resurrect Cloud9" by completely remaking it from scratch, emphasizing the things I would do differently.

However, now that Cloud9 is ending, I'm discovering other projects with better momentum behind them that are tackling the bulk of that work, and I'm realizing that I'd really rather just have a better *hypervisor*

## model concepts

- workspace
- layout
- view (workview?)
- tree (worktree?)
- driver
- derivation
- connection
- instance

A driver represents a codebase that connects Wayside to a backing implementation, whether that be an in-browser construction like a WASM virtual machine running Linux, or a remote node

Maybe Drivers should just be called Ways. Or rather, the "driver" is just the technical term for the implementation of a Way (ie. drop-in compatible drivers are said to share the same Way)

an Instance is a configuration of a Way

so you can have multiple Instances of the same project using the same Way

multiple Ways can be connecting to the same endpoint, but that's such a complex and fuzzy concept that, in the dashboard, they're treated the same as they would be if they were two completely different machines

## more

see the [old notes](27z7n-f4d5h-598f1-84z57-f0ecc), written with a different conceptualization of what level wayside would operate at, but largely contiguous with the new concept (the main difference is in believing that I'd have more control over the frontend design)

An idea for how this kind of UI unification can factor down through runtimes for different "editor" app views (ie. a [windowsystem metabrowser](41v84-ycwdn-4p91p-4xt5f-kn96k)) has been forked off to [this page](mzjfd-q9wp4-wra3t-nzrnc-0k3w7)

Something I've been noticing is that this bears a lot of resemblance to [Sandstorm](7mj1b-9zgf1-rb8ph-vc2z8-gwxwc)

## Use case

I'm really getting a workable model for how this app should structure its constructs via [Ops in a Box](0dehw-8kxsa-81amj-gp4kk-td8cw)

my rambling over there that got me on the right track:

- One thing would be to set up a dev instance of Theia, but it'd make more sense to track multiple Theia states that users in the namespace / group can give each other (and guests?) temporary (ie. door-knocking for the lifetime of the pod / connection) or fixed access (ie. allowing "reentry" of the user's own accord) to
- and, like, you can have different-concern-focused views for each "department" on the same project

so I guess you'd have a thing that provisions persistent volumes as "workspaces", and then has Pods or Services or whatever that are initialized on-demand to interface with that volume (but these should be decoupled and multi-bootable, so I can switch between c9 or Theia or whatever and have the "workspace" mounted in each)

I think those can be specified as Helm charts? the idea I had would be that "Helm chart with ingress on cluster" would be a Way/driver

but so yeah, anyway, that's the "shared basis" this can operate at: each developer has their own "view" of available workspaces and running sessions

teams might share workspaces, and they might share sessions, but there's just as much chance that one dev uses one program to work on the workspace, and the other uses the other (like one uses C9, one uses Theia, and one uses Che). The workspace in this description is like a thumb drive that devs are taking turns with.

This is admittedly a dumb idea, though: each dev should really have their own workspace - or workspaces, if they're touching multiple codebases.

but you might want to hand control of your workspace (or at least read access to the volume) to another dev when you go on vacation, or change teams

don't forget that open tabs and active buffers, ie "state", are another kind of persistence that is... I'm not sure representable in the Helm chart? and I'm not sure how they can be snapshotted/juggled/re-inserted... or ported between different apps (defined by different Helm charts), if there's a sensible copy/translate/migration construction for that

I think it's a matter of keeping two persistent volumes (maybe with names like "workspace" and "state" or "theia-state" or something like that)

of course c9 just handles this with a .c9 folder, maybe that just needs to be mounted like a separate volume?

and of course it's worth remembering that some folks, your emacs nuts and vimsters and what not, will just want SSH access into an Ubuntu image, or some HTTP app that just creates a terminal session (possibly authenticated by some kind of outside means, or maybe just a raw tty idk) and makes it full-screen - how do these console apps sync state

and then there's even the matter of "run X11 and present an HTML-based VNC view into it" for worst-case scenarios, which is a Chart you can definitely make

but yeah I need to know how Helm charts are designed to roll with workspace data

anyway the thought I was having here was that this would make for a real neat ["project setup wizard"](0d8cc-k29em-qw93j-mj01y-dkf5a), it's just a fancy app that sets up the appropriate files in your workspace volume, then pops up a suggestion for which kind of IDE you'd like to transition into (and, lest we forget, you can have all kinds of image selection / layer management here on what support structure to have available in the workspace)

indeed, it seems like a cool and reasonable trend to start doing would be to save Helm charts for your project's editor setup in a directory of the project, like .editorconfig but a whole package setup/configuration, if there's a specific IDE whose UI featureset you're counting on
