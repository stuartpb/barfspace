# great idea to replace the Nginx thing in Plusku / Printacle

instead of making the Nginx config by hooks (and I believe exporting them as files that get included in from a pre-configured config?): does Traefik have a similar config format that would be neater to generate?

And then you could have one static config, on top of all the apps that can mount themselves in (like ChiliPeppr!), that enables the view-renderer app to run in a container

though this lets containers be unnecessary if your service is a simple Go binary? no, I don't think so, because you still want the shared network interface thing of a pod

anyway https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/ has a lot of great tips for putting systemd around podman
