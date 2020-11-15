# Tabs and Windows

*I close my eyes and I see... [tabs and windows][Blood and Roses]*

[Blood and Roses]: https://www.youtube.com/watch?v=vqML7WbOun8

This is a home for all [quests][] that make it easier to just *browse*, to switch between tasks, all the things I need in that domain.

[Quests]: dwjwz-5wex1-ge9ve-1w4ge-avg0g

Formerly "Comfortable Browser / Windowing Experience Arc", which was just too wordy for me

## Tabalanche Revamp

- [ ] Rework the visuals for Tabalanche.
- [ ] Make it possible to collapse tab groups into one "row of tabs", like they are at the top of the window.
- [ ] Make it possible to drag tabs.
- [ ] Make undo history visible.
  - [ ] See if the PouchDB Changelog can be used for a client to see its own previous changes.
- [ ] Add persistent / per-invocation drag-and-drop tag lists.
  - [ ] Have the lists be resizable on the fly.
  - [ ] Have Select Tag, Persistent / Quick Access Suggestions (Pinned), This Invocation Tags, and Persistent Tags in that order (probably top-to-bottom)
    - [ ] Select Tag is "Recent / Popular Tags" by default (maybe it's a mix by default, with the option to use only one or the other as... a slider?)
    - [ ] Filter textarea at top, like the Omnibar
      - [ ] Use this as a basis for Omnibar integration? This might become a separate quest
    - [ ] Arrow keys up/down move out of the filter area (maybe only from end of text, for users without Home/End) and into the suggestions
- [ ] Add search filter for tabs and tab groups.
  - [ ] Filter has the same kind of tag suggestion interface as stashing tabs, collapsible.
    - [ ] Checkbox turns on or off whether all tags matching the filter are included; it's on by default (but disableable in two clicks).
    - [ ] Tags can also be blacklisted.
    - [ ] Any tags moved to the "This Invocation" are cleared when the textarea clears (by Clear button or not)

## Tabalanche Mobile

- [ ] See if there's an API (or a root hack) to inspect/modify Chrome's open tabs from another app on Android.
