# Understanding Lua

A visual narrative of programming within the Dashseat metaphor

## Background

TODO: Explain how I had this idea back in 2009 or so, and how it went from VR idea, to comic book idea, to VR idea, to back to this

I had pwritten down a few ideas for this as a OneNote notebook, which I proptly lost / forgot about a year later. At some point between when I had the idea to do this as a comic book and when VR became a real possibility, I put together an outline for this as a pair of Trello boards (one for the introductory content, and one for the substance): this document, in its first iteration, represents a transcription and elaboration of the outline that was there previously.

This Markdown document represents a working "script" for an illustrator to work from. Code blocks would be presented alongside the panel: I'm thinking that pages would be wide, with half-to-two-thirds of the page consisting of panels, and the outside half/third of the page being a margin with code and editorial "comments".

Right now, the text isn't *completely* in descriptive form: some of the preface might be in full-page text (a la the preface from Understanding Comics). After the preface, I'll probably be working on making visual suggestions for the first couple chapters of introduction, then I'll be describing the panels for the actual Dashseat scenes in more visual detail.

## Preface

Everything I'm covering in this book is free, as in "freedom" - not only is it free of charge, but Lua's permissive license means you're free to do pretty much whatever you want with it (except pretend that you made it, or hold Lua's creators legally responsible for anything you do with it). The appendix (or something like that) will contain a guide to setting up Lua for yourself and following along.

That being said, it's almost better for you to read this book *without* trying to imitate it on your computer until you've read it all the way through: I'll be explaining a lot of concepts that aren't actually visible when you program. What you see in the margins is all that is *actually* presented: what you see in the panels is a representation of what that text *means*, so you can conceptualize the abstract concepts.

