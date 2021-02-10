# giving root access to myself

```
[stuart@stushiba Downloads]$ ssh-copy-id root@remarkable.403.testtrack4.com
The authenticity of host 'remarkable.403.testtrack4.com (fd5a:b141:6779:0:d612:43ff:fedd:d2fa)' can't be established.
RSA key fingerprint is SHA256:sSrm1uGDvFfDrQWWPLWSH4LcgqWUWdPLD7DKRDeV7uo.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@remarkable.403.testtrack4.com's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@remarkable.403.testtrack4.com'"
and check to make sure that only the key(s) you wanted were added.
```

didn't work.

I SSH in again with the password and do this the manual way:

```
mkdir .ssh
wget https://github.com/stuartpb.keys -O .ssh/authorized_keys
```

note that there's busybox wget but not curl

`chmod 600 .ssh/authorized_keys` for good measure

```
reMarkable: ~/ hostnamectl
   Static hostname: reMarkable
         Icon name: computer
        Machine ID: 858971574804401fb6cc1441a384ede5
           Boot ID: 709844a96bd0469a8c12b2aedfe4f288
  Operating System: Codex Linux 2.5.2 (sumo)
            Kernel: Linux 4.14.78
      Architecture: arm
```

do `hostnamectl set-hostname stumarkable` and restart from ui

## restarting

okay, so, cool the hostname works

not so cool: uploading is very complicated

I plug the USB cable into my PC and enable the web UI from Settings -> Storage, then drag-and-drop everything I want in
