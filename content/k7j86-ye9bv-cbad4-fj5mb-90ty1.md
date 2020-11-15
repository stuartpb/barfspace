# acebins as an input to Helm??

pulled out from [this node that was supposed to be about Magickshop but turned into Acebins](amyvx-h7853-878ea-s47wv-a18p1)

not sure if there's just a gap in the train of thought I forgot to write down, or if I was on a different page from the one I meant to be adding this to

like, was I thinking that building Helm images would become part of the "pipeline"?

this sounds like it was supposed to be part of the Kubernetes notes somewhere but got lost?

## the note

This could be worked into a Helm chart by introducing a build step (can you do builds in Helm? or do you just build images and then cut releases? there must be a way to customize a layer, at least in setting up a pod, so you'd just be running a startup step, or when installing the assets first time or something)

Nah, I feel like this is a matter of building a new image by adding another layer, and should be in a CI-managed autopatching process, where it watches for a dependency change in the container image it patches, builds against it, runs tests, and if the image is good it pushes it to a staging tag and proposes promoting that tag (or can maybe handle patch revisions itself), then (once promoted) proposes a pull request or whatever to put out a new Helm release with it (after testing the full release with the patched component)
