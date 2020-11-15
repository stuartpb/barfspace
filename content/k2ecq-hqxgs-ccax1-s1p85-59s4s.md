# kubernetes desktop metaphor dashboard

I mean, fuck it, they're namespaces full of documents - why not just admit it's a filesystem and go full Plan9 with it?

each cluster is a desktop. each type of cluster resource is the top-level folder

each one opens up a different-looking window, but they all present a vaguely finder-like MDI

Heh, unknown resources in the browser could use an icon derived from which vendor's namespace they come from

The My Computer of each cluster is, of course, the "namespaces" folder

each namespace is persented as a folder full of documents: each class of resource lives in this folder, but they can optionally be bubbled into groups, which are represented as a folder with the generic resource type icon on it

I'm thinking resources should have rules for deriving icons (like pulling them from something like the docker image registry user's avatar), which can only apply in configurable conditions, and can also be specified on a resource by some kind of special

but a thing I'm realizing is that icon compositing has gotta be a thing, maybe even several levels deep: think, like, the third pod of the backup service for the mysql component of the beta deployment of the skunkworks bugzilla.

same goes for namespace wallpaper. Maybe there's a document of type "NamespaceVisualTheme" or something that, when you click it, it modifies the namespace's window's look (and of course you could have something analogous at the cluster level). or, really it should just be annotations - is that fine?

this could be a cool way to, say, visually distinguish the system namespace

opening up a document I think would present a tabbed Properties-dialog-like view, with the last tab being "Raw YAML", and there being a toolbar / icons for "Save" and "Revert"

the Namespace view would also need New Namespace, and each namespace would need New Resource(s), a menu for inserting Manifests

I'm even wondering if "Apply Helm Chart" might not make sense as a, like...

like, what if there's an "Actions" level of plugin? that lets more complex resource interactions be clickable.

this is starting to sound like cpanel

## non-cluster things?

Like, Helm Charts don't live in a cluster, right? They live in a registry?

But, like, installations do...

This isn't a terrible idea, though: a filesytem-style view of registries as well, maybe even allowing for drop-in importing for images/charts/etc!

this would be the desktop level above Cluster or Registry...

and I guess you could have other types of "Desktop", or "sub-desktop" or whatever you'd call this "System Representation Metaphor"

this starts to get into the "Wayside" [Workspace/Pod Manager](64g19-6195p-93apg-pnxte-2tpg8)

## another angle: what's the user case?

well, this is for kateskit of course

But, like, shouldn't the scope maybe go higher, then? Like, there's a level for Helm Apps before the user is even concerned with Jump Into the Cluster Resource Definitions? Like, needing to inspect your cluster is kind of like needing to open task manager, or the registry editor

## oh, right, I remember what the "other angle" I wanted to say was

What about cold storage / filesystem?

Like, a thing I was thinking this would be cool for would be:

- packaging resources into manifests / Helm charts by dragging them to a backup folder

this starts to turn into a broader [filesystem metaphor](9vzhy-yr8cb-6v87n-wp4b8-m7v0v)

## the big thing about this

I like this because it kind of makes the Kubernetes Dashboard less scary. It's like, I know desktops, I can work with this, it's Mac-easy

[Better Kubernetes Iconography](an26z-0g916-jv8zm-4mthx-ds280) explores more ideas on that front

## overlap scope point

This starts to blend into Binder, which starts to turn into the Windowsystem Metabrowser

I especially start to think about scaling / zooming / laying everything out in a flat space - have some kind of setting saved to the "desktop state definition" or whatever client-settings-thing for how much space each section should take up, like `flex`

but, like, you could also have arbitrary windows into arbitrary points in the systems. like, one window is into one namespace in the cluster, and anothers to another in the cluster.

and it'd make sense to make this all part of one big tree

But yeah, it's maybe worth considering as an "app level": the "desktop browser", which can be embedded as a component or invoked as a frontend, but allows for configuring whatever "use this driver for this window" scheme, where the "basic classic folder style" widget can take its cues from

and yeah, this could in turn replace `pocket-home`, depending on how much this starts to intersect that project

i feel like this classic-tree-browser concept could be called Deku, but I feel like that's almost certainly already been done

https://demo.os-js.org/ (which should be moved to Prior Art at the WSMB) is interesting - I'm curious about its widgets, and its System dialog is how I'm thinking many levels of resource navigation could look (not so much "tabs" necessarily, as that "tab" layout could be expressed with some of the "tree hierarchy" control layouts, which is a whole model I haven't really writteb about because it gets strange-loopy fast and I'm not sure I can articulate it clearly at any point)

I think Awesome might have the kind of nav hierarchy I'm thinking
