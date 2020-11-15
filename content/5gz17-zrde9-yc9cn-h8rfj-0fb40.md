# Utilizing Databases

[Background image](https://trello-backgrounds.s3.amazonaws.com/51901b73c30c061842001c4b/04d519a1f36ff9e144a58ad8a08ea082/db.jpg)

## Previously

How to store and work with data is necessary for [Implementing User Accounts](rt4ha-04jzn-wm9m5-6q6kc-sqfcm)

## Why build on a datastore?

Why program against a remote server instead of just using your local files (and then letting some networking thing handle making that distributable)?

If you build on a database API instead of a raw filesystem, then your app doesn't have to run on a node with storage, or make some kind of high-overhead NFS connection/replication scheme to network its storage.

It also lets you scale out.

Or, as I put it in 2013:

> Why not just write everything to the filesystem on the same server as the app?
>
> for all the reasons 12 factor is good
>
> you can swap out your code server without touching your content, and you can add more code servers
>
> You can have one server handling all the memory and disk juggling, and your app server focusing on putting things together while it waits

## meta note from original trello board

I think this was about how the rest of the notes from the original board were about specific datastores:

> It should have some best practices on structuring databases, like how internal UUIDs with a human-facing key that can be changed are good design, and how joins are important (and why that makes Mongo so braindead). Follow the cue from Implementing User Accounts

## Datastores You Could Use

- [MongoDB](gfe6n-w944c-c3ayh-cw75e-5vhgk)
- [RethinkDB](x04q3-rgttk-cda6n-ew06f-ym1gf)
- [Redis](epafg-z2wb4-g691h-gjtdp-fe3cw)

## Read on

Once you have data in place, the next thing you might want to explore is [Testing and Automation](m9xxz-5df52-8mbjp-th6pz-sw7m5)

NOTE: I think that's kind of a bad "next", kind of an artifact from the original linear structure of all this
