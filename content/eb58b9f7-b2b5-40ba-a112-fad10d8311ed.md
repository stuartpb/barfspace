# workspace volume thought

for workspace setups on Stubernetes / Wayside / Gitpod or whatever (inserting my keywords here):

`~/.local/share` and `~/.local/data` should be two subvolumes that can be mounted (merged?) in different contexts.

The thinking here: I might want to update configs globally, but keep data striated per-project (or set of projects).
