# bagtent-sprout and the top-link alias system

this note was originally pulled out from [the original bagtent braindump][dump], a context in which it may make more sense.

[dump]: jgsdh-qj8br-mk8vj-z8xmy-xmhgs

## the high concept

The original idea for how bagtent files would enter the world was with a "bagtent-sprout" script that would offer a menu for "What page do you want to sprout from?", which would list pages with the most outbound links at the top numerically, and you could push up/down to choose an origin (or type a phrase to grep for that would find the page), and then it would add the page to the last list on that page (or maybe you select a list?), and open the new page.

Also, within that page, I was originally thinking one would type the first half of missing links, and then the second half would be added by running a bagtent-rig script that would present entries from bagtent-top-links.

there's also a note that "most outbound links" may make sense as a tiebreaker for rigging? maybe most *inbound* would be the tiebreaker? I mean, I think that's kind of how top-links works now... eugh, whatever, I'm not sure this thought's sound enough to merit a note

## a retrospective

I'm not sure any of this is a great UX win over just grep. maybe when a UI comes, it can borrow some of these ideas? but I've found that *just typing this stuff* isn't that much harder than following a wizard, this seems like I was kind of overfitting what's-gonna-be-the-biggest-pain-in-the-ass-to-manage without experimenting enough with an MVP (a common feature of [My Old Bad Ideas][MOBI])

[MOBI]: yfsxd-ek388-ct9ye-xb9we-qb9mj

in fact, thinking about it a little more, I'm increasingly *against* the core concept I was working with here. It reifies names in a way that drifting the concept to a more relevant name is *penalized*.

so maybe it's a grep for content (by highest-then-shortest match) by default, and `[` starts the search with the content of the footname ghost-filled, and you can give another name to *look at references for*?

I think that's an important consideration to regard when designing the below: be careful that it's not *privileging a class of distinct name*.

(stuff below is cut+pasted from the original braindump)

## the coining of "footnames"

the perfect name for the strings that bagtent-top-links works on that Markdown uses for links and everything should be "footnames" (maybe that should be the new name for bagtent-top-links, bagtent-footname?)

## the command line / menu for sprout interactively

each menu takes either a search string, a number, or maybe a colon-prefixed line that's a command like `:sort inbound:ascending,match` to make longest-match only the tiebreaker sort for pages with the fewest inbound links (or you could even sort outbound first)

maybe that should be how the line works by default, there's number prompts, letter commands, and then like vi/less, you can type `/` or `:` or `-` or `+` to do searches, commands, or param settings (respectively). maybe also have something like a backtick for prefix-split (ie. the default for non-alias) and  `~` for fuzzy searches? and maybe `'` for literal search (closing single quote is optional and is treated like closing brace in `test`, where it ignores only the last one if present)?

maybe `#` searches by page title, and `[` searches by link name (again, discardling last brace if present)

how do I inject a suggested character to the read buffer? do I just have to listen for backspace and fake having a character in the buffer before the actual start of the line? wait, why did I care about this

I'm thinking all configuration can be by environment variables, `BAGTENT_DEFAULT_FIRSTLINK_SORT` or stuff like something like that

don't forget that all this would also be useful for a "select a file to open in $EDITOR or the given command" tool, or something where its default behavior is... the editor one, but it can also be run with an option like `-o` which will `echo` the filename

actually, no, terrible idea, the menu script should be the root, and then there are lightweight wrappers around that for editing - that also allows it to be used for rig and sprout

oh, a thing I guess I didn't cover here is that you can use the same menu system for a default "here's all the available content by some hot topic sort algorithm", and you can also use it for disambiguation (so like sprout might have a `--prompt` option, but by default it only prompts if the given search string for the file to prompt off of

i was thinking `-U` could be an "ignore matches in UUIDs" option, for instance I had a UUID earlier that matched "007" and if I wanted to search for "007" as a page title, I would have been clobbered with unrelated references. But, in general, I actually  do want it to be possible to refer to a page by part of its UUID

maybe the default list if nothing is specified is the links in README.md in order. also "list links from X file" should totally be a command, where it can (potentially?) spawn a submenu (like, a further instance) to select

oh hey, is there maybe a way to autocomplete? like, if we just go full-curses, maybe we can do the thing (when not falling back to readline or whatever) where we hint what the current #1 selection would be, and/or show the list live-updating? (so "enter" selects when it's unambiguous, and goes to the menu if it's ambiguous, and you pick the #1 quickly by just double-tapping enter to select the current caret option as soon as you're at the menu)

if we can lay this out in the terminal, it'd definitely make sense to have the menu search at the top (like Atom's quick search which this is so closely inspired by)

when grepping, the first line of every file should also be included in the search space (did I already cover this somewhere? they'd have options for excluding one or the other?)

there should be a mechanism when rigging to say "use the full version of what I typed, replace it", or not, because I'm not wild about long-ass link names propagating through substitution... is this maybe what I was talking about above with the ~ prefix? that can do a fuzzier search (ie. not going to search on boundaries, each space-separated word is going to be between `.*`), and when rigging, it will replace whatever the selected match was. (usually, I know the name I want to rig with, and I want it to be short)

that substitution thing can be useful when your page has only a long title, though... idk

don't forget that multiple matches (like `quests` might find the page linkes as `quests` or `main-quests`) should consolidate to one entry with a higher total

also, a thought from earlier is that there should be a linter for multiple instances of the same link on a page with different names (is there already a Markdown Lint for this?)

(at this point we went *really* far into the weeds with a whole loose design document around how to structure "[did you mean][]" behavior)

[did you mean]: p6ytt-mnpd7-0h8e2-3ez7b-dss4w
