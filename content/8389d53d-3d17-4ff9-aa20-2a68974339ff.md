# Backing Up Stubernetes Mk I and Reflashing Mk II

I'm gonna go ahead and save all the data I could potentially want to review:

```
[stuart@stushiba stubernetes-setup]$ kubectl cluster-info dump --output-directory=state --all-namespaces --output=yaml
[stuart@stushiba stubernetes-setup]$ kubectl get secrets -A --output=yaml > state/secrets.yaml
[stuart@stushiba stubernetes-setup]$ kubectl get persistentvolumes -A --output=yaml > state/persistentvolumes.yaml
[stuart@stushiba stubernetes-setup]$ kubectl get persistentvolumeclaims -A --output=yaml > state/persistentvolumeclaims.yaml
```

Now that I'm ready to say goodbye:

```
sudo poweroff
```

I take the 64G drive out and flash it to SystemRecoveryCD via Balena Etcher (had to unmuont via `umount /run/media/stuart/containerd-opt`)

## installing the recovery

hoo boy... wasn't set up to keep good notes for this

I think I went into GParted and made a new all-GPT disk, went into gdisk to change the partition type, ran the appropriate `grub-mkinstall` or whatever

trying to figure out what to do for a grub.cfg, I pulled it from install.sh

I'd copied install.sh, and saved the latest release ISO to our GRUB media

Ended up trying to patch to
