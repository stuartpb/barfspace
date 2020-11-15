# Trying to explain the model

A Kubernetes cluster is a space that implements the definition you give it. (This abstract space is known as the control plane, like the astral plane.)

You define your state using:

- [Pods](https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/)
  - Pods are the Kubernetes construct for Containers
    - which, in turn, are just Processes with better encapsulation/isolation (ie. their own filesystem)
  - Generally defined as templates in Controllers
    - creating a Pod directly is for one-off runs and things like that
  - they represent all the processes that might make up a "piece" that could run on its own machine
  - this'll frequently just be one container
  - sometimes you'll need multiple containers
    - like if, say, your "server" consists of a lower-level server that is wrapped by a higher-level server
    - all containers in a pod share the same network interface (IP and ports)
  - [this](https://kubernetes.io/docs/concepts/workloads/pods/pod/#alternatives-considered) explains why Pods well
    - One thing that threw me that's laid out really well there is that Pods are *not* a colocation construct - while they have that effect, the real purpose is to make them all function within the same host, like a process that spawns subprocesses
- Controllers
  - https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#alternatives-to-replicaset sums it up
    - oh wow, I get what a DaemonSet is now, nice (I'd describe it as a ReplicaSet, but for a node's cluster functionality)

## analogy brainstorming

maybe it'd do to visualize the resources as Pods being like a job for the day, being carried out by a Mr. Meeseeks like character. Controller constructs are the machines that make sure the Meeseeks show up regularly