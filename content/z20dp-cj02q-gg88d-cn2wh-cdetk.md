# Context-Menu "Conjure Here"

also maybe a keystroke, like "ctrl+shift+n", or like maybe even "ctrl+n" is overridden when in a bagtent context (and "make new unrelated file", ie. the old ctrl+n, would remap to ctrl+shift+n)? Or maybe we can just suggest a default filename for ctrl+n (ie. even just opening in a new tab the way CLI `conjure --open` works), and ctrl+shift+n is the only one that inserts/linkifies, I feel like that's a decent compromise, while editing files in the content/directory

what about Ctrl+B, the key between Paste and New? call it "Ctrl Barf"

hmm, on VS Code Ctrl+B toggles the sidebar. one thought is that in a whole-windowsystem-is-the-ide system, this functionality could be remapped to the Windows key (or whatever the technical correct term is for this)

but another is that sidebar toggle could probably be something else (how can I see what other applications / popular mappings map to sidebar toggle?), freeing up ctrl+b (at least for Code's default layout)

in other editors, I feel like the default map for that is execution-related (p sure it was Breakpoint in Cloud9) so overriding it'd be nbd in a Markdown context

my thinking is that this could probably be done in pure JS as an extension for Theia / VS Code

The key *advantage* would be that the page path is pasted into the spawning page at the cursor position

(plus, you know, all the convenience of not having to change panes, hit the up key, rerun `EDITOR=code ../bagtent/bin/bagtent-conjure --open`...)

## other enhancements that'd be useful for bagtent

(either in the core, or as an extension)

I think I've got a couple of these listed in my thoughts on VS Code and Theia (and/or in issues on each):

- "copy filename" instead of path/relative path
- tab shrinking to a minimum width before scrolling (a la Firefox)

also:

- "Insert link to file searching by name" would replace the "rig" weirdness from the original (for creating links by reference, this'd be a nice timesaver)
  - I believe a note for this already exists as [link suggestion dropdown](nypb9-qhzf4-ceaap-gx6rb-r11ec) a fair amount
