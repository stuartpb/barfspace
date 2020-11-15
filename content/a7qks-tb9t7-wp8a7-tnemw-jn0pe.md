# module tree tool thing?

this is kind of an insight into the design principles of Module Tree architectures

so, a thing I'm thinking is you could have one tool that sets up an environment of implementation hooks based on an autoconf-style per-functionality-available-based configuration determined by tests (this is like Compiling, in a way)

then you have a second layer of scripts implementing functionality against these separate implementations - they keep the bundle of all code/data for whatever implementation available, but only one implementation (containing plumbus hook/event-handling scripts) will handle

and if you want to, say, try updating your architecture, you can do that by bootstrapping into a new autoconf-test-generated implementation hook tree

## pondering existing/planned implementations

I guess what this is getting at is that you have a layer that sets up event handlers for some events that can have a number of implementations for the same general interface, and you're expected to have one at a time (and maybe even they don't both fire, lexical sort is where the winning script is picked from)

Ooh, wait, is this the idea for streams, if piping is too complex? Or is it a flag on those executors? (I think the latter, though it could be argued that they're an entirely different class of script from hooks/filters in that case. ehh, JS has the same problem and They Get By)

oh, I guess they are in a different namespace - this can be the function for un-prefixed scripts, and that's what the "only pick one" 

hmm, thinking about it now, it seems like this might be a dangerous pattern?

actually, though, doesn't this fit as a function of the planned Execution Chain command type? Like, the idea is to pass your stdin down to the next command in your arguments, but you can choose to ignore that.

it's kind of like routing in Express, where you have the option of tail-calling into the next route via a given next() callback
