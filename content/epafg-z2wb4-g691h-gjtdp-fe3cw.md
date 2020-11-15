# Using Redis

## What Redis is good for

If your data would work as one giant Map, Redis is a sound base to build on.

## Adding a Redis provider to Heroku

Like "Adding a Mongo provider to Heroku", this isn't relevant so much to the new form of these notes. You can figure out addons on your own.

## Setting up a local Redis instance to test?

Without even containerizing I think you can just run `redis` at the command line

## Setting up a stable redis configuration on a server??

Like with [mongodb](gfe6n-w944c-c3ayh-cw75e-5vhgk), this is something Kubernetes/Heml is best for

I will make the note that there might be value in something like a "How to run it in your pod or container or even just shell script or whatever structure you're building" for less-than-Kubernetes structures
