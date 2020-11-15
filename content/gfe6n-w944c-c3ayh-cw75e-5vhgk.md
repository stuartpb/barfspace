# Using MongoDB

(NOTE: this was written in 2013, so this text is a bit of a mix of old-and-reaction)

## What MongoDB is good for

Honestly, MongoDB is just an old JSON store with queries, that has a lot of usage.

It's not very good, but it's not going anywhere, and it's widely-used enough that it's probably got good support.

Oh, and as of ***[July 2019](https://docs.mongodb.com/manual/release-notes/3.2/)***, it finally has *some* form of support for joins.

I still say RethinkDB is better and more robust, but, you know, Mongo's the one putting out new releases.

## Using mongoskin

Mongoskin is a light wrapper around the base mongodb driver that makes it so most functions don't use callbacks. This makes it simpler and more in line with the base drivers for other databases like RethinkDB and Redis, which is why it's recommended.

*(of course, today everything uses Promises, and for all I know the new API works sensibly around that)*

## Adding MongoDB or MongoLab to Heroku

(no content for this in the original Trello board - it would have just been "here's how to add the addons", and since the Heroku focus is less of a thing now I don't care to fill this in)

## Setting up a local Mongo instance to test?

this is probably more feasible in 2019 with kubernetes

## Setting up a stable mongod configuration on a server??

I think server setup may be out of scope for Lean Notes, kind of. Maybe just cover enough on local setup that you could extrapolate and fill in the gaps with the official docs' recommendations and Google.

*(these days I'd just point to generic advice for Kubernetes and reading Mongo's docs)*
