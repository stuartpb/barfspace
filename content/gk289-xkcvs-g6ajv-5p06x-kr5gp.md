# Installing code-server natively to Stushiba

On account of how stushiba keeps going down as I'm using it (due to what may be some kind of video-card problem?), and how I can't bring stubernetes all the way back up at the moment (I can't get wpi-amethyst to get its name into the local DNS records via DHCP by resetting the cable, and can't find my video stuff to debug it directly - see [recovering wpi-amethyst](hmth7-ryhd2-cs8t4-gad87-ae3gf)), I've decided, what the hell, let's just get code-server running directly on stushiba, and I'll figure out more advanced iterations on the concept once I've got that problem solved.

Weird, `yay` says build files exist - did I already do this?

Got this:

```
[stuart@stushiba ~]$ sudo systemctl enable --now code-server@stuart
Failed to enable unit: File code-server@stuart.service: Link has been severed
```

Diving a little into the AUR comments, I got the idea to check the targets of the /usr unit files:

```
[stuart@stushiba ~]$ ls -l  /usr/lib/systemd/user/code-server.service
lrwxrwxrwx 1 root root 66 Feb  1 17:47 /usr/lib/systemd/user/code-server.service -> /home/stuart/.cache/yay/code-server/code-server-3.8.0-user.service
```

Well that's a bit grungy. Let's have the cp follow links instead of preserving them:

```
[stuart@stushiba ~]$ sudo rm /usr/lib/systemd/user/code-server.service
[stuart@stushiba ~]$ sudo cp -aL /home/stuart/.cache/yay/code-server/code-server-3.8.0-user.service /usr/lib/systemd/user/code-server.service
[stuart@stushiba ~]$ ls -l  /usr/lib/systemd/user/code-server.service
-rw-r--r-- 1 stuart stuart 154 Feb  1 17:46 /usr/lib/systemd/user/code-server.service
[stuart@stushiba ~]$ sudo rm /usr/lib/systemd/system/code-server@.service
[stuart@stushiba ~]$ sudo cp -aL /home/stuart/.cache/yay/code-server/code-server-3.8.0@.service /usr/lib/systemd/system/code-server@.service
[stuart@stushiba ~]$ sudo ls -l /usr/lib/systemd/system/code-server@.service
-rw-r--r-- 1 stuart stuart 162 Feb  1 17:46 /usr/lib/systemd/system/code-server@.service
```

Now it works:

```
[stuart@stushiba ~]$ sudo systemctl enable --now code-server@stuart.service
Created symlink /etc/systemd/system/default.target.wants/code-server@stuart.service → /usr/lib/systemd/system/code-server@.service.
```

Of course, since I was sticking to `-a` as part of this, I also had to fix ownership:

```
[stuart@stushiba ~]$ sudo chown root: /usr/lib/systemd/system/code-server@.service
[stuart@stushiba ~]$ sudo chown root: /usr/lib/systemd/user/code-server.service
```

After that, I went to `.config/code-server/config.yaml` and replaced the `password:` line with a `hashed-password:` value.

Note that the site I originally copied the SHA256 from capitalized the value: I didn't get it to work until I'd made the hash lower-case.
