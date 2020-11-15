# Personal workspace / Kubernetes cluster concepts

## Does Helm work for this?

- Each workspace should automatically provision its own volume in setup by default, but it should also be possible to tweak that.
  - Say I want to take my neckfx volume, and move the neckfx-software branch to a symlink to a dir on another mounted volume that could be shared with the nodemcu workspace (making this like a "tag" unit)
    - I'd be fine if there was some kind of portal that would be like "by doing this, you will need to hibernate the nodemcu-workspace pod" or whatever, if that's what it takes to avoid issues that could arise from having the mount shared between two containers at once
    - Like, if the volume's something simple like just a minikube/k5s local host mount, this should be trivial
  - Ooh, would it be possible to use *actual k8s tags* for auto-associating volume mounts to pods like this
    - (so I could have tag metadata for all the nodemcu projects and all the thing projects and all the neckfx projects, etc)

## DNS

Make it possible to have IPv6 out into the world for direct AAAA connections to dedicated-name servers

so you've got something like the Kubernetes DNS resolver, like a modified clone thereof, handling outside DNS requests for these world-routable addresses

and IPv4, you have an old-fashioned vhosts server process

for SSH, you could probably make some kind of "Hello, this shell only supports the command that tells it what host to proxy into:" - or is there a way to sort of auto-determine that? idk, this is kind of a pipe-dream feature

the one thing about this is that it'd be a nice way to, like, SSH into the server for a particular workspace instance (or even somehow have a socket-wake-like auto-provisioning that starts the "server" for that domain )
