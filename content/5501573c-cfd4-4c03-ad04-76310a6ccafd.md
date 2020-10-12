# October 2020 Plumbus and the futility of tree trickiness

Okay, so, I've decided: Plumbus will just take a directory and execute the scripts within it in a certain fashion (so you don't have to worry about hitting the command limit)

Or maybe... yeah, okay, back to the let-plumbus-sort-filenames approach.

Bottom line, though, there's no need for the "module-tree" trickiness: let your project decide where it'll look for scripts, and let it put them in the filesystem as makes sense. Like, maybe it's under /var/lib (that's a popular place with the Kubernetes set), or maybe it's under /etc/something. Or maybe it's the working directory! Or some arbitrary tree off the root (like `/pluskube.com/`)

I'm cool with the idea of every project just putting hook directories... I was gonna say "off the root"? but like...

yeah, honestly, I just want that to be the convention that takes off: projects just start putting their domain names in the root of a container

but that really forces it to be within a container...

okay, so we're back around on the carousel of "Have a variable that dictates where the root specifying the module's behavior goes"

...aka `PLUSHU_ROOT`, because you might as well have this per-project-namespace. Only issue is that you can't use DNS names for env var keys as cleanly as you can file paths.

You know, I kind of feel like, fuck it, why not use the working directory? It's not like this is expected to be much of a thing for user utils - and, where it could be, those utils can do hooks

and that makes it a user's home directory by default in the classic "SSH host" approach.

So yeah: in the new Plusku model, each project defines its "routes" as names under the working directory. Or... fuck it, why not ~/.local?

Because the local directory doesn't need ornamentation to run via plumbus like `plumbus

Actually, looking at that, yeah, fuck it, I'm gonna keep it directory-oriented. Maybe include an option to manually specify files, but, like, that feels liable to be fragile - and it means we can safely treat the first option as a route, and not need a separator to pass options to the called scripts!

So there's

- `event`
  - "listener" hook scripts that handle the event's actions ("handler" really is the best term here)
  - called in series,
  - with a common stdin/stdout
    - each hook having inherited the file descriptors / streams of the parent process
  - data is passed via args,
  - hooks can communicate with previous/future siblings by leaving artifacts in the filesystem
    - since execution ordering is assured, them being called in series (synchronous execution)
- `pipeline`
  - "filter" scripts that process a stream
    - may have some "handling" side effects, if this calling convention makes sense for that
      - ie. if it's a stream to handle, not transform, every script will end `cat`
    - are called in parallel to process a continuous stream
    - data is passed via args, as well as the stream
- `relay`
  - each script is expected to continue into the next with something like `exec "$@"`,
    - only one is called directly, each successive call is the responsibility of the first
    - passing is done via file descriptors / exported environment inheritance
      - not by arguments: arguments are successor scripts only
    - this is the one that has dynamic characteristics
      - priority reordering/preempting/etc is done by changing the list of scripts passed to the next
      - so, for example, if you had something where you only want one script to handle it
        - this allows the first script to go like "nope, bail" in only a few conditions
      - this could also be used for the "include significant identity in the filename" concept
        - since it's the only kind where the filename is visible outside plumbus
      - it could also conditionally call the next one

## what this massively helps and simplifies

we don't need to invent a pseudo-packaging layer - that's what the build process, containerization, kustomization, configmaps, and a whole bunch of other layers on top of this already accomplish.

## so what I'm thinking

- working directory (the context for all commands)
  - `plugit.plusku.org/`
    - so, around here, I'm thinking you wouldn't get fussy with it - only have two directories that represent the two git commands:
    - `receive-pack/`
    - `request-pack/`
    - or whatever
    - and then you have another layer that can dispatch events etc.
  - `plusku.org`
    - here I'm thinking we might need a distinction layer for clarity:
    - `hooks/` for `event` handlers
      - actually, `handlers/` seems llike it might be better
        - as this indicates they each get their "hands" on it, in turn
        - and that, if there aren't any, nothing happens
      - what about `steps/`?
    - `filters/` for `pipeline` handlers
    - `runners/` for `relay` handlers
    - don't forget the underlying names should end with `_v1beta1` etc
      - or not? only really necessary
      - this is the whole point of the domain-name-for-project convention: if you want new names, do a new domain
      - projects can feel free to do the one-domain-per-api thing as much as they want
      - they honestly should

