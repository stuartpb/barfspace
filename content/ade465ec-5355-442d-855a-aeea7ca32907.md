# Plushu noise

Coming off of my original Quest to refactor plushu: I started writing "Rethink how configuration happens. How would you want a tool based on Plushu to be installed?", and I realized I need to sit down and think about this.

(NOTE: I thought about this more after wrtiting it, the notes below just reflect my general direction, I'm now planning on taking it further)

## What should happen with this page

Each of these headings should get rewritten for clarity (ie. using current terminology), split off to their own notes page by topic, and then these notes can be listed on the main Plushu notes page, and integrated into the new tree for the refactor as a "Here are my dialogues and thought processes behind this decision" thing.

Aslo, a reminder that this plan should be kept as an artifact and logged with the Academy as a record of a kind of transformation/spontaneous organization that happened in the notes

## original content continues

So, generally speaking, what I'm thinking is that Plushu will run as a tool that operates according to the modules in the specified `PLUSHU_MODULES` (or maybe a `PLUSHU_MODULE_PATH`).

Another thing I'm thinking about this is that Plusku would really need to be pulled out... okay I've deleted some of the things I'm thinking, so I can get to that.

I guess the simplest way to put The big thing I've been thinking:

## Plugins should be renamed to Modules

I know, it's weird since the project's still going to be called *Plu*shu, but we're doing a soup-to-nuts overhaul of the weird Dokkuisms in this. The name's just going to have to be a quirk of etymology.

And that's the dumb thing leading to the big thing because it brings me to what's on my mind: Plushu really needs to be reigned in so that it's just the *core* of this. Right now, "PLUSHU_" is put in from of a *lot* of things, and there's this whole messy system for specifying module configurations that's basically turned into me reinventing package management (which I never wanted to do), and, yeah, yuck.

So, basically, I'm going to break everything that's currently in "plushu" but not part of "core" and move it to Plusku. Then, with what's left of what's in core:

- The plugins management stuff will be jettisoned, probably to Plusku, see next section.
- plushook is gonna get merged into Plushu, because...
- The Plushu command itself will no longer be user-facing. The one thing this really breaks (the `commands` script used by the Git plugin for Plusku) can be fixed at a level higher up the script (there was always a wrapper script around Plushu for SSH anyway).

(NOTE: this was rethought so that what's called "plushu" is now called "plumbus" - the "plushu" name was repurposed to keep the structure below compatible)

## "command", "subcommands", and "commands"

This is another awkward vestige from Dokku: honestly, these should work like long-opts and short-opts, where you're only expected to have one, and it's specified by name *under* your module. This would remove the one remaining significant-module-names aspect of the design, making it completely, cleanly independent (if you want to rename a module's commands, you make a new module with the commands renamed, rather than renaming the module), which would allow module names to be UUIDs / signatures / hashes for packaging or whatever.

Under the new format, "commands" is a directory of straight commands by name, and "subcommands" is a directory of directories. Scripts can live in either one of these directories: it's essentially that the "commands" directory lets you specify an overlay of files over paths that might be namespaces for scripts in "subcommands".

In other words, `subcommands` should really only be used when there's a script at the command name, for instance, a "domains" module might have `commands/domains` as well as `subcommands/domains/add` and `subcommands/domains/remove`. If there was no `domains` command (ie. `domains` were only used as a snamespace in the module), these would be appropriately packaged as `commands/domains/add`

NOTE: I didn't finish the last sentence above originally because I think I recognized what's so screwy about it, everything should just live under `subcommands`

oh, I guess the idea was because you could theoretically always have the "next level" of a command live in subcommands? idk, the whole "subcommand" concept like this is kind of weird magic anyway

## metahooks / metafilters / metacommands

This is a new concept. The metahooks/filters are scripts that will take the same arguments as hooks and filters, but will specify **what hooks/filters to call**, with what priorities. (This was based on a thought of mine that, for instance, if filters were being used to tint my screen Night-Light-style or apply some other effect, and I had a command that takes a screenshot, I'd want it to be user-configurable whether I'd want that screenshot to include my display filter or not.

This also introduces the breaking change that unnumbered scripts in a hook directory are no longer interpreted as having a number of 0 (if that's still a thing), but are now **not** interpreted by default, and are treated as hooks that will only be called if specified by a metahook/filter.

"metacommands" is just the new name for the old "commands" script, allowing for commands to be defined on the fly (though this is generally discouraged, as it suggests that either the Module Tree layout is being subverted in some way, or command parsing is being used for a non-command-name purpose.).

NOTE: after giving it more thought, the "non-numerically-prefixed scripts don't run by default" idea seems like a solid forward-looking decision, but introducing a "metahooks" system seems like overkill at the moment?

## coming back to the module name thing for a second

Actually, I think it might make sense to have module names be significant - as a way of **overriding singletons defined by other modules**, like `long-opts` and the refactored `commands`, by having module names give priority to *which one is picked*.

Even in the module-names-are-arbitrary-numbers-like-hashes-or-UUIDs model, this is still appropriate, as it makes it so there's a *deterministic rule* for which module takes precedence in the edge case where the

*(It might make sense to have a linter that reports any double-specified commands/subcommands that aren't explicitly shadowed by a line in some kind of "I'm intentionally superseding this command" file.)*

I'm actually thinking that *module significance* should be *ASCIIbetical* instead of numeric, due to the naming-scheme-agnostic thinking about their layout (the treekeeper can determine, say, whether module should have zero-padding: there's no need for independence between separately-developed modules as there is for hooks/filters).

UPDATE: What became of this section: it made me realize that commands should be treated like singletons, too - if this functionality is split off to a separate tool, then the multiplexing stuff gets handled by the bus, and you really only want one command calling out to that bus. (This was kind of an implicit flaw with the design of a lot of Plushu plugins, really: there was always one plugin that implemented the command, and all it implemented was a hookup from a command to call out to a very basic hook.)

## Unmooring "plugin management"

"Plugins" can remain the name for the system that can manage a set of modules for the user as an overlay for the system's default modules.

The plugins plugin will be maintained as a separate thing that is only expected to do light lifting, and have some configuration for your use case. In fact, it might even just get moved into its own project... since it uses the Git lifting from Plusku, I'll just let it be "Plusku plugins"... but since I have an idea for how another system might use it... nah, I'll keep it "Plusku plugins" for now, and I'll keep them in separate repos, so other projects can just import Plusku's repos for it.

WHAT CAME OF THIS: mushu

## the help system

I just remembered that `help` was plugin-name-oriented, too: I'm thinking now that it might make sense to have something like "help" and "usage" (docs?) directories under a module for specifying help/usage documents to be accessed by a help/usage module, as that would help structure things more than they currently are anyway.

reading the README.md for a module can be left to something like a `plugins:help` or `module:readme` or something like that.

another cool thing I just realized about all this is that it lets a "help" module implement three commands (eg. "help", "usage", and "docs"), and it doesn't even have to do some metacommand stuff, really I should have dome this three years ago

WHAT CAME OF THIS: modoc

## Namespacing event/stream/hook/filter names

I'm honestly thinking that event/hook/steam/filter names should all just take a "think globally, act locally" attitude, where they try to describe the nature of what the hook does in terms of any program that might interface with its modules.

This might be asking too much, though, in which case it might end up being necessary to use a C-like namespacing system where names are prefixed with the project they're a part of. Worst-case scenario, it might have to extend to an authoritative domain prefix (separated by underscore), possibly with a spec-revision suffix.

In any case, namespaces can be bridged by hooks/filters that translate into other hook/filter types (setting an ifdef-guard-style environment variable to prevent infinite loops from translation in either direction).

WHAT CAME OF THIS: Yeah, it definitely makes sense to have these scoped by project name - there's no other way to dimensionally agree on the definition of constuctions like "app", "addon", and "service", especially not if you're going to, say, have a project for implementing a Heroku interface living next to a project for manipulating

## Another thing that needs to be its own thing

The whole "tool for a user" concept needs to be a completely separate thing from Plushu, and, like, Plusku expects it to be used as a layer
