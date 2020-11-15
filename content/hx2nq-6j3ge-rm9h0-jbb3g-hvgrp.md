# existing tools for platform in a box

or, you know, this page is here to compare and contrast how much of the [Ops in a Box Vision Statement](0dehw-8kxsa-81amj-gp4kk-td8cw) is covered here

https://fabric8.io/ sounds like a lot of the same ideas, but I don't know about how Java-y it sounds

https://github.com/jenkins-x/jx

## a thought I'm having

considering that this kind of infrastructure has traditionally only been the concern of people who rub elbows with capitalism people (ie. people developing proprietary licensed crap and making budgetary deals), it makes sense that so much of this has historically been Java, and is so rife for disruption

## PaaS components

- [prow](https://github.com/kubernetes/test-infra/tree/master/prow)
  - used by most of the k8s stuff
  - [apparently part of jenkins-x](https://medium.com/@jdrawlings/serverless-jenkins-with-jenkins-x-9134cbfe6870)
- [tekton](https://github.com/tektoncd/pipeline)
  - the successor to knative build
- [kaniko](https://github.com/GoogleContainerTools/kaniko)
  - image builder
  - I think this is something I explored in the note on images?
- [skaffold](https://github.com/GoogleContainerTools/skaffold)
  - this is also a build thing? from source?
