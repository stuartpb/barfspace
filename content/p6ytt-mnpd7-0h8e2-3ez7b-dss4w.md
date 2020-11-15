# Operation and configuration of a sufficiently-advanced "did you mean" feature

So basically you've got some kind of environment variable or config file or argument or something (you know, versatility, like how Git does it) where you can specify, for various rules, the behavior

For example, say I want the behavior "if it has an edit distance of 2 and isn't a destructive command, or edit distance of 1 if it is a destructive command, give me three seconds to cancel, but otherwise do the action". I'm thinking that'd look something like this:

```
commit|reset|destroy~1,*~2=nny:3
```

Or let's say we only want the automatic action to happen after two seconds if it's non-destructive, and after increasingly long delays for less and less likely potentially-destructive commands - we might do a few lines like this (which may be separable by `;` and/or `&` instead of newlines for easy environment-variable use):

```
commit/reset/destroy~2=4:n
commit/reset/destroy~1=3:yn
*~2=2:y
```

the left side of `=` being a comma-separated list of commands to match for the behavior. (Note that I changed the command separator to `/` in the second example: that's because it's easier to type than `|` and I don't think there's another context in which I'd want to use it, though the argument could be made that there shouldn't be that kind of multi-level separation at all.)

The initial example rewritten for smooth edit-distance-specifying without multiple kinds of separator:

```
1~commit,reset,destroy,2~*=nny:3
```

the syntax on the right side being letters defining the defaults for what happens if you hit enter, followed by what happens if you hit spacebar, followed by what happens if you wait for the specified time (separated by a colon on either side, which it doesn't strictly *have* to be since we could theoretically distinguish digits but makes the namespace a lot more potentially extensible than allowing times to be run directly into defaults like `10nny`). each subsequent letter defaults to the previous one

time is interpreted as seconds unless it ends with "ms" in which case it's parsed as milliseconds - it might seem like "hey, can't you just parse anything greater than 100 as milliseconds", but no, because that'd be magicky and unpredictable, especially when it's perfectly valid to specify second values over 100, and I shouldn't have to insert three more zeroes to do it (it'd really suck if I set up `help.autocorrect.blow-hatch=nny:6480` thinking that it'd give me 108 minutes to cancel if the script tried to run that command, only to suddenly discover I've actually given myself 6.48 seconds)

specifying matching commands in a list lets commands have a sorted precedence in the suggestions, so you might write `status,stash,stage,*` to make it clear which command you probably mean if you type `git stat`

OH WAIT that's another reason timeout should be separated from the `yyn`... hmm, maybe it should be `1` instead of `y` (for "first option"), and `0` (for "cancel"). Sure, you could theoretically say "default to the second option" in this spec, but that's disallowed because it's patently absurd ("pick some second-most-likely thing I can't predict by default"), and would almost certainly be a typo / [spelling][] error

okay so another thing is that y/n is bad because the letter namespace should be reserved for a kind of tab-completion / whatever-you-call-those-underlined-letters-on-menus-for-which-alt-plus-key-selects-the-menu-item-things thing, like if I type `stat` it suggests 1:stat**u**s, 2:stas**h**, or 3:sta**g**e, and I can select them as 1 or u, 2 or h, or 3 or g accordingly

So one weird thing about this is that `7~*=n:0` means "tell me about any command that's within an edit distance of 7 but don't even bother prompting me about taking it", even though it looks like a "disable suggestions" line

[Spelling]: jy7zh-8sr2j-05920-dv135-7p8xe
