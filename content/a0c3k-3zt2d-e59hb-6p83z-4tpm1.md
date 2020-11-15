# fun observations/adventutes on gitpod and theia

I accidentally a bunch of orphan files into this repo, and I'm not sure how much of it is based on `gp open` choking on opening non-existent filenames? is that a bug that should be reported? maybe `--touch` needs to be an option to conjure so it can touch-then-open (and touch+print will remain the default behavior)

I also just see `gp open` fail with no explanation?

update: I reported this bug. it's not so much that it's choking on nonexistent files, as that it's not readily exiting after opening the editor, causing me to avoid rigging up the file as I don't have the UUID on my console to copy. the fact that empty files are created is an expected side effect of opening the editor to a new file and having auto-saving on (which I have because, A, it's barfspace, and B, gitpod doesn't seem to persist buffers)

this bug is in progress - the origin is basically in that non-buffer-syncing thing, where it ends up only caring about buffers from the first session... ugh

should also look into the thing where clicks on the "preview/view source" button also fall through to the tab below which is gross (UPDATE: I believe I reported this issue and it was promptly fixed with a batallion of special cases that did not make Theia's architecture look appetizing)

## omg hax

It should be possible to have a nested tab group by another mechanism than opening a "preferences" tab, closing all the preference stuff, and resizing the preference tree to zero

## speaking of annoying things about theia's tabs

theia not having a thing to put a tab in a specific position on another bar is driving me fuckin' nuts. everything has to be dropped into the Section of Screen Desired, which, just, ugh.

## OK SO

I just caught wind of [GitPod's 100-hour-a-month time limit](https://spectrum.chat/gitpod/general/arrrrgh-my-100-hours-are-up~a159e788-f5bb-4fc5-ac10-f19700a60116), and I'm realizing, if I'm spending more than three hours a day interfacing with these notes via GitPod, I'm gonna hit that before the end of the month.

So, shit, I'm back to needing another solution.
