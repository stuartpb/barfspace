# Using VS Code (OSS) to edit these notes

I should have a setting for VSCode to autosave in this workspace (maybe an editorconfig? Does editorconfig have a key for that?)

I was trying to figure out why this wasn't showing up in my untracked files / orphans and it's like "oh right, bagtent-conjure --open doesn't touch files first, it spawns the editor to do the save, so you can abort by closing without saving" (the idea being that you can rig and save at roughly the same time)

Hah, it's funny how Theia's brokenness has taught me fear-of-cotton (TODO: make a page for that) responses to things like "clicking the Show Editor button without fucking around with the tab scrolling"

Theia's crappy clone of VS Code's tabs is so bad: how hard would it be to just lift that out of VS Code's codebase? (NOTE: probably very hard, it's Typescript written by Microsoft, abandon hope all ye who enter here)

Remembering here that a good tab system would work as a no-wrap flexbox container, where a min-shrink could be applied and it'd work like Firefox

## Papercuts

on Stuzzy, I had to lower the font size to 12 to get it comfortable

Need to disable "Ctrl+C on a line with nothing highlighted copies the line"

Is there a way to enable "Ctrl+C with something highlighted in the console copies instead of sending an interrupt"? I mean, fuck, this is how the Windows 10 console works now

Okay, these were both handled (on Stushiba) by searching Preferences for "Copy", that was easy. (TODO: add this to petlogs for stushiba, 2019-06-20)

EDIT: ARGH, the terminal one is just "copy *when selecting*"

Okay, so I just changed the keybinding for "Terminal: copy selection" to "Ctrl+C"... looks like that fixed it? I ran "yes" and Ctrl+C was eventually recognized (I probably could have done "sleep" instead without spamming the console, derp)

https://github.com/microsoft/vscode/issues/8818 pointed me toward the logic for why this works OK (it's exposed in the Keybindings tab, which is cool), but it'd be nicer if they explained it

## A brief aside about bad defaults

[Here's a page about why "just configure it", as I have to do repeatedly below, is Not Great](81a3de04-98ad-4d85-a2ca-a4891efabeb2.md)

## More smooth shit

I'm getting into a groove with this now. (Here's a section of stuff that's good in VS Code, features I'd want to see in whatever cloud editor I move this note editing to, ie. things to suggest in Theia or implement in whatever wayside/borkflowy editor I might develop for it)

Since I don't have to do preview-tab fuckery, I'm ctrl+clicking links in the left tabs to navigate around, and then copying over to content in the right.

Moving tabs around to accomodate this "left tabs are for navigation, right tabs are for writing and pasting" structure is working really well

I've had a note in my Loose Notes that I want a "pressing tab changes the line's indentation no matter where I am on the line", because when the fuck do I ever want to insert a tab anywhere else? (I mean, I've already disabled the insertion of tab characters, so anything Tab can do, Space can do too.) Thinking about it for a sec, and how I solved the "I want ctrl+c to work normally in terminal" thing, I realized "crap, is this just a matter of changing the keyboard shortcut for indentation?"

Ayy, what do you know, changing that keymapping (from Ctrl + Right Square Bracket) Just Works, shift-tab inverts it and everything, that's both nice and somewhat unsettling/frustrating because I just *know* that means the Indent logic is probably pulling some "see if shift is pressed" assumption fuckery magic

## Edge case to the tab thing

I've found a case where this doesn't work how I want: if I do type Tab when I'm indenting a line, it selects the new indentation instead of just inserting it (meaning that continuing to type undoes the indentation)

What I want is for that highlighting only to happen when I'm typing somewhere else on the line than where the tab would be inserted - or, really, I could live with it just never highlighting the indentation (I like the *visual* of the highlight to illustrate the change, but, like, the functionality is just detrimental)

Yeah like actually, the more I think about it - if I'm mid-line, and I remember I wanted it indented halfway through, I want to be able to just hit tab and keep typing.

Is there a way to configure *this*? I doubt it (but, as I said, I think "don't highlight when indenting" could be configured)

Oh hot damn, did "Highlight Active Indent Guide" just turn this off? *Sweet*. (It'd be cool to have an "Only visually" option for this)

## Shit that could be smoother

It's cool that tabs have both "Copy Path" and "Copy Relative Path" in the context menu, but what I'd really like to have is "Relative to..." with a submenu for "Tree location" and "Open file" (with the option to make "Copy Relative Path" change to "Copy Relative To..." -> "Workspace Root" or "Workspace" -> "./")

This could be an extension, one that optionally replaces the "Copy Relative Path" option

Could also have "Relative to working directory for terminal/process" as siblings of

Would it be possible to put "Here" and "./" on a split line, like the Firefox/Chrome Edit "Menu"?

Anyway, a simple "Copy Filename" option would satisfy me just as well for bagtent's purposes, and it seems just as justified (and could be under a "Relative to Parent" menu that lists siblings including "..", going up from the file's location instead of down from the workspace / filesystem root)

These would also make sense as context menus on the breadcrumb bar, y'know

## Whoa, here's a bug I've found

Unsaved buffers, even when they were opened for a new filename in a nested directory (ie. `bagtent-conjure --open`), resolve filenames from the workspace root until the buffer is first saved.

## Another similarity I'm noticing

Code's WM view of editors (which live in a separate universe from terminals, which use a dropdown to switch rather than tabs, which, ehh... this might not be a bad idea for a Window Manager to unify, did I branch that pipe dream off somewhere)?

Anyway, what I was going to say before I was so rudely interrputed by my own parenthetical, it's just like Tree Style Tabs - and then it has another pane that hosts a tree of *files* from a *workspace* collection or whatever.

So yeah, this feeds into that same [Windowsystem Metabrowser](20768279-9c6d-4476-90d8-9dd15f3aa4d3.md) project idea note.
