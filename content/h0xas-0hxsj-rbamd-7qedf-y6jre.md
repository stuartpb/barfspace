# Setting up the Raspberry Pi 4 in the first multi-node cluster iteration

it is time

I plug everything into the Pi, both USB drives and the Ignition stick and the MicroSD card and the Ethernet cable, then power...

and I don't see it on the network

I could probably break out the TTL to diagnose this, but I feel like using a little HDMI screen instead

Anyway, I've ordered that, it's on its way for tomorrow.

My plot now is to get ready to put OpenWRT on the router

## well, whatever

just installed `wireshark-qt` to Stushiba, just in case

Anyway, hooked up the screen, and got a phone-camera screenshot of the error I was having with build 78, which looks kind of like what I was running to with Build 81 (part of it being "error -84 whilst initializing SD card")

But [kukuk's personal repo](https://download.opensuse.org/repositories/home:/kukuk:/raspi:/images/openSUSE_Factory_ARM/) has a build from March, and that has some different errors, and looks more like something I'll be able to set up and update

One thing I make out from the opening spew when I try to boot is that our 3.1.0 Ignition isn't supported, so I manually edit the one in the disk to 3.0.0 and try again

The non-embedded-keys version failed as you might expect, but adding all my keys as data URLs worked (so it could bring up the network after)

after associating to the network, I add a DHCP reservation for it, then unplug the ethernet cable and reattach to jiggle the IP. The screen resets and I can see that it's all good

Okay, so, I can connect to the SSH server, but it doesn't seem to recognize my key?

Looks like I might need to take a different approach for setting up root's authorized keys

Rewriting Ignition and trying again

I can't figure out how to edit boot params to make it try reading Ignition again, so, fuck it, reflashing

After making sure the Ignition file was valid... hmm, it's not there. Screw it, I'll figure it out some other time. I pull out the MicroSD, plug it into Stushiba, and:

```
sudo mount /dev/disk/by-uuid/d90158e4-8c9b-4fa7-a2a8-907fc3a5b0ca -o noatime,subvol=@/root /mnt
sudo mkdir -p /mnt/.ssh
sudo bash -c 'curl https://github.com/stuartpb.keys > /mnt/.ssh/authorized_keys'
sudo chmod 0600 /mnt/.ssh/authorized_keys
sudo umount /mnt
```

## and we're in

set-hostname done

running `transactional-update dup --interactive`

```
Checking for newer version.
New version found - updating...
Loading repository data...
Reading installed packages...
Retrieving package transactional-update-2.22-1.1.aarch64                                                                                                                   (1/1),  60.5 KiB (151.9 KiB unpacked)
(1/1) /tmp/transactional-update.Eo9BjtTjIg/repo-oss/aarch64/transactional-update-2.22-1.1.aarch64.rpm ....................................................................................................[done]
transactional-update 2.22 started
Options: dup --interactive
Separate /var detected.
/etc on overlayfs detected.
Calling zypper --no-cd dup
Loading repository data...
Reading installed packages...
Warning: You are about to do a distribution upgrade with all enabled repositories. Make sure these repositories are compatible before you continue. See 'man zypper' for more information about this command.
Computing distribution upgrade...
9 Problems:
Problem: problem with installed package kubic-haproxycfg-0.10.0-44.12.aarch64
Problem: problem with installed package kubicctl-0.10.0-44.12.aarch64
Problem: problem with installed package kubicd-0.10.0-44.12.aarch64
Problem: problem with installed package libeconf0-0.3.5+git20200203.3144b69-17.1.aarch64
Problem: problem with installed package patterns-containers-container_runtime_kubernetes-5.0-61.1.aarch64
Problem: problem with installed package patterns-containers-kubeadm-5.0-61.1.aarch64
Problem: problem with installed package patterns-containers-kubic_admin-5.0-61.1.aarch64
Problem: problem with installed package patterns-containers-kubic_loadbalancer-5.0-61.1.aarch64
Problem: problem with installed package patterns-containers-kubic_worker-5.0-61.1.aarch64

Problem: problem with installed package kubic-haproxycfg-0.10.0-44.12.aarch64
 Solution 1: install kubic-haproxycfg-0.9.1-2.4.aarch64 (with vendor change)
  obs://build.opensuse.org/home:kukuk  -->  openSUSE
 Solution 2: keep obsolete kubic-haproxycfg-0.10.0-44.12.aarch64
```

oh huh. geez oh boy...

gonna go ahead and pick the first option (vendor change) on each of these, you know I only like going upstream

let's do this

## after like an hour

here are the last lines of the update:

```
Executing %posttrans script 'coreutils-8.32-3.1.aarch64.rpm' [..
Output of coreutils-8.32-3.1.aarch64.rpm %posttrans script:
    Creating initrd: /boot/initrd-5.7.5-1-default
    dracut: Executing: /usr/bin/dracut --logfile /var/log/YaST2/mkinitrd.log --force /boot/initrd-5.7.5-1-default 5.7.5-1-default
    dracut: dracut module 'rngd' will not be installed, because command 'rngd' could not be found!
    dracut: dracut module 'dmraid' will not be installed, because command 'dmraid' could not be found!
    dracut: dracut module 'dmsquash-live-ntfs' will not be installed, because command 'ntfs-3g' could not be found!
    dracut: dracut module 'cifs' will not be installed, because command 'mount.cifs' could not be found!
    dracut: dracut module 'iscsi' will not be installed, because command 'iscsi-iname' could not be found!
    dracut: dracut module 'iscsi' will not be installed, because command 'iscsiadm' could not be found!
    dracut: dracut module 'iscsi' will not be installed, because command 'iscsid' could not be found!
    dracut: dracut module 'biosdevname' will not be installed, because command 'biosdevname' could not be found!
    dracut: dracut module 'rngd' will not be installed, because command 'rngd' could not be found!
    dracut: dracut module 'dmraid' will not be installed, because command 'dmraid' could not be found!
    dracut: dracut module 'dmsquash-live-ntfs' will not be installed, because command 'ntfs-3g' could not be found!
    dracut: dracut module 'cifs' will not be installed, because command 'mount.cifs' could not be found!
    dracut: dracut module 'iscsi' will not be installed, because command 'iscsi-iname' could not be found!
    dracut: dracut module 'iscsi' will not be installed, because command 'iscsiadm' could not be found!
    dracut: dracut module 'iscsi' will not be installed, because command 'iscsid' could not be found!
    dracut: *** Including module: bash ***
    dracut: *** Including module: systemd ***
    Failed to add dependency on unit, unit systemd-ask-password-plymouth.service does not exist.
    dracut: *** Including module: systemd-initrd ***
    dracut: *** Including module: i18n ***
    dracut: No KEYMAP configured.
    dracut: *** Including module: ignition ***
    dracut: *** Including module: ignition-microos ***
    dracut: *** Including module: network-legacy ***
    dracut: *** Including module: network ***
    dracut: *** Including module: url-lib ***
    dracut: Couldn't find SSL CA cert bundle or libnssckbi.so; HTTPS won't work.
    dracut: *** Including module: drm ***
    dracut: *** Including module: health-checker ***
    dracut: *** Including module: transactional-update ***
    dracut: *** Including module: btrfs ***
    dracut: *** Including module: kernel-modules ***
    dracut: *** Including module: kernel-modules-extra ***
    dracut: *** Including module: kernel-network-modules ***
    dracut: *** Including module: qemu ***
    dracut: *** Including module: rootfs-block ***
    dracut: *** Including module: suse-btrfs ***
    dracut: *** Including module: suse-xfs ***
    dracut: *** Including module: terminfo ***
    dracut: *** Including module: udev-rules ***
    dracut: Skipping udev rule: 40-redhat.rules
    dracut: Skipping udev rule: 50-firmware.rules
    dracut: Skipping udev rule: 50-udev.rules
    dracut: Skipping udev rule: 91-permissions.rules
    dracut: Skipping udev rule: 80-drivers-modprobe.rules
    dracut: Skipping udev rule: 70-persistent-net.rules
    dracut: *** Including module: dracut-systemd ***
    dracut: *** Including module: haveged ***
    dracut: *** Including module: usrmount ***
    dracut: *** Including module: base ***
    dracut: *** Including module: emergency-timeout ***
    dracut: *** Including module: fs-lib ***
    dracut: *** Including module: journald-conf ***
    dracut: *** Including module: lcdbootmsg ***
    dracut: *** Including module: rpi-rtc-ds3231 ***
    dracut-install: ERROR: installing '/etc/adjtime'
    dracut: FAILED: /usr/lib/dracut/dracut-install -D /var/tmp/dracut.rmXJ7E/initramfs /etc/adjtime
    dracut: *** Including module: shutdown ***
    dracut: *** Including module: suse ***
    dracut: *** Including module: suse-initrd ***
    dracut: *** Including modules done ***
    dracut: *** Installing kernel module dependencies ***
    dracut: *** Installing kernel module dependencies done ***
    dracut: *** Resolving executable dependencies ***
    dracut: *** Resolving executable dependencies done ***
    dracut: *** Hardlinking files ***
    dracut: *** Hardlinking files done ***
    dracut: *** Generating early-microcode cpio image ***
    dracut: *** Store current command line parameters ***
    dracut: Stored kernel commandline:
    dracut: rd.driver.pre=overlay
    dracut:  root=UUID=d90158e4-8c9b-4fa7-a2a8-907fc3a5b0ca rootfstype=btrfs rootflags=rw,noatime,ssd,space_cache,subvolid=281,subvol=/@/.snapshots/2/snapshot,subvol=@/.snapshots/2/snapshot
    dracut: *** Stripping files ***
    dracut: *** Stripping files done ***
    dracut: *** Creating image file '/boot/initrd-5.7.5-1-default' ***
    dracut: *** Creating initramfs image file '/boot/initrd-5.7.5-1-default' done ***

............done]
Trying to rebuild kdump initrd
Creating a new grub2 config
Generating grub configuration file ...
Found theme: /boot/grub2/themes/openSUSE/theme.txt
Found linux image: /boot/Image-5.7.5-1-default
Found initrd image: /boot/initrd-5.7.5-1-default
done

Warning: The following files were changed in the snapshot, but are shadowed by
other mounts and will not be visible to the system:
/.snapshots/2/snapshot/root/.bash_history
/.snapshots/2/snapshot/var/lib/systemd/catalog/database
/.snapshots/2/snapshot/var/lib/systemd/random-seed
/.snapshots/2/snapshot/var/lib/systemd/i18n-migrated
/.snapshots/2/snapshot/var/lib/dbus/machine-id
/.snapshots/2/snapshot/var/lock
/.snapshots/2/snapshot/var/mail

Please reboot your machine to activate the changes and avoid data loss.
New default snapshot is #2 (/.snapshots/2/snapshot).
transactional-update finished
```

done

we reboot, and I move some hardware around; this confuses it.

It looks like the "transient hostname" has overwritten our hostname again: I do another `hostnamectl set-hostname` to fix this, and am planning on exploring a full hostname solution via OpenWRT as soon as tonigh

Now that that's taken care of, I'm ready to bring this node on board for the cluster with the `kubeadm join` command I got after `kubeadm init`

running with `--v=2` shows that it gets hung on `The cluster-info ConfigMap does not yet contain a JWS signature for token ID`

okay, so, checking `kubeadm token list`, you're not supposed to wait a day to join the cluster. need to start a new token for joining rn

looking at the error on [this GitHub commit](https://github.com/kubernetes/kubeadm/issues/1477) (but not in my terminal), I run `kubeadm token create`
