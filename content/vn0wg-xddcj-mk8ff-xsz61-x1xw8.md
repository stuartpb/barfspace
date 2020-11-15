# Why You Can't Hold OS File Handles Like Names

Programs like sed - and most text editors, as I think you'll find - write files by writing them to a new temporary file, then deleting the old file and moving the new one to take its place. (I think that might even have a single system call, at this point, though it might be non-POSIX - the last part, I mean, overwrite-moving atomically so that you know you're not momentarily losing data.)

anyway, the handle there would probably change as a result. the name still has the same semantic meaning, but it's like Swampman

footnote: Swampman, or how the Star Trek teleporter is technically a cloning device with a genocide built in

for structures like text where a small change has to come in a position that requires moving other stuff that comes after it,

buffers use a structure called ropes, which are like a tree of deltas representing text insertions (I think)

https://en.wikipedia.org/wiki/Rope_(data_structure)#Comparison_with_monolithic_arrays
