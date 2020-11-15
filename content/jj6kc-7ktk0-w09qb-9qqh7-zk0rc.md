# future dedicated ingress node

Found some articles describing something kind of in line with this, which would be a nice feature to let light prototypes run off my local server:

- https://blog.alexellis.io/loan-an-ip-to-your-minikube-cluster/
- https://blog.alexellis.io/raspberry-pi-zero-tunnel-gateway/
- https://blog.alexellis.io/share-work-using-inlets/

## inlets links

TBH, I'm not sure this'd be necessary over just flannel (or whatever CNI I might swap in) and Traefik (and another k3s node running as an agent), but:

- https://docs.inlets.dev/#/?id=cloud-native-tunnel
- https://github.com/inlets/inlets
- https://github.com/inlets/inlets-operator
- https://github.com/inlets/inletsctl

## sort of in this vein

https://blog.trailofbits.com/2016/12/12/meet-algo-the-vpn-that-works/
