# Penciltape braindump

https://unusual.studio/projects/#e1354bea-9038-4a8c-ba2c-4c3762bcd8a2

## loading animation

the site icon for dashboard et al will be in the upper right, and it'll be a pencil, next to a tape casette (maybe the "icon" can be an interlocking version of these two, and the "real logo" is a non-square rebus like this)

these animations mirror the structure of the system: buffer changes are stored in memory (probably handled by the editor component, really), and any time

I guess my thinking was that tree changes should maybe be deltas, considering that trees are expected to be broad, and commits basically always

instead, the undo history is tracked in memory for a brief period of time,

## thread crashed, rebooting...

the model goes Blobs as the data structures for file states

I think my idea here was that, every five seconds as the pencil moves, the tape would start rolling (and change a certain color) to illustrate that it is committing to disk? I guess the idea is that, once the user has... made whatever amount of settling an "autosave" would normally wait for, it commits the blob.

I guess my thinking was that... you'd want these brief pauses condensed in some fashion? and I was originally thinking it'd be in the form of running multiple local revisions to a document with a UUID until the "final" blob is constructed? but, like... nah... you can just have it as a series of deltas to blob-updates, perf is acceptable for that for all the use cases in Penciltape AFAIK

so there's, okay, this is what I was going to type earlier:

- In-editor state handling (out of scope)
- Autosave-esque small-revision file-state-blob-update-as-delta-within-tree sync-commits (after a pause, focus change, or duration of activity)
- Full-tree checkpoint / snapshot commits (after whatever duration Google Docs would use to save a "version", or just whenever "user pressed Ctrl+S for Snapshot")

maybe it's more like "range annotations", which are allowed to overlap, and then "squash" is just an opportunity to finalize if no ranges overlap

## blob schema

okay so blobs are JSON objects that are either text, base64, or SHA256 and metadata for "responsibility" (which might be how Git LFS already works?)

anyway "responsibility" is like a minio/S3 provider or whatever where it's expected that the consumer has access to that third-party server to retrieve the blob

if Git LFS is this simple, this should look at making this a Git-LFS-compatible construction - anyway, it's a necessary feature, because

## cutting tree checkpoints

these happen either when/where the user selects "make checkpoint" or when the time since the last buffer-changed-commit percentage of the tree changed has passed some threshold like 10 seconds for every percent under 100, so the duration starts long (though not that absurdly long) , and

I guess the thing is that the undo history needs to get saved... nah, it just becomes more granular (dipping into version control, ie. flashing something to say "Local undo exhausted, press Ctrl+Z again to start browsing through history")

this would be like a left-to-right Timewaiter

the user can also do an "unmake checkpoint" which under the hood just deletes the

this is basically just a delta layer over Git branches, in that it has a delta layer for trees

it also uses tags more like commits, in that its analogous "commit" construct only has time/author data, but all intentional metadata like messages is kept around it, stored like tags.

you'd also have a Branch construction, to have names for, well, branches. But they'd be visualized as a list / line of names (a UI construction to collapse the bar into a dropdown would be sweet)

the thing about the Branch construct is that every branch change is stored as a document noting the update to the new ref, so that reflog functionality doesn't get lost in replication

## UI idea

maybe there's the "tapeline" that reflects activity, as new entries getting appended to the right

this is important to avoid the "you are visiting the past and inadvertently build a house right next to a cave village" of accidentally editing an old copy

actually now that I think about it, this is a core part of the editor. maybe you can have it be a matter of highlighting a range of mini autocommits to "squash" them (giving the option to either forget the buffer data, or to keep it, where it will appear as an expandable side-branch)

## extension for editor component

(either Ace, Monaco, or the relase of the new CodeMirror which likely will never come)

A button on the last character of a Markdown link (or the end of any hyperlink, including definition lines) to open that link in a "browse through tree" tab (ie. it's treated the same tentative way as file previews when tree-browsing are)

OOH, that'd be a real handy feature for Theia

BLIP: Markdown should have an "only count hashes as headings if there's a space between them and the text", ie. Hashtag Safety Mode - was just thinking about how a hashtag might be useful here, although we all know you don't need a hash to do a tag you want to search later, but eh whatever

## sound-to-Fountain mode

So, the first-class data structure in Penciltape for annotating files is a sibling text file

files have a comment line that declares that they're a transcript for a named sound file - this is the SPOT for this metadata, implementations may cache it for quicker queries in the UI locally but it's not to be replicated

renaming an audio file has a "Rename references to this file" option that defaults to Yes (so long as both filenames end with an extension, y'know, so you don't screw yourself trying to fix something - if the extension is screwed with... you know what, Penciltape is high level enough that it doesn't allow you to screw with that, and indeed, the extension is hidden in the UI)

I guess you have cues per timestamp, which will jump you around in the file, ie. a single line with just "21:40" on it means "this text applies 21:40 on"

transcription service just auto-generates this
