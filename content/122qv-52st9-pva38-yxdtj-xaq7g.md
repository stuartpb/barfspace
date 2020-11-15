# My integrated wiki editor concept

This'd be a good editor for Bagtent / my notes.

Okay, so, the "editor interface" browses master like Horus or whatever. Maybe the accordions, whatever. you can have whatever interface you want for "just browsing". Static renders.

Anyway, when you want to submit an edit, it's like the Gist interface - I don't think GitHub lets you add multiple files to a commit proposal yet? it could work like that if so

This could be done by requesting the content of the .md files clientside, which are retrieved from a GitHub-like server (maybe this can expect GitLab as a backing service? Or be Git-HTTP compatible?)

Anyway, you'd be able to open new files to change via an "Add new" button, or by ctrl-clicking links (ctrl+clicking through an unchanged view replaces the view's context; ctrl+clicking on a file being modified takes you back to that file)

You can have multiple "Add new" panes open, IMO, you don't need to make an edit (or do something like double-clicking the title in VS Code does for tabs) to force one to stop

Add new has "search titles or content" (because, don't forget, you also want to find subsections, one-off parentheticals, and names a page is only known by from outside)

Also "add new file to this commit" (and then you copy its UUID)

This state is all synced with the server as a delta series with keyframes as I've been outlining for a bit - and it's like a CouchDB database that represents a Git branch / commit (the "branch" only exists virtually, as a tag that might be inspectable using a remote that can convert it into refs off of the commit the commit was based on)

## history interface

This delta "undo-history" tree should be inspectable in the UI: doesn't have to be anything fancy

## delta notes, again

Each delta should have a note for which session it came from

## the shotclock and conflicts and stuff

shotclock can be daemon-based: after a certain amount of time, changes are merged into the tree

maybe you can have "if this conflict isn't cleaned up in a week, we're forking the page and inserting it as a link", but that honestly seems like a recipe for disaster?

maybe more sensible would be "we're adding a link to a new page with a diff of the md conflict as a fenced block, or a series of blockquotes, and someone can figure out how to work that in like that"

I'd almost rather have it be "we'll telefrag it in as two sets of blockquotes"

Maybe these can be opt-in punting strategies

## an odd tangential thought re: Markdown here

Would you need contextual re-indentation to make sure deep list changes don't render as code blocks?

## hey wait a tic

could this actually use the GitHub API, since all it's doing is querying files from a fixed commit (like metadata files, and/or content search being handled via a separate service) and then pushing that commit? (and, you know, the CouchDB stuff but whatever)

## linting / proofing / validation / etc

This could be dones as a "warnings" section (like, "here are spelling mistakes") as well as an "errors" (where errors forced under the gun to merge into master might get merged in some other way, like fenced code blocks?)

but yeah, this'd be where you'd have
