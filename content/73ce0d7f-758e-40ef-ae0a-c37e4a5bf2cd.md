# Using VS Code (OSS) to edit these notes

I should have a setting for VSCode to autosave in this workspace (maybe an editorconfig? Does editorconfig have a key for that?)

I was trying to figure out why this wasn't showing up in my untracked files / orphans and it's like "oh right, bagtent-conjure --open doesn't touch files first, it spawns the editor to do the save, so you can abort by closing without saving" (the idea being that you can rig and save at roughly the same time)

Hah, it's funny how Theia's brokenness has taught me fear-of-cotton (TODO: make a page for that) responses to things like "clicking the Show Editor button without fucking around with the tab scrolling"

Theia's crappy clone of VS Code's tabs is so bad: how hard would it be to just lift that out of VS Code's codebase? (NOTE: probably very hard, it's Typescript written by Microsoft, abandon hope all ye who enter here)

Remembering here that a good tab system would work as a no-wrap flexbox container, where a min-shrink could be applied and it'd work like Firefox
