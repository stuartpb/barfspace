# lost thought for Wayside

Not sure which iteration this is meant to be tacked onto, but I think it ties into the general theme of "a unified model for granular interface actions"

Taking another look at it right now, I think this thing I'm describing is *the* thing code-server implements

## another thing though

I was thinking about how `code --wait` works, and how Wayside would do it, and I guess you'd make either a WebSocket or a WebRTC P2P connection (ooh, is easy failover to server-brokered WebSocket connection a thing?) to... the API server, from the terminal process, which'd probably be easier to monitor for the browser-side frontend giving a signal that

I guess the question is, where does the realtime making-a-WebSocket-connection-from-the-browser route live? The component tht synchronizes the editor state (whatever term I think would make sense to describe it)? PouchDB? etcd?

Oh man, yeah, if you model the whole editor state as declarative YAML, you can use text editing to do so much (and you can, like, open multiple tabs to the same buffer)

Hmm, maybe that's an aspect of the model - different users have edit permissions for different docs in the database that is the workspace, (which works not unlike a Kubernetes namespace)

you could also have Helm/kustomize (idk)-style layers (like I've been thinking for printacle)

Haha, oh wow, what if you can create batch jobs in YAML - like, "copy and paste 5 times", like, macros, event trigger sequences and payloads - and then you can generate that from any script

And oh yeah, for distribution/versioning/realtime-coop mode, each "session" is a cursor and scroll position (and, like, width, or this is maybe where "detach" comes into play, "detach" being kind of like remaking the ReplicaSet? idk) into a "buffer", and a "buffer" is itself an agreed-upon consensus of received changes

you don't need a blockchain for it, though. Just have declarations of "this is my local state, this is my status merging it with the most recent I've seen of my siblings" (and those "siblings" can be other tabs on the same client - like, for undo/redo desynchronization? like, if possible, I undo )
