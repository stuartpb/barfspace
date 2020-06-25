# Your Own Operator vs The Helm Operator

https://coreos.com/operators/

If considering your own operator for something, see if it really adds anything over just specifying an instance of your app via a HelmRelease to be rolled out through the Flux Helm Operator:

- Separates instances
- Allows for custom image selection
- Allows for sub-chart modularity / composition
- Configuration through full template logic
- Rolls out upgrades
