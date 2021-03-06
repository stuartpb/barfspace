# Kubernetes / Docker Image Best Practices

Since I've seen a bunch of stuff that doesn't seem to be currently covered in the top Google results for "kubernetes image best practices"

- https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-how-and-why-to-build-small-container-images
- https://kubernetes.io/docs/concepts/configuration/overview/

This is about how to structure a Docker image so that it'll play well with modern usage like in Kubernetes, and how to use Kubernetes to supplement these images.

## Keep the images light

Remember that there's a *lot* of stuff you can do with Pods in Kubernetes that means you don't have to bake things into the image itself.

If you want that expeience on Docker, you can make a derived image from your Kubernetes-appropriate base.

## Helm charts should be a layer

You should always make a Helm chart to accompany an image to illustrate its suggested usage.

## Handling file ownership

As covered [here](ze4vg-2sdf2-rg8sr-1c6kd-9mec5)

If you want to make sure ownership will be correct, make it an option in the Helm chart to run an init container.

## On mini-inits like tini

Docker has the `--init` flag to inject `tini` to a container, instead of including it in an image (which was common).

You don't need this for modern pods in Kubernetes: the things these mini-inits handle (zombie processes, signals) are handled by a `pause` process that's added to all pods.

TODO: link to blog post explaining pause process
