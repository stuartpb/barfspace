# Tabalanche notes

https://unusual.studio/projects/#32a1ffe8-abc8-4d8b-aa0b-887ab69b9b3e

Now that [I'm using Firefox][viva], I'll need to revisit Tabalanche anyway

[viva]: fc7r5-6kzqt-4p9pq-c1jvg-vs8m4

If GitPod / Theia doesn't have a C9-style "Download workspace"... well, that's probably hackable with some other kind of GitPod port layer or something, but it'll make Pull Tool that much harder to work with.

Funny observation: with Tabalanche gone, I'm using these notes to stash tabs a lot more. (See also needing to stash the state of what notes I'm visint more when I can't sync IDE state like C9 did and like Wayside is slated to do one better at.)

## Subpages

- [Tabalanche Quests](z51w7-xnfmv-wt9sr-c9pwq-f5sc1)
- [Timewaiter-style history scroll implementation](jvqsx-dhxz6-g0a3p-tf8qw-he8wf)

## Features that should be in the next Tabalanche revision

- Export as Markdown (per-stash)
- Search, obviously

I think I forgot I had the quest page, because I think search is listed there.

We ought to reintegrate stuff from here to there

Also a reminder here that I pledged to upload a fix for the storage removal thing.

## wishlist

- [extensible UI](b6sd2-tz9z2-rs8gn-pjdm2-2rp4v)
- [full-page stash interface](bk3jn-0dpa0-yparb-9r553-kpggg)

## Things that should be overhauled

- Export should be streaming, just like import. YAML-based would probably be the best way to approach it. (Stream of document exports to a file as a download would be the smartest way to swing it, if the file writing's not prohibitive.)
  - Also need date scoping on export.
- Do we have a better solution for persisting storage?
- Favicon cache is currently Chrome-specific: https://bugzilla.mozilla.org/show_bug.cgi?id=1315616 describes what'd be needed for a Firefox version

## Oh DIP

I think I lost some tabs because I didn't get that "Temporary unpacked extension" means TEMPORARY.

moz-extension://d22b62ba-ea60-476c-9757-c2acad082a3d/dashboard.html was the original Dashboard and it's fully gone, I'll have to go back to History if I want to remember those tabs
