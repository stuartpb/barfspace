# State of the notestack mid-2019

(pulled from a [Right Now](84grq-16d12-65bj6-m6bt5-s1h4a) entry)

I've got [minikube running on stushiba](zrb4b-qp2zj-0pa6e-7azbg-cfr5f) and am using it to get the hang of [Kubernetes](yynnd-jg6vf-4p813-td1c7-e8y0s), where I intend to migrate my work on these notes to.

For all of July 2019, I've been editing my notes in a VS Code window on Stushiba, which has given me an appreciation for all the features VS Code has.

The bagtent-orphans script is getting pretty creaky (as we approach 1000 note nodes, the n^2 performance of `grep` for each filename is getting prohibitive). Luckily, I've just discovered the `remark` library, which seems like the ideal way to do a breadth-first search instead.

I also really need to get [The Shotclock and Integrity](vwjtn-pkzhg-gc9ff-2h6sj-nddpy) implemented - really, once I have `bagtent-distance` implemented (which allows for the real test I want instead of `bagtent-orphans`, which is reachability from the root note), I can go ahead and start running this again. (The thought of losing work because I didn't have this autosync is really bumming me out, and the kind of thing that usually causes me to give up on things.)

I'm considering either base32-encoding the UUIDs, or using an all-new random format, that would make working with the random filenames a little easier.
