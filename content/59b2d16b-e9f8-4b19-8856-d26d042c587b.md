# common customizable extension base framework

say we store this customization in localStorage as YAML (we could even have it like Kubernetes where you specify the configuration in multiple documents for each class of configuration, using a Kind to separate controller responsibility or even RBAC access)

you could even have modes by using selectors and labels? or annotations? like, "enable this configset"

the thing is, this structure is mostly designed around making end-user extension easy? and, unlike Kubernetes, here that would mean an extensions-to-the-extension? is that a thing we really want to consider (epsecially considering the security implications given Tabalanche's scope)? We're not Violentmonkey

it'd make more sense to have configuration as its own PouchDB database, which lives locally and can maybe be synced/serialized to browser-provided synced storage (like your Google account or Firefox Sync or whatever - are there other popular backends? extensions? GitHub?) somehow

and of course, the thing about having them be in DBs is that you can use a filtered replication, or something like that (is it just a getAll and putting into another DB?), to migrate between config models / API versions (another great thing about modeling each tab as its own "document")

this also kind of simplifies the UI model for each group of settings? you just have to make an editor for one document

would also make conflict resolution easier: you can use text merge strategies on the serialization to propose a resolution with Ace/Monaco/whatever's Diff UI

anyway, bottom line, I do kind of like "each tab of settings is a document in a database" as a model

these settings can also be serialized out to an import/export interface - could even be merged with the Config dialog, with a "merge my settings"

Anyway, you can serialize Pouch's JSON documents to YAML for the editing UI

## ultimate idea of what I'm laying down here

What if I did make an extension that *was* extensible on this model? Like, you could merge NilPass's planned functionality with Tabalanche's in one extension. Or at least they could share a common toolkit/framework (I'm thinking HyperHTML + the aforementioned PouchDB, and then we don't need to bloat our dependencies any further)

Now, part of the appeal of React is that all its data plugs into one reactive bus... do you need that, though, if you've got Pouch for the model and HyperHTML for the view?

also, is this not just a solid basis for designing simple web apps anyway?

## the normal conceptual/scope bloat here

overlap with Binder

but more importantly, Joins the Brawl with Windowsystem Metabrowser Melee or whatever. How does this relate to a window model (also a concern within Binder), or undo buffers, or document view (like, if this is used for ffmpeg / imagemagic pipeline, versus straight-up image editing like Paint.net / Inkscape)

