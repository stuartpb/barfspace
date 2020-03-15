# Profiling and Parallelizing Node.js Scripts

Note I mean *CPU* parallelizing, not just eventing input.

I'm looking to speed up bagtent-distances, which I suspect is bottlenecked on Markdown processing.

## Collected links

- https://itnext.io/going-multithread-with-node-js-492258ba32cf
- https://medium.com/free-code-camp/how-to-scale-your-node-js-server-using-clustering-c8d43c656e8f
- https://nodejs.org/api/cluster.html
- https://blog.logrocket.com/node-js-multithreading-what-are-worker-threads-and-why-do-they-matter-48ab102f8b10/
- https://nodejs.org/en/docs/guides/simple-profiling/
- https://stackify.com/node-js-profilers/
- https://dev.to/sbadhwar/performance-profiling-your-node-js-application-at-runtime-h9i
- https://developer.ibm.com/technologies/node-js/articles/profiling-slow-code-in-nodejs/#
- https://www.codementor.io/@codementorteam/nodejs-profiling-build-a-high-performance-app-babjg4jf9

## Thoughts

It's worth figuring out if clustering makes any sense any more, as opposed to just using Kubernetes / some kind of container engine / systemd / whatever outside thing to handle it
