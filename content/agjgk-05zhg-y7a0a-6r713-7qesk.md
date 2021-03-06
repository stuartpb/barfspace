# so, anyway, persistent volumes

reading from https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims

I'm adding this resource to the cluster:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: notes-pvc
spec:
  resources:
    requests:
      storage: 4Gi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: work-storage
```

## figuring out how to put this all together

I never really understood "Workspaces" in VS Code: I guess they're files that define a view?

https://github.com/cdr/code-server/blob/eccee531429718a4d34180b3a1c7bff49976a555/src/node/app/vscode.ts#L235

Anyway... looking at the implementation, it looks like all the state and editor settings and everything are tracked - by folder/workspace where applicable - under ~/.local/share/code-server

There's a `machineid` in it that I'm, uh, definitely wary of, and we'll see how that works in - apparently [even Microsoft aren't sure what it's for any more](https://github.com/Microsoft/vscode/issues/61562) (looks like telemetry so this doesn't report as a different data point each run, which is fine)

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: household-workspace-code-server-share
spec:
  resources:
    requests:
      storage: 4Gi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: work-storage
```

A glimpse at the changed parts of the new spec:

```yaml
      volumes:
        - name: ssh
          secret:
            secretName: household-workspace-ssh
            defaultMode: 420
        - name: code-server-config
          configMap:
            name: code-server-no-auth
            defaultMode: 420
        - name: code-server-share
          persistentVolumeClaim:
            claimName: household-workspace-code-server-share
        - name: notes
          persistentVolumeClaim:
            claimName: notes-pvc
      containers:
        - name: notes-code-server
          image: codercom/code-server
          resources: {}
          volumeMounts:
            - name: ssh
              mountPath: /home/coder/.ssh
            - name: code-server-config
              mountPath: /home/coder/.config/code-server
            - name: code-server-share
              mountPath: /home/coder/.local/share/code-server
            - name: notes
              mountPath: /home/coder/notes
          args:
            - /home/coder/notes
```

## idea: self-signed workspaces.internal certificate

I might do that soon

## problem

Trying to connect to the new node, I get this error:

```
Error: Error: EACCES: permission denied, mkdir '/home/coder/.local/share/code-server/User'

NoPermissions (FileSystemError): Error: EACCES: permission denied, mkdir '/home/coder/.local/share/code-server/User',    at Object.h [as createFileSystemProviderError] (/usr/lib/code-server/lib/vscode/out/vs/server/entry.js:219:318),    at C.toFileSystemProviderError (/usr/lib/code-server/lib/vscode/out/vs/server/entry.js:265:421),    at C.mkdir (/usr/lib/code-server/lib/vscode/out/vs/server/entry.js:261:527)
```

Weird that the binary inserted into this image *specifically to solve this* doesn't work

Oh, okay, I see how all this works now thanks to https://stackoverflow.com/questions/46769339/how-to-change-permission-of-mapped-volume-in-kubernetes-docker

per https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#configure-volume-permission-and-ownership-change-policy-for-pods

> By default, Kubernetes recursively changes ownership and permissions for the contents of each volume to match the `fsGroup` specified in a Pod’s `securityContext` when that volume is mounted.

Inserting this into the deployment's PodSpec:

```yaml
      securityContext:
        runAsUser: 1000
        runAsGroup: 1000
        fsGroup: 1000
```

## oh my god. where doing this. where makeing this hapen

the first thing I do is open up Settings and paste in my settings from stushiba:

```json
{
    "editor.fontSize": 12,
    "editor.fontFamily": "Monaco, Menlo, Ubuntu Mono, Consolas, source-code-pro, Roboto Mono, Droid Sans Mono, monospace",
    "files.insertFinalNewline": true,
    "files.trimTrailingWhitespace": true,
    "editor.tabSize": 2,
    "editor.emptySelectionClipboard": false,
    "editor.minimap.enabled": true,
    "editor.highlightActiveIndentGuide": false,
    "git.enableSmartCommit": true,
    "git.confirmSync": false,
    "editor.multiCursorModifier": "alt",
    "editor.renderWhitespace": "boundary"
}
```

I then try to `git clone git@github.com:stuartpb/notes.stuartpb.com.git`, but it gets rejected (publickey) - I guess I really do have to set this public key up to my account... it's time.

## oh, right, that's gonna get annoying

This fails to add github.com to the list of known hosts

I'm thinking I like keeping the keypair as a configMap...

is this something a subPath mount could fix?

we could make a ConfigMap with the hosts we want to know, but, like...

what if it's copied from a mounted ConfigMap in a prep container? (but that wouldn't work if the ConfigMap were updated? hmm)

## actually, I don't want to add this to *my* account

That's a recipe for disaster.

[Setting up the Public Universal Friend account](3dgxq-q2g2f-5884q-kd97d-hxjk1)

## snag

I realize that initkey's failure to present private keys as a `pre` means the private key I entered earlier (you may have noticed it was all one line) is not recognized by ssh.

I go into the dashboard and edit the secret there.

Should just be a matter of waiting now... (see https://kubernetes.io/docs/concepts/configuration/secret/#mounted-secrets-are-updated-automatically)

## success!

cloned my noteball

## more thoughts on how I might structure workspaces going forward

- might add an option to push as me via HTTPS that'd prompt for my password each time (which I'm fine with tbh)
- thinking about using unusualstudio.net to expose workspaces there
  - that namespace would be, of course, "unusualstudio-net"
- and of course there's putting The Auth Layer in front of things
