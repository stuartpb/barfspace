# The Plushu Refactor Plan

TODO: reconcile with [How I'll Refactor](td5e9-5vzv8-cy8q7-cg0xe-k6f4j)

Here's a restatement of [this rough note from early in my revisiting of Plushu](nqj6b-v2kan-0d8ap-nex9y-a6a87), partially from memory and partially through further thought given since those notes were written:

What's currently called "plushu" with a bunch of unclear delineation (burdened by weird unnecessary assumptions about its environment that kind of melted on from being a lift from so much of Dokku) will be split up into a few distinct core projects:

- "plushu" will be reduced to *just* the command handling interface (PLUggable SHell Utility), since that's the part that's distinctly shell-attached.
  - Also, it runs by different module rules than the bus: only the *first ASCIIbetical module* owns a command, rather than all modules cooperating - this allows for modules to "shadow" other modules by prefixes if necessary (this is more like Dokku's original design).
  - It will pull from the `PLUSHU_MODULES` directory specified in the environment, or it will fail: plushu is designed to be wrapped by something like shelly or a standalone script that sets this root to the packaged tool's asset tree (which will also set `PLUMBUS_MODULES`, for many applications of plushu, and `MUSHU_MODULES`, etc.).
    - Wait, I was saying the variable would be `MODULE_TREE`, wasn't I? Maybe it can have overrides?
- The "plushook" script will become a new project called "plumbus" (PLUggable Module BUS), which will have two methods, "event" and "stream".
  - similarly, this script requires that the `PLUMBUS_MODULES` environment variable be set for context.
  - plumbus will be a static script, not Plushu-based.
  - Event/stream names will become namespaced by originating project domain akin to how Kubernetes' stuff does it.
    - At one point I had the note that namespacing would be more of a thing for drafts, but as I realize that no application is going to monopolize the namespace (as the components are getting broken out), having a namespace for the "project" makes a lot of sense.
  - Making plumbus a separate script also lets stuff like having it be called directly by systemd be less weird.
- All the Heroku-ecosystem stuff will be renamed "plusku".
  - All the commands will probably get collected into one module, since Plusku's commands have always been pretty abstract and left all the heavy lifting to hooks, so the interface is effectively unopinionated
  - Hmm... just realized that whatever wrapper combines Plushu and Plumbus will need to set env variables for both
  - All the phases currently interfacing with Docker will be reimplemented with new modules
    - I'm thinking all the "Docker images managed by loose files" hackery can be known as "dorku" going forward, since it's such a dead end and I'm not gonna maintain it, but it's worth demonstrating how the new world is still theoretically compatible with that more-simple implementaion
- The plugin-management stuff can now be known as "mushu" (MUtable Shell Utility), and will likely not be packaged in distributions of plumbus/plushu-based systems.
- The documentation stuff like the "help" command, which can get expanded out to other commands like "usage", can be turned into a dedicated module called "modoc".
  - There are a bunch of other aproaches to doing help, too, and this allows those to be swappable a bit more smoothly.
- The user-as-shell-utility kit will be cut out and renamed "shelly".
  - All the Plushu stuff that expects a dedicated user to exist needs to redesigned
  - stuff jumping off the PLUSHU_ROOT or whatever the env var for the user's home directory was should be remade to use its own directory, which can default to something like PLUSKU_STATE_ROOT and PLUSKU_DEFS_ROOT or something like that, idk
  - actually, defaulting to a (dotfile?) directory under the user's home is probably a sensible default - but hopefully state can be kept in something like files generated and kept in a helm registry + the Git repo
  - Now that I've rememebered the `MODULE_TREE` thing, there's a much clearer technique here: Plusku stuff can default to... using the same module tree for hook behavior and addon/service specs? hmm I think the idea that they can be compatible repo tree formats is fine, but I think this stuff probably shouldn't use that env var as a basis
- Consider breaking the project into multiple organizations for each component as this happens.
  - Like, most Plumbus stuff doesn't need to care about Mushu.
  - And the different families of module will definitely want to live separately.
    - Like, the modules for a plushu Git server (which you'll also want to make a user for via shelly) don't necessarily make as much sense run together with a heroku-toolbelt-like API in a world where most of what the git hooks do is create stuff you then manipulate with something that speaks Kubernetes APIs to the cluster
    - Especially not when you can insert them as separate Pods/Services in a cluster, with their own names and NodePort/Ingresses

## A note on the common design to these

Between plumbus and plushu, and maybe around mushu, it might seem like it'd make sense to allow a *search path* for modules, instead of a fixed directory.

However, my position is that, if you want to merge functionalities, you ought to figure out a mechanism to do so - either some kind of configuration to mushu that combines multiple loadouts, or you've got a cron job syncing in CI, or you've done a union mount, or, you know, whatever. There are a lot of solutions, but they're all out of spec: plushu/plumbus already does an elaborate enough search

In fact, I forgot that I wanted to call the umbrella for this concept "Module Tree", and make that the name basis for all of this. TODO: look for notes on that, it's late and I'm falling-down tired
