# How Helm and Operators Work Orthogonally

The idea of setting up services for an app throught a resource to be provisioned through an Operator is that an Operator can really know how to work the cluster in a lot more detail than specifying a direct Deployment

and, see, you can specify the resources used *by an operator* as part of the Helm chart (like, you can have a toggle condition of "specify the service directly, or delegate out to the Operator to handle)

So Operators basically define Services for the Cluster (though I guess they can be namespace-limited)
