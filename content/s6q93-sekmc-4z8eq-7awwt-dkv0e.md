# Drafting space for a bagtent thing

this'll probably get tossed over to the Notestack Core for Bagtent Shellhack Cavalry to enact or whatever (so maybe link it in on the bagtent page too - shoutout to [tree / graph creation and mutation!](6yanh-hg3gd-s69sp-wyba4-qgkgt)):

## getting an overview of orphans

pipe orphans to xargs head

## turning the orphans into a list of titles by heading

probably a read loop that does a sed / Bash shortening on the first line of each filename from orphans, as well as the non-prefixed filename of it in parentheses

REMINDER: the first line isn't strictly the heading, should look at how Jekyll's logic does it because GitHub definitely recognizes then into `<title>` tags
