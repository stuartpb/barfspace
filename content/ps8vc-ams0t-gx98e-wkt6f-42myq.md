# How the notes.stuartpb.com Repo is Structured

The way I figure it, every [bagtent][] repo is a little different, and not everything lives in the bagtent spec (if I ever get around to writing it at all, that is).

[bagtent]: q80bh-jwx0p-rfbtm-09j3w-2vnr3

This page is kind of a legacy appendage from when [Lean Notes][] was first destructred (creating the first "bagtent" repo, in theory) and imported to this repo under [Project Akira][]. The section of Lean Notes' README

[Lean Notes]: y063t-8w892-wm8ty-pg17v-k8gwm
[Project Akira]: vbfwb-sefpv-wx8hg-5wts5-s3zmc

## the content/ directory

Everything lives here, in Markdown files with arbitrary UUIDs. For more about this, see [bagtent][].

There used to be more in this repo, but [I cleaned it out](rpwj6-q22kf-c29er-7ds0p-b4p8e), and [I don't think it should have much more for now](pbddw-54adh-m39zp-sfrtt-420cc)

## the bin/ directory

Here's where I'm putting a few scripts that make managing the bagtent easier.

There used to be more, but they've been split off to their own respective projects: there should be a script in there that checks them out as sibling directories.

## the root Markdown files

- README.md is rendered as an index on GitHub Pages, and when viewing the repo on GitHub.
- CONTRIBUTING.md similarly interfaces GitHub documentation points into the notes mass.

## IDE files

- the .gitignore has some old rules for Cloud9 dating back to when that was a thing.
- the .theia directory contains data for GitPod, which is how I primarily edit these notes now.
  - THIS IS AN EXTRAORDINARILY OLD LINE, IT WAS TRUE FOR ABOUT A WEEK IN LATE 2018

## etc

- CNAME tells GitHub Pages what host to serve the site on.

## possible future changes

For more ways the repo structure may change in the future, mosey on down to [The Notestack Engineering Core](63p2w-vj7t2-baaa8-r76as-nntma)
