# now leaving Cloud9

I'm abandoning my Cloud9 workspace (as I rather have to do anyway) to start editing these notes in [Gitpod][]. Here's what I'm abandoning, tree-wise:

- a bagtent checkout containing all the files I just pushed to the `wip` branch on GitHub
- a "dym" directory containing only this in a README.md (no .git):
  > # did you mean
  >
  > A Node module for suggesting the correct command for a typo.
- a checkout of `git-slum` that had no uncomitted changes
- a checkout of this repo, obviously
- a "testspace" directory I used for trial runs of the destructuring script
- the default C9 blank workspace readme
- the following file, as "path-bagtent.sh", which I would source in new  terminal sessions:

```bash
export PATH=$HOME/workspace/bagtent/bin:$PATH
export EDITOR="c9 open"
```

anyhoo, I think I've pushed this stuff out of C9 clearly enough

## observations anout gitpod

- pisses me off less than Atom
- they have a fun default gitconfig that uses a special credential helper built into the `gp` helper

the thing where the tabs don't shrink is frustrating

there's a REALLY annoying weird bug involving I think lines that have spaces? and the font size being out of sync with the cursor

[Gitpod]: https://gitpod.io/
