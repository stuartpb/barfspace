# squorum / dataturf transitional brainstorm

squorum partial overlaps should be allowed, to lock but not archive/delete the post they overlap

I think this is how it's designed right now? every time there's a change to the topmost for an area within the Greek limit, it registers as a "layer" that can be dived into

not only does this permit a classic "put a poster over some stickers"kind

this means you can always discuss the lock by zooming in on it

also, posts can jockey for position in the uncovered area of the overlapped note (which will not actually be recognized as the parent)

ehh, I'm starting to think the "parentage" model should just be a feature of z tree clustering or whatever, and all squares visible (at the Greek limit) in an area should be stored in a derived data structure (which also keeps Date as a dimension for z order)

I think CouchDB can derive this with a reduction?

maybe posts can still have "post over this policies"? and they can have a "limits apply if this much area overlaps" or whatever that could maybe lead to bridging (as a good thing) by having looser rules for smaller posts / overlaps

but yeah, just, each post goes over whatever posts are beneath it, and this is how you prevent land grabs from being a thing for too long

hmm, though I do start to think of Ingress-style Nitrous XM like the resource described for securing area in Casettic

oh man, there's a wild idea, use floats in address space for sorting

you know, I think the critical thing about the parentage model was that it allowed for relative scale

also, I don't know why I'm dancing around the influence of Deep Zoom to this concept

oh, okay, maybe this was the idea, zoom is implemented as a linked list, so relative scales can be tacked on forever so long as there are relatively-intelligible posts at the next scale up

but maybe my thought here was, for that linked list to link it must use pointers, and those pointers would have to have an address space, so why not just have it placed... as an array?

because that means shuffling relative positions around to keep ensuring a given space isn't getting too crowded that...

no, wait, this makes sense, if you have a Greek limit and you're saying you can't make nodes past that. If you enforce each node to be some fraction like that from the previous to be created, then you have a "zoom level counter" that can be 64 bits long (or, you know, 53 is fine)

below is a leftover idea from the linked list approach

maybe there doc uploads as "these are the nodes next to me" and then tries to adjust them?

(continues into [dataturf](g0q2b-3wp8z-c6avy-yy5jb-6fx07))
