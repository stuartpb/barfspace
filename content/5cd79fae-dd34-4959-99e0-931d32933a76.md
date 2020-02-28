# 2010-Dream Filer Paradigm

This is sort of based on my fascination with Deep Zoom and OneNote in my just-moved-to-Redmond days.

You'd have the latest "siblings" (ie. the outline of the previous page, with links by name) in the sidebar

When you navigate a level "deeper"

## diversion from tabs to just breadcrumb menu labels

maybe those "tabs" are more to be accessed by drop-down, and this starts to make more sense like Horus?

Like, it could be even expressed as the sidebar being on the right? Or maybe everything stacks left, that way (in left-to-right reading order places) it makes a sort of spiral sense that the title of this page is right of the previous page

## anyway, back to how this idea is better than breadcrumbs

Wait a sec, better-than-breadcrumbs sounds familiar... have I written something like this before? or am I just hungry and thinking about Keto recipe ingedient slogans

anyway, the thing with the tabs is you'd have the ancestors be in a scrollable vertical pane

maybe there's some kind of "shaper" that determines whether your page's level forms Tabs or a Dropdown based on the characteristics of its layout

or maybe, like... the accordion is a manual toggle for "show this page's headings as tabs"

maybe that's the thing - the current page is always a tab, menus are always another layer of tab, you can just click on a menu to switch directly to a tab

but yeah, some kind of manual accordion for "hide the row of tabs for this level's children"?

## manual UI-to-page-layout shaping

pshh, maybe you have a many-handled line for "subtabs" to "menus" to whatever on one side and "siblings", "uncles", whatever to "headings", "sublists" on the other

I guess it's "ancestors above" to "ancestors to the left"... maybe that's the "shape", you define a line that will always produce levels that scroll/shrink/whatever at whatever

maybe eventually "cousins of this page can hang out like siblings", which by default applies for "only children"?

this is starting to sound like something flex containers would be good at?

a dumb thing I'm thinking about here is that, for sufficently long pages, scroll position (for sidebar AND tabs!) are important to record

There's also the matter of "notebook bar" tabs

I guess there should also be "basically hide the title for this", like I don't need to see the Book Bar page's title if it never moves

maybe that's an auto-feature, fixed UI titles are hidden by default

## ui call for example

inline tab groups? is that a thing?

## paradigm break

ooh, but now you need a different kind of "save my current position, put my thumb on this" concept (Virtual Desktops, you might say) - this is typing into the Windowsystem Metabrowser blob again

example: you need this when making splices

oh damn, like, on that note, I could kind of just use my browser's tabs for this, that might be a way to make this kind of splicing more feasible. Like, hell, it works well enough for Wikipedia (and they don't even have this kind of auto)

## another paradigm break / diving more into the editing angle

KEYWORDS: this is a part that dives a lot into the intersection of buffers and Git that would rock for Wayside (or some subset that's specialized for this editing paradigm) / the Windowsystem Metabrowser

Kind of overlapping: it's not just splicing - in general, popping off a "New browser tab" (though something more lightweight/in-UI-trackable-and-customizable may make sense at other scales) should be required to make any kind of proposed edit

like, I guess it's an "ephemeral view" that only "opens a new tab" if you choose not to auto-save it?

there's also the matter of "hold on, I want to make changes to multiple files in this commit"

yeah, I think the idea of each edit spawinging a branch spawning a "tab" view makes a hell of a lot of sense

## penciltape / Whatever Way to Rebrand VCS UX way to look at it

Each tab is a HEAD, each set of buffers within the tab represents a tree

You can have multiple tabs open to the same HEAD, I guess?

reminder that this ought to get linked in with the page with the Git flow for notes

I think the UI ought to really protest if your changes aren't

## way out idea

One cool thing about my use-a-kubernetes-cluster-for-provisioning-each-workspace-like-a-parallel-app-install paradigm for workspaces is that it (in theory, with a smooth enough build/stage/release/upgrade pipeline) lets me provision little bespoke throwaway nodes that can sync to a backend

this weirdly parallels my "runtime for an app in each tab" thought which I made some page for I'm tired

## more on that though

It's really remarkable, how on the nose that is: this would work for me so much better with Code - just have a bunch of the editor windows open, to the same tree (or, like, same auto-branching namespace - it needs to have some way to... track changes only made in that editor)

ah, this is why the one-pod-per-tab makes sense, it lets parallel trees live separately

but yeah, it's like, my thinking is, it's dumb to not have the view not auto-updated to any changes made from another tab if the view changes within this window (so long as there aren't merge conflicts)?

like I don't feel like I should need an auto-sync for each open tab I have? maybe I kind of do I guess, maybe it's nbd if you think about it (Pouch documents basically being deltas for reflogs, and hashed content)

## adhd sleepy thought

anyway, my thinking was... that's right, okay, good I got this thought before I head to bed

thoughts before bed like this are like a rodent hopping around - you want to catch it before it can scurry into the walls

## on branching and how it can bring autocommit back

okay, so, the thing about the branching. it helps me remember what files are, like, pending something I was in the middle of typing. it's **the main reason I haven't re-enabled autosave and autocommit**. I need that "unmerged" marker (that I currently get with "Untracked" and "Modified")

This would also be the thing about branches: you...

ah, okay, I see what the deal was with that idea now. The history of what you've edited in a "tab" (including whatever bookmarks / "open editor with no changes" touch or whatever) can give it its context and subject

but so that's a thing, they'd be long-lived, and a thought's development could be tracked along a branch. The branch would be kept synced with master,

also, yeah it'd be nice to have a thing that only checks the modified pages to see that any new pages are mentioned from the root, to force orphans into the tree (with a button for "make page collecting orphans, add a link to it from (default lost and found page/list route)" as a quick-fix)

## implementation consideration

I guess the ultimate thing here is that I don't know how to make switching branches as simple as switching tabs, other than to have them pointing to instances on separate parallel systems. THat honestly seems like the easiest way to tie UI to the UX I'm looking for, with the tools I currently have.

Or, like... okay, thinking back now, yeah, okay, this would make sense in Code, if I could have it so maybe...

maybe I've got lightweight (CoW?) checkouts of notes.stuartpb.com

It's like, the thing is, I don't *really* want multiple parallel trees, I want multiple parallel *changesets*... but I don't know how to associate that in the editor other than to make them actually different trees

I guess... you could just launch the new Code instance in an environment where GIT_DIR is shadowed, then? Or even HEAD is just somehow subtly redefined (but, nah, I think that'd cause issues with the index)

## anyway, gush

oh my god, I love the idea of "here are live-recognized branches-of-thought that contribute changes to this live page" as, like, a sidebar view, which would give, like, a "git blame" showing which branch "owns" the last version of each line.

this might be a nice spot to integrate badifogu into bagtent's tooling: it can be used to give auto branches random names.

## other "static" sidebar

There ought to be something like a "table of contents" - maybe it's the fixed root? - and that's, I was going to say the other sidebar (like the "notebooks" vertical bar)

## another thing OneNote had

though they may have backed this out at some point because it was honestly kind of a recipe for trouble? but OneNote displays
