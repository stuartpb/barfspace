# getting rainpower back

`yay pebble` to install `pebble-sdk` on stushiba from AUR

that failed on pyqrcode, so now I'm trying to install pebble-tool-git

same failure, diving down...

- https://aur.archlinux.org/packages/python2-pyqrcode/
- links to https://devblog.square-r00t.net/articles/a-note-on-using-gpg-signatures-in-pkgbuilds
- says to run `gpg --keyserver pool.sks-keyservers.net --recv 8C004C2F93481F6B`
- sure, why not, fuck it

```
[stuart@stushiba pebble]$ pebble
Traceback (most recent call last):
  File "/usr/bin/pebble", line 6, in <module>
    from pkg_resources import load_entry_point
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3251, in <module>
    @_call_aside
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3235, in _call_aside
    f(*args, **kwargs)
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3264, in _initialize_master_working_set
    working_set = WorkingSet._build_master()
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 585, in _build_master
    return cls._build_from_requirements(__requires__)
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 598, in _build_from_requirements
    dists = ws.resolve(reqs, Environment())
  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 791, in resolve
    raise VersionConflict(dist, req).with_context(dependent_req)
pkg_resources.ContextualVersionConflict: (websocket-client 0.11.0 (/usr/lib/python2.7/site-packages), Requirement.parse('websocket-client>=0.31.0'), set(['libpebble2']))
```

fuck this, whatever

[reported to maintainer](https://aur.archlinux.org/packages/pebble-sdk/#comment-724118), we'll see what we can do

luckily I grabbed all my Cloud9 workspaces so maybe I can pull some artifacts out from there (though I mostly used cloudpebble so probably not)

hmm, `docker pull dmorgan81/rebble` says `docker` is not found? I have docker-machine from the minikube stuff, I guess I assumed that'd pull docker in as a dependency, I guess not

```
sudo pacman -S docker
sudo gpasswd -a stuart docker
sudo systemctl start docker.service
```

okay, `docker run -v $PWD:/work dmorgan81/rebble build` seems to have built it okay, but now I'm having trouble browsing files on the phone

installed `android-file-transfer` but it thinks the device is always busy / can't find it

```
sudo gpasswd -a stuart adbusers
```

fixed it, but when I click the file and say "open with", it tells me "No apps can perform this action"

Pebble didn't appear in "Simple File Manager"'s list, but good old Amaze handled it
