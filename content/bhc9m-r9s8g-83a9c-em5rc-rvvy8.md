# GNOME Cursor/Selection/Clipboard Idea

Something like GPaste, but, like, hopefully implementable as a GNOME Shell Extension, which I imagine is easier.

Anyway, this'd be a tool that visually represents the current selection separately from the clipboard (as this is the native model to X11, andi t does kind of make sense from a usability context).

so when you highlight something, it displays an ephemeral "something is highlighted" icon on the top bar (maybe with a preview of that hightlight as plain text / thumbnail), and when you hit Ctrl+C (or pick an option from a menu, maybe with an option to clear the selection) it puts it on the clipboard stack

one idea is that there should be a few degrees of "paste":

- the first "paste", if you don't hit Ctrl+C to copy your current selection, pastes the selected text and deselects it
- the second "paste", or first if you have no selection, pastes off the top of your clipboard stack
- a next-level "paste" pastes from your clipboard stack and clears it

## thought about selection

rather, the selection menu should be a dropdown of *all the selections*, each window having its own selection context

Possibly in a [Windowsystem Metabrowser](41v84-ycwdn-4p91p-4xt5f-kn96k), this could extend down to each tab (browser or buffer/editor/app)
