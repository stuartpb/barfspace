# VS Code Ctrl+P Open File Priority Nitpick

It prioritizes "recently opened" over "I just created this five seconds ago". Shouldn't newer creation outweigh older access?

## side thought for UI

Okay, say it were about "stable positioning".

say I had three categories I cared about, like "Latest Opened" and "Latest Created"

You'd present them striped as each paged request by index loads. so if you have the first three of one category and are still waiting for another, you'd have one line with the first of the one, then a blank for the pending first of the other. and so on, and so forth: whatever highest value you've got pending is multiplied by the number of "lists" with items to this point (roughly), plus its index in the rotation of those remaining lists (so all prior slots are reserved - you can maybe do sparse structure that gets collapsed as lists produce an indeterminate end if that makes sense)
