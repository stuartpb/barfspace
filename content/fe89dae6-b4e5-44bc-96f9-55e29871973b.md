# 2018-09-23

## OpenSCAD

`sudo pacman -Syu openscad`

## Virtualization

I've been banging my head against the wall trying to get networking installed in this VM, so I'm just going to go ahead and reboot and see if that fixes it.

Okay, so now I'm running `pacman -S firewalld` and `sudo systemctl enable --now firewalld` to fix `Could not start virtual network 'default': internal error: Failed to initialize a valid firewall backend`

Okay, doing all that and then restarting the manager made it work. Gahhhhhhh.

Doing `sudo pacman -S ovmf` so I can virtualize with UEFI firmware, and adding config lines (and restarting services) per https://wiki.archlinux.org/index.php/libvirt#UEFI_Support

Also `sudo pacman -S tcpdump` to see if I can diagnose why I can't connect to the virtual network

... FOR FUCK'S SAKE, I should have read [this comment][1] more closely.

> it's just necessary to start ebtables and dnsmasq, with libvirtd/virtlogd afterwards.

[1]: https://superuser.com/questions/1063240/libvirt-failed-to-initialize-a-valid-firewall-backend#comment1893457_1090815

Maybe I should have read the comment following it:

>

[This comment][2] was the one that put me on track. I went into the firewall control panel and enabled `dhcp` and DHCP started working, so I realized this was the problem - *and I didn't even want a firewall in the first place*, so I'm going back and doing exactly what that comment said:

```bash
sudo systemctl disable --now firewalld.service
```

[2]: https://github.com/NixOS/nixops/issues/500#issuecomment-244700714

## Making sudo really passwordless

To bypass all this weird polkit stuff, I'm making `/etc/polkit-1/rules.d/49-nopasswd_global.rules` per https://wiki.archlinux.org/index.php/Polkit#Bypass_password_prompt with this content:

```
/* Allow members of the wheel group to execute any actions
 * without password authentication, similar to "sudo NOPASSWD:"
 */
polkit.addRule(function(action, subject) {
    if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
```

Really, though, this should list something more like https://askubuntu.com/questions/98006/how-do-i-prevent-policykit-from-asking-for-a-password and use [LocalAuthority][].

[LocalAuthority]: https://www.freedesktop.org/software/polkit/docs/0.105/pklocalauthority.8.html

Also, gonna call it here: someone should make "polsudo", which is just a shim for `sudo` that uses polkit rules instead of `sudoers` (and a translator that converts sudoers into LocalAuthority rules).

Possible names for this:

- pol?sudo (or posu(do)?)
- supo ("setuser policy") or podo ("policy do")
- as great as "sukit" is as a name, "Superuser Kit" doesn't make sense

## GParted

I somehow didn't have GParted installed, so I ran `sudo pacman -S gparted`, then reviewed the optdepends and decided to `sudo pacman -S --asdeps f2fs-tools exfat-utils udftools nilfs-utils gpart`

## nmap

At this point, I want to be able to figure out where the system is, so I'm doing `sudo pacman -S nmap`
