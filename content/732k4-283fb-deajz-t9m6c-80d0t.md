# understanding Kubernetes services

the fundamental thing about Services is that they're designed so that **multiple pods, on multiple nodes, can receive the connection and provide the service**.

like, the reason there's a "NodePort" is so some out-of-spec load balancer can figure out how to distribute traffic across those nodes

IDK, still kind of trying to wrap my head around this

ah, yeah, the [scale tutorial][] kind of makes that explicit:

[scale tutorial]: https://kubernetes.io/docs/tutorials/kubernetes-basics/scale/scale-intro/

> Services have an integrated load-balancer that will distribute network traffic to all Pods of an exposed Deployment
