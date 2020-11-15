# Technical Helmbags

These are for Helmbags which are kind of like "library charts": they enable a class of functionality on the cluster that doesn't directly translate into user applications.

For technical-user-facing apps, see [System Administration Helmbags](3x3ew-aknad-rw94y-dnsms-s1ebp)

## Expose - a chart for integrating with some kind of hosting

This is a little different from the rest, as it's more backend-focused

- External DNS
- SSH port forwarding sidecar? Inlets?
  - [call it "shinlets"](d2mme-sky57-p78tk-0rm3k-vtdg5)
    - on second thought, maybe nah
- [cert-manager](https://cert-manager.io/docs/installation/kubernetes/#installing-with-helm)

I've actually been looking into Contour as the latest on this?

This whole branch ties into a bunch of iterations of systems on Stubernetes

## Data distribution

Moved out to [Federation/Decentralization Helmbags](9x4ck-wbfpe-gy84d-9gnh3-e90x9)

## Enhanced file-sharing / hosting

- minio backend
- ownCloud? Syncthing?

Basically, we have OpenEBS, now we need to mimic S3

And this could overlap these other components (like distributed with [Federation/Decentralization Helmbags](9x4ck-wbfpe-gy84d-9gnh3-e90x9) and interactive with [Plain Old File-Friendliness Helmbags](hbn7h-zmwqr-m4aaz-zd6xb-f8y0d))
