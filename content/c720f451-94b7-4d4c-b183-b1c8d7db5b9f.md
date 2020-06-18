# The Useful Thing About Modeling Metadata as Deltas

Thinking about this now as I mark a bunch of email as Read

## user story:

what'd make me feel at ease would be if I could say to the computer...

show me all the email that isn't marked as read, not counting what I considered "read" on June 11th when I was feeling despair and just wanted to cheat my way to "inbox zero"

this allows you to make an email "double read" by introducing a second event that marks it as read, even though it's already marked as read.

you could also say specifically "show me all the email I marked as read, because it wasn't already so, at this point in time" (ie. "all from this transaction")

## on layers

I'm not sure if this transaction level exists prior art in JMAP or Kubernetes or what, but I'd have it so, like, a document needs X data to proceed with an operation... I guess you'd have one class that's "dispatch query" (like "at this time, marking all mail not already marked as read as read, since August 2015" or whatever), and another that's "operation resolved: here are the documents having this patch applied"

and so then I guess you'd have a sibling class, living either in a namespace next to the query dispatch, for the rendered state. Like I guess this sibling class is kind of maybe an IPNS deployment - is Pouch-to-IPNS a thing?

and now this is starting to get into the Next-Level Trapper-Keeper-Strikes-Back (maybe this can be "Project Tetsuo", as it is forming the model for a second Project Akira) that is, shall we say, a subfranchise of the Overall Document Model Interface Idea Notes Crossover Event

but yeah, you'd have one layer representing "abstract transformation" (ie. the query being executed), the next being "here is the precise operation", the next being "here is the result of that operation", and then I guess the next being "here is the application of that result", and so on for further levels of renderinf

and they can all live on the same document / object, in some sense

## also

deltas (and their higher-level definitions) are more cross-compatible to visualize in, say, Grafana, as events in a time series
