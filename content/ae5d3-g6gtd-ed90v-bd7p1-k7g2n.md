# Code Narrative Order

continues from [Literate Kubernetes Deployment](wmksq-ayt9a-cs93v-th9v1-96k05) and description of the one-document-per-file rule

also starts to overlap a lot with Plumbus

this doesn't have to be a hard and fast rule and, indeed, multiple YAMLs could be on one page, if I felt like that. but I feel like there's space to follow this structure narratively: it's also more useful for, you know, following the documentation

but yeah, at a broader level, every language can benefit from a number-prefixed naming convention, really! If you want someone to understand your code and you're in a namespace where you can pick your own names - like, putting these number prefixes on your files helps to underscore that this is *private implementation level*. (and I'm especially thinking of the Compiled Languages like Go)

but yeah, the number prefixes (which can also be stripped for the build, so your code doesn't include the number prefixes)

it depends on build pipeline whether you want to use leading zeroes: like, the Plushu chain did a sort on leading numbers, but a lot of stuff is gonna go through a pipe sorting them purely by string, so

## a side note on numbers and links

well, links and, ultimately, names in the post-literate render processing compilation phase, though

link IDs should maybe not include the numbers, ie. urls strip those off? this would make them "cool URLS" that "don't change" if their positions are renumbered

you could have it so the source can point to the "assumed" number for the file, but some kind of correction-bot will fix the number if the number is changed but the name remains the same

## another use for the numbers

You can use the numbers for short links (with the understanding that these numbers are only valid within the specific release)

so yeah, dang, you have

you can do something similar by adding numbered anchors next to the headings, which have their slugs, and that can be used for "short anchors" (and each heading can be identified by number like this)

but yeah, you'd only have the numbered headings in the non-master version... which would be the only one to display section number short-anchor links before/after the heading

we can also call what I mean by "non-master version" a "frozen version". like every IPFS render would include them... in fact, it would have a link to the PIFS on the heading number, and a link to the IPNS on the section link. maybe. depends on Beaker's redirect behavior. oh wait beaker is dat-stack only rofl

## by-section indexing versus headings

a thing to remember is that there are two kinds of numbering within the page: which code/prose zebra-stripe you're on, and which heading you're under.

so you could start each post-code section with an "sX" (where X is a number) for "section" or "segment"

ah heck, why not just number paragraphs at that point, versus code elements. just have every element use its name and number as a default id. there's gotta be a remark for that

## the concept of "numbering space" is like namespace

I mean, really, it is, but with deeper connotations in a system like this where the order can matter

## another thing I've been thinking

What about letting numbers be hierarchical, like versions, and within a directory you can use that for whatever ordering syntax you want? because of where `.` sorts relative to digits and `_`

I think it's bad practice, at least in the Kubernetes context. if your numberspace is that bloated, the problem isn't to introduce more numbers, it's to break it into smaller chapters, you're allowed to do that

or, idk, maybe you're not. something to consider on anything that reconsiders numeric prefixes, I guess: anything that strips should expect as many .s in a number as possible. and it's sorted numerically where `.` is the field separator, and `_` is the prefix separator

## on collisions

I was thinking they could be recognized specially in the side view, and presented as a different UI like "next, either one of these", or at least a "skip ahead" to jump to the next number?

but, like, looking at that hierarchical-number approach, I'm wondering if it might not make sense to have it so you always have to specify a sub-order, and if there's a collision that can be caught as an error, so if you have two systems that want to be intercompatible, they need to figure out which one is going to go first
