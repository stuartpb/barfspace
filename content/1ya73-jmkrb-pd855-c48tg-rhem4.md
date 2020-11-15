# code-server

This came from me Googling "theia kubernetes" and finding [this repo](https://github.com/gashirar/theia-on-kubernetes) archived in favor of [this repo](https://github.com/gashirar/code-server-on-kubernetes)

the [CONTRIBUTING doc](https://github.com/cdr/code-server/blob/master/doc/CONTRIBUTING.md) explains what this code does / where it came from

## figuring out what's in the official image

everything building coder.com's image is at https://github.com/cdr/code-server/tree/master/ci

the part that builds the core app (ie. gathers all the node scripts together) is at https://github.com/cdr/code-server/blob/master/ci/build/build-release.sh

https://github.com/cdr/code-server/blob/master/ci/container/Dockerfile builds the container that CI operations run from (ie. the container that builds container images)

## the existing Dockerfile images

https://github.com/cdr/code-server/blob/master/ci/release-container/Dockerfile is how Coder's image is implemented. Note the unnecessary "fixuid"

[here's how the one I found "for kubernetes" works](https://github.com/gashirar/code-server-on-kubernetes/blob/master/Dockerfile) - you'll notice it's basically the same, but on Ubuntu, with kubectl, helm, and those useless kubectx/kubens scripts-that-should-be-aliases, as well as fzf

- https://hub.docker.com/r/gashirar/code-server-on-k8s/tags
- https://hub.docker.com/r/codercom/code-server/tags

## what is to be done

anyway, even though it's overcomplicated I can still go with either one

## deciding how to build my own

they [just added a standalone installation script](https://github.com/cdr/code-server/blob/master/install.sh) that mostly just fetches the package for the host OS

you can use this to just slip the standalone in and bypass packaging by doing `--method standalone --prefix /usr/bin`

## other odd observations

[the arm64 image is "unfortunately" based on a newer Debian](https://github.com/cdr/code-server/tree/master/ci/container/arm64)

[this other "vscodium" project](https://github.com/VSCodium/vscodium#why-does-this-exist) is interesting

## from the FAQ

[they recommend kubevirt to let users set up VMs](https://github.com/cdr/code-server/blob/master/doc/FAQ.md#multi-tenancy)

[the root of the view is set by query options, then the CLI, then history](https://github.com/cdr/code-server/blob/master/doc/FAQ.md#how-does-code-server-decide-what-workspace-or-folder-to-open)

[it has its own config YAML](https://github.com/cdr/code-server/blob/master/doc/FAQ.md#how-does-the-config-file-work)

[it says a lot of browser-only shortcuts can be overridden as a PWA, but only on Chrome](https://github.com/cdr/code-server/blob/master/doc/FAQ.md#how-do-i-make-my-keyboard-shortcuts-work)
