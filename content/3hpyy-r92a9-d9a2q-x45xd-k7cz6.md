# literate programming notes

[Docco](http://ashkenas.com/docco/), that's the one I was thinking of

https://rtomayko.github.io/shocco/ seems interesting too

## Dang, I think I got lost here

But yeah, wasn't I making some notes on Literate Programming, or Literate PICO-8? And how fenced blocks ought to have directives for append/prepend, as well as language?

might have been thinking of [this literate blob](bjst3-9j481-m0be7-2epd5-q2p2p) (which I think is too high-level: the use cases can inform this better)

And how that starts to intersect with a Notebook system, I think I never got around to drawing the aconnection - but I started looking for a system that presents its content in some kind of previewable window

## finding

this is definitely a bit in the [Thread Jam](5e1y8-03bex-6w9e6-7pq56-78ece)

anyway, I just searched for "Literate" and this appears to be the first mention of it in these notes: So here are some more literate programming notes

https://github.com/vijithassar/lit - a shell-script-based-simple preprocessor that just comments out all the lines that aren't code blocks

oh look someone made a script that works with indented code and not fenced code: https://github.com/spro/lit

seems to me like an ideal version would support both

hmm, I wonder if cassidy williams might be willing to give up the org name?

## the lack of fanciness

the thing about preprocs like that is that they can't present the code in *literate order*. I was reading somewhere about how that's a core part of the Knuth model, being able to group parts of code from different places into the text

https://github.com/zyedidia/Literate seems like the most solid intentional continuation of cweb?

[A Straightforward Literate Notebook Tool](kh2mj-0arwq-80865-g7np2-xpt42) was built by me trying to make CWEB out of Markdown, not remembering how CWEB worked

## forget about the fanciness

nah, I think I read someone say somewhere, these days we usually have compilers to avoid the kind of thing where you'd want that much arbitrary structure. really, if there's a level where you really need that, I think it's up to you to introduce your own file-recomposition strategy: a script with a bunch of `cat` commands after `lit` isn't too outlandish

or maybe it's just a new approach to in-file commenting, and the programmnig cart still leads the narrative horse. I think that's fine, and, really, a way to help shape the maintainer's thinking, and if your programming language doesn't make sense in some kind of order, that's your problem.

[oh right it was in lit's readme](https://github.com/vijithassar/lit#pedantry)

## update

I know JupyterHub was one of the things I was thinking the Notestack should set up in Stubernetes

## More notes in this vein

- [Globerlay-to-Kind-to-Controller Model](4ks8w-q4850-vpazs-wcca3-kgn4v)

The topic is generally congealing around the Thread Jam

## a new literate approach from thoughts while developing Stubernetes

this is a plan extending out from the structure my repo naturally took when I rolled out [new gotk-oriented BASIC-prefixed repo style](f509f-7z72m-yh834-6xk45-07q59)

- [Literate Kubernetes Deployment](wmksq-ayt9a-cs93v-th9v1-96k05)
- [Code Narrative Order](ae5d3-g6gtd-ed90v-bd7p1-k7g2n) really interfaces with that "forget about the fanciness" note above; it's better to start introducing intentional order at *higher* layers, truly
- [On Literate-YAML-to-Commented-YAML](8ykrb-hvqgw-8r8qr-pgncs-4t4mr)
- [Literate WYSIWYG](7tjeq-z4sw0-s59vj-dp9mw-2ywg8)
- [Acknowledging Files Not Literate](0veam-tt84w-3tatf-zrcpr-nh60q)

## odd stray thought

[Hacker News notes](https://news.ycombinator.com/item?id=8184909) that this offsets line numbers and stuff?

So, a cool translator should convert to comments, and also make sure whitespace is reflected so column positions are the same? Or at least have these as options

Like, what'd really make sense would be to translate to a version with as close character positions as possible to the original (see note about not being able to break mid-scalar in YAML)

like, especially if you're using source maps anyway

The comments there that talk about Org Mode really fall into the Pipeline Idea Cluster
