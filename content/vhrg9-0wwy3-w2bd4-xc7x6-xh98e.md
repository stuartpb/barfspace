# Introducing Sprout Leaf

This is a new thing I'm experimenting with within my noteball's tool `bin/` rather than calling `bagtent-conjure `

## bigger picture

This kicked out into [Literately Generalizing Sprout Wizardry](xfwbq-rc8wj-0baq3-hgcpd-yvpcm), and started to swarl out into [A Markdown-First Kubernetes Microservice Notebook Model](bjst3-9j481-m0be7-2epd5-q2p2p)

The other one that gets especially close to where I'd be going here would be [You Got Your Tooling Definition in My Bagtent](ana5p-4mfhy-2jb92-j20zk-3wp0n)

## history

The original implementation was `echo "[$1]($(bagtent-conjure --touch)))"`, but I figured I could do a little better than that for an initial commit.

Also, after ralizing this makes tab completion for `bin/setup-shell` take one more character, I moved that script to `env/setup-shell` (scripts you have to source should be considered a different class of script anyway).

## Observation

The idea of "what if I had

I'm pretty sure I already thought of something like this in my tooling?

Anyway, the thing that I'm not sure would be so easy to convert into some kind of Helm-chart-component is having

But so yeah, I guess that's the goal: getting to a place where each feature of bagtent-sprout (or whatever this local prototype testbed is)
