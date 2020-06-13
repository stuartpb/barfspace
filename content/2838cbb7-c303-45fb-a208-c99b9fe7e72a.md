# More own-hostname links

On Arch, this hasn't been an issue for a long time, for [the same reason it's not an issue in Nix](https://github.com/NixOS/nixops/issues/106#issuecomment-19056172): `nss-myhostname` handles it via nsswitch.conf.

However, openSUSE doesn't have an `/etc/nsswitch.conf`: only `/etc/host.conf`

- https://www.man7.org/linux/man-pages//man5/host.conf.5.html
- http://www.linfo.org/etc_host_conf.html
- https://linux.die.net/man/5/host.conf
- https://www.tldp.org/LDP/nag/node82.html

[This one openSUSE thing](https://doc.opensuse.org/documentation/leap/reference/html/book.opensuse.reference/cha-network.html) does list nsswitch.conf? but I don't see it for whatever reason? Are we not on glibc?

Hmm, there is a package for [nss-myhostname](https://software.opensuse.org/package/nss-myhostname)... but how would I integrate it

## okay, but why isn't this solved in Kubic?

It seems to me like the /etc/nsswitch.conf should at least be present (and need to be configured, both to change to what I want and to run at all)?

- https://build.opensuse.org/package/view_file/openSUSE:Factory/glibc/nsswitch.conf?expand=1
- https://build.opensuse.org/package/view_file/openSUSE:Factory/glibc/glibc.spec?expand=1

Why isn't this present in Kubic?

And it's not like it's some kind of shadow mount that only appears when you read it:

```
studtop:~ # less /etc/nsswitch.conf
/etc/nsswitch.conf: No such file or directory
```

It looks like the nss-myhostname packages build with systemd, although also it looks like they're packaged separately?

https://build.opensuse.org/package/view_file/openSUSE:Factory/systemd/systemd.spec

## nailed it

[They patched it to fall back to /usr/etc/nsswitch.conf](https://en.opensuse.org/openSUSE:Packaging_UsrEtc#netcfg)

(that page has [five upvotes on Reddit](https://www.reddit.com/r/openSUSE/comments/e72td3/kubic_configuration_files_in_etc_and_usretc/) - I mean, sure it's a good design, but...)

Anyway, I think I spotted the procedures to enable this in the package...

so I'm gonna go ahead and install that package and hop back to the main thread

## remember the ultimate goal

I want `hostname -i` to work before nunning `kubeadm init`
