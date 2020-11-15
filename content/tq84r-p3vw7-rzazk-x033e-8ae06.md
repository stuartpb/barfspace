# understanding k8s community / operations and API architecture

https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api_changes.md

https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md

i live for this shit

https://kubernetes.io/docs/concepts/overview/kubernetes-api/#api-versioning makes a lot of sense, I should consider conventions from this for the OPWS draft proposal pipeline

https://kubernetes.io/docs/concepts/overview/kubernetes-api/#api-groups is cool, versioning different types of definition differently makes sense and may be the way to go for OPWS (though probably not tbh)

the thing where there's a name and UID for each object, regardless of type, is... interesting