I'm using Lua here as a basis to teach these programming concepts, but many of these ideas can be applied to other languages (and almost all other languages' concepts can be derived from the base present in Lua). The concepts fit JavaScript, the language of the Web, probably better than any other language in wide use today. (They fit well enough that I'll remark on the differences when they come up.)

You may have been turned off from programming in the past by having been given the impression that general-purpose programming involves a strong command of mathematics, or "computer science" or "information theory" or some other such high-minded academic expertise. While certain *kinds* of programming can require these skills (for example, it'd be hard to program a simulation of bodies in space without a solid understanding of Newtonian physics), the fundamental nature of programming involves *basically no special knowledge of any kind*.

I'll touch on how to write code that *performs* basic arithmetic (addition, subtraction, multiplication, division), as well as some slightly more high-school math (exponentiation, trigonometry), but even if you don't know what these kinds of math are or how you'd use them, it won't stop you from doing anything that doesn't fundamentally require them. (That being said, sometimes math *is* necessary: if you're writing a program to determine how many apples you'll have if you give a certain number of apples away, you'll be hard-pressed to find a good way to do it without using subtraction.)

## Introduction 1: What is computing?

One of the biggest misconceptions around what constitutes a "computer" in the modern era is that the act of "computation" is something tangible- namely, that it's an *electric* phenomenon. (You could put something like the Weird Science "computer gets struck by lightning -> hot lady comes out" techno-woo here to illustrate magical thinking around the physical nature of computers.)

The reality is that "computer programming" is an abstract concept, and it always has been. In the 1800s, Charles Babbage designed a Difference Engine that would be capable of performing complex calculations through a series of gears, screws, and swords (yes, *swords!*) The Curta calculator is another example of a physical calculator from the pre-electronic era; before that, we had the abacus and slide rule.

Now, those are all computers for *math*, and I was saying in the Preface that we wouldn't be focusing on math. What about something else that a computer can do that's not immediately mathy, like playing Tic-Tac-Toe? Well, in 1975, students at the Massachusetts Institute of Technology [built a Tic-Tac-Toe-playing computer entirely out of wooden sticks and spools][Computer Recreations]: that same logic can be found in book form as the [Tic Tac Tome][], or even just on a poster of [this XKCD page][xkcd 832]. None of these are any less a "computer" or "program" or "artificial intelligence" than a "computer player" you might play the game against on your phone or desktop; they're all just different representations of the same rules, the same way as "2" or "two" or "II" all represent the same number.

[Computer Recreations]: https://web.archive.org/web/20141113163159/http://www.rci.rutgers.edu/~cfs/472_html/Intro/TinkertoyComputer/TinkerToy.html
[Tic Tac Tome]: https://www.goodreads.com/book/show/18490871-tic-tac-tome
[xkcd 832]: https://xkcd.com/832/

Now, this might seem like a needless rhetorical flourish, but it's important to note, because the origins of computer programming lie *directly* in these pre-electronic concepts of code. The earliest programming languages were theoretical constructs for papers: formal, unambiguous language, represented by symbols/punctuation for brevity, to express ideas. Possibly the earliest definition of a theoretical machine code was that used by Alan Turing (blah blah blah this is boring rewrite this)

(TODO: Describe [ALGOL][], and how Lisp was another theoretical language before someone went and made an interpreter for it)

[ALGOL]: https://en.wikipedia.org/wiki/ALGOL

The constructs of modern computer programming really solidified in the era of computer labs in the 1960s and 1970s. Many of the ideas in programming can have a kind of zen-koan-like abstractness to them: this is probably why [so many of the people who drove the computer revolution were hippies][SPACEWAR].

[SPACEWAR]: http://stuartpb.github.io/spacewar-article/spacewar.html

TODO: talk about Bell Labs and Unix

TODO: talk about the heritage of Windows, Mac, and Linux

## Introduction 2: What is Lua?

Lua is a project that started in Brazil

It takes from a lot of these academic languages

It has a real, efficient, portable (ANSI C) implementation

It's popular in games

From Tecgraf, a joint project between PUC-RIO school and Petrobras company

## Introduction 3: What is this book?

This book is a comic that shows what the language represents. Just like how a storybook might say "George put on the yellow hat" in the English language on a page with a drawing of George putting on the yellow hat, this comic has an operation described in the Lua language with a drawing of that operation being taken, in an abstract-yet-tangible world that corresponds to the world of things the language describes.

The syntax will use the longhand versions of all the actions I take, to make things easier if you're skipping around after the initial explanation, so I don't introduce syntactic sugar at some point where the underlying concept is fleshed out enough to explain the syntactic concept and then start using it without its meaning being clear. (That said, I might do comments above some of these saying something like "more simply, os.print")

## Opening: Introducing the context

In which I explain the world as it is, and how that's drawn

I sit in a chair in the middle of a void: this is the "Dashseat" I'm talking about. Sitting in the chair doesn't really correspond to any programming construct, it's just something I do. I suppose I could also be standing on some kind of platform, but even in illustrated form I'm lazy.

Values appear out of thin air, because of course they do. Don't beat yourself up over this, or you're going to start being unable to sleep at night trying to determine how a number is formed.

Operations are just actions I take: similar to how values just appear out of thin air, operations just sort of happen in closure between panels.

Immutability: everywhere a value is seen, it's the same value. (See [issue #3][] for more thoughts on illustrating / explaining this concept.)

[issue #3]: https://github.com/dashseat/understanding-lua/issues/3

### Value types

Numbers are abacuses, with beads representing the sign, exponent, and mantissa, along with an engraving of the decimal representation. (See [issue #4][] for more on the representation and explanation of numbers.)

[issue #4]: https://github.com/dashseat/understanding-lua/issues/4

Strings are cards with the string written on them (or maybe it would make more sense to describe them as *banners* with the textual representation of the bytes on them, and the 8 bits of each byte on the back of each character).

Booleans are represented as [lightbulbs][La Verite], with a dark bulb representing `false` and a bright bulb representing `true`. Moments of boolean conditional analysis - where boolean conditions naturally occur - show the true/false bulb appearing over my head. If I don't grab it, it technically doesn't refer to a real value, but yeah.

[La Verite]: https://en.wikipedia.org/wiki/File:Truth.jpg

`nil`, the absence of a value, is merely represented as empty space. Assigning a value of `nil` to something is represented by taking a deep breath and blowing it away.

Tables, I'm thinking, will be represented as an end table, with a large "keyhole" where indexing keys are inserted to pop out the drawer for that key. (I'll be going into a little more detail about how tables work once I've finished covering the last few types.)

Functions are comics. (See [issue #7][] for thoughts on the representation of functions.)

[issue #7]: https://github.com/dashseat/understanding-lua/issues/7

Coroutines are a little diorama of the Dashseat stage, and we're not really going to go into them. (See [issue #10][] for thoughts on coroutines.)

[issue #10]: https://github.com/dashseat/understanding-lua/issues/10

Now, there's only one type left. That might sound restrictive, although within Lua you'll find you can actually represent pretty much any concept using the primitives I've just described. However, there are things that exist outside of Lua, and that is what the last type represents. Userdata - everything that falls outside of these primitives. (See [issue #9][] for thoughts on on how userdata may be represented visually.)

[issue #9]: https://github.com/dashseat/understanding-lua/issues/9

## Tables, Part 1: K -> V

Tables are containers. The name "table" refers to the concept of a "table" like this:

<table>
<tr><td>foo</td><td>something</td></tr>
<tr><td>bar</td><td>something else</td></tr>
</table>

(TODO make that example reflect the actual keys/values our first table is going to look like instead)

Tables like this in programming have two columns, the first one being the Key, and the second being the Value. (Further columns are generally handled by having a *second* table as the value: we'll get to that in a moment.)

Any value can be used as a key (not counting `nil`, the absence of value)

Strings are a popular one, let's do those. (I could arguably do arrays first, but I think it works better if we introduce tables as abstract K->V and then teach how to use them for arrays - teach the general case, then a specific case. That way, minds don't get blown by "what? Arrays can't have words!")

Right here would be a convenient time to explain the string indexing syntactic sugar: in fact, I'm reconsidering that bit I wrote above about not using the syntactic sugar in the code (I think I'd rather include a comment illustrating the *long* version of the syntax, which would generally not be used, but is useful for understanding why a basic thing looks different).

Let's stash some figures in a table. (Here, I'm thinking it might make sense to have a table for, say, *the book itself*, where we use strings for which property we're setting, and for the values: I think this is what Programming in Lua itself does.)

See [issue #11][] for notes on the first table definition

[issue #11]: https://github.com/dashseat/understanding-lua/issues/11

## Locals and assignment

See [issue #13][]

[issue #13]: https://github.com/dashseat/understanding-lua/issues/13

## Conditions, comparisons, and primitive operations

Equivalence

A quick aside about type coercion: when Lua performs a number operation on a string, it tries to convert it to number before raising an error (so you don't have to worry about whether something that reads strings has parsed it to a number for you). There's no real way to turn this off, but you can use `tonumber` and `tostring` to do the conversion intentionally and make this explicit when you want it. (Those functions come from the environment, which is explained in chapter whatever)

Addition subtraction, etc

Exponentiation

Modulo

And, or, not

See [issue #14][] for thoughts on bitwise operations.

[issue #14]: https://github.com/dashseat/understanding-lua/issues/14

## Tables, Part 2: Arrays

Let's make a list of things (I don't know. Order that some computers came out?)

Say you want a numeric list of things (an "array"). Each number is an index.

(this could be covered a lot more eloquently by illustrating a `<table>` table again, geez, I'm just copying directly from my bad Trello draft stuff right now)

Add index 1, 2, and 3 to the array (Here's where that array assignment comes in)

Length operator

## Constructing and Calling Functions

See [issue #7][] for thoughts on how functions should be introduced.

## Garbage collection

See [issue #15][] for thoughts on an aside about garbage collection.

[issue #15]: https://github.com/dashseat/understanding-lua/issues/15

## Functions and Outside Scopes

See [issue #16][] for thoughts on introducing the concept of scope: this is where this subject was oriented on Trello, but now I'm pretty sure it could be placed in a better spot.

[issue #16]: https://github.com/dashseat/understanding-lua/issues/16

## The Environment

So, what if you look for a name that isn't in your scope at all?

it falls back to `_ENV` (a table in a little spot left of all the locals that I'd earlier said I would get to later on)

`_ENV` is a table that contains your "environment" (Technically, what I'm going to talk about here, the stuff that's initially populated, is more `_G`, but I consider `_G` more of an implementation detail than a language feature)

`_ENV` works like a local, and is essentially just a local that's always there

You can delete `_ENV` if you want to enforce locals-or-error

## Modules, Standard Libraries

What they do, what they are

You get them by calling the `require` function

They're implemented as tables of functions, for the most part

Modules such as the standard library can be written in C

## Basic I/O

See [issue #18][] for thoughts on basic I/O.

[issue #18]: https://github.com/dashseat/understanding-lua/issues/18

## Loops

See [issue #19][] for thoughts on loops (namely, how they should really be covered a lot earlier than this).

[issue #19]: https://github.com/dashseat/understanding-lua/issues/19

## Using these basics together

## Recursion

## Upvalues

## Multiple returns and varargs

Creating sprintf

## Metatables

## Coroutines
