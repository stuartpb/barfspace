# Serving DNS servers from Stubernetes

looking a bit at the [minikube ingress DNS server](https://github.com/kubernetes/minikube/tree/master/deploy/addons/ingress-dns), which at least taught me this could be done in Kubernetes (with its [example](https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/ingress-dns/example/example.yaml))

but, like, I'm pretty sure this can be done using CoreDNS (now that it has the "kube-external" plugin or whatever) - [a custom Docker image](https://gitlab.com/cryptexlabs/public/development/minikube-ingress-dns) [(hub link)](https://hub.docker.com/r/cryptexlabs/minikube-ingress-dns) seems like overkill

(this ended up leading to [early CoreDNS notes](ekme6-mhmzs-ytaej-g50g7-dhdtf), which hit a wall)

## unrelated

https://github.com/superbrothers/minikube-ingress-dns seems to deal with the client side, and also has nothing to do with the Sword & Sworcery EP