I like the "event handlers, pipeline filters, and relay runners" naming triad

## more on "versioning"

I think the best way to do this, and this is basically what you see with Kubernetes, is to put your API on a DNS name to namespace it, and then, if you decide to have a new API, just give it a new name. Under this logic, I figure you might as well put "v2" in the domain if you want to, like, just be clumsy like that

but, like, also, `v1beta1` isn't a bad way to

## files that are ignored and errors

- directories are ignored
- files with no numeric prefix are only ignored if they start with a dot
  - this feels like it'd avoid most of the legitimate reasons to not
- files with identical numeric prefixes are an error
  - this is a feature - it allows for "conflicts", if two different sources want to stake a claim on one part of the sequence
    - see, using the same full filename allows for overrides, if that's what you want
    - but yeah, forcing number collisions to be errors provides a natural conflict mechanism
  - it also avoids "we changed the name of the file and now the behavior is different"
  - remember, the number space subdivides infinitely
- files with a prefix that ends as a dot (eg. `25.dontdothis`) should be a warning,
  - but I feel like they're in "let's call it an error" strict territory,
  - under the logic of "prohibit anything that could potentially cause other implementations / tooling to have trouble"
  - same goes for filenames ending with a dot, if there's no suffix (see below)
- should we even enforce the underscore-separation?
  - I kind of want to.. I need to check the dot-versus-underscore in the string-sort case
    - hmm... so, the underscore one would always sort last, so dots would be about preempting? hmm I guess
  - but yeah, I don't see any reason not to, at least in the "beta"
  - the one thing, I think it should be okay to just use the number - just, if you have further characters, they need
- non-executable files... are an error, I guess
  - this'd definitely be an "open issue"
    - each of these should have error messages pointing to a github issue to speak up if it was intentional, for you to state why it should be allowed

## ignorelist option

Ways this could work:

- ignore un-numbered files
- ignore files with a certain pattern
- ignore specific files

The third one could be used for debugging, I guess? But like, if you have that kind of instrumentation... where are you inserting it that's so useful? It seems like that would be more useful by - I mean, really, just moving it out of the directory and into a shadow "disabled" directory! I mean damn that's how plushu did it

## onlylist

You could also have an "only include files with this extension", but, like... why

## idea: the "COULDDO"

it's like a TODO that you have no intent to do until someone can make a good case for why you should, like "have an option to ignore unprefixed files"

It's a YAGNI thing

## so anyway, "new plushu" for a second

new plushu treats `PLUSHU_ROOT` like the old "plugins" directory, and it's invoked as `PLUSHU_ROOT=/path/to/my/command/tree plushu $@`

## reflecting on a major break from Dokku

Dokku had this idea that every "plugin" should contain its frontend and its implementation.

In Plushu, each plugin is designed to be so single-purpose and lightweight that that would be nonsensical, so the "hooks" directory, and any semblance of it, is no longer really necessary

indeed, I don't really think these systems should be intertwined in the same tree

however, I do like putting `25_` type prefixes on things

## visualizing event vs. pipeline vs. relay

you could have it look like boxes of tape? ie. the waterfall where "the tape" (representing stdin) goes through the pipeline top-to-bottom, but the event-handler version has a horizontal / staircase

so, the thing is, if you want every part of the thing to have the input, a pipeline that echoes its input is the simplest way to do that. if you want it but also want events' guarantees, you have to make a temporary file or something. if you really want to make a buffer, turn it into a relay where the first item is going to pass stdin to all the later options, but this seems like it could have been args on the event
