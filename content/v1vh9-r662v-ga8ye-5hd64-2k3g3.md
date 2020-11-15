# Shenzhen I/O Solitaire thoughts

part of [notes on shenzhen i/o](5cqgn-n07wk-tgak7-nz0w5-bv60f)

I was thinking this could use some fun embellishments:

## Undo / Viability

Thoughts I had on how you could make Undo interesting, and/or add a feature to let you know when the situation is hopeless:

- Undo mode only tracks streaks
- Mode with infinite undo is "training mode" and tracks nothing
- A number (in either one, or you could even have it with no undo) of possible ways to win from the current position (ie. "more than 1000 viable options", "only 1 way can succeed", "the path to winning has been lost")
- You can have it so undo only unlocks once you've "lost" (and, as your streak is thus ruined, you're allowed to undo and try again)
- Same goes for the "number of viable routes", could be exclusively-training-mode-or-post-loss

## Scoring / Time Limits

- Let stats be collected on time to solve
- also allow "Super Hot" mode where it just tracks moves, golf-style
- undo, if implemented, should cost points
- this is all kind of ripped from Windows XP's Spider Solitaire
