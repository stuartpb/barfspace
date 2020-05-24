# sensible Clusterhood model?

I think I was writing a while back about the idea of letting cluster resource usage be "bankable"

I think what might make sense would be to have each user be their own cluster control plane? And so, like, their device handles provisioning anywhere else, and minding its own business and stuff...

but it can also offer "hey, I've got processing to spare, anybody want to borrow my hardware for a bit", and if it's accepted (like a bid or whatever) then they start banking resources with the

we'd definitely have a rule of "no using this to mine Bitcoin at peak" as a condition for membership

you could also have "I have an external IP address endpoint running whatever that one thing I was looking at, people can forward their traffic to it" as a load-balancing pooling mechanism

## important thing about the governance / privacy model

we'd need a rule that says, like - and I don't quite know how the storage model for all this would look like - but, like, any data that reaches our machines, you know, free game for law enforcement, aka the "don't store morally heinous shit on our disks" clause. not that we're rats, but like, you know, we're not Cloudflare, in terms of barely-having-a-conscience

anyway, the important carveout is that, if we make the decision to have you punted off the network, we reserve the right to the evidence we used to come to that decision, and our policy is to not disclose it

in any case, this information disclosure policy would retain strictly to the evidence of unacceptable behavior: like, we're not gonna dump your GBA emulator saves and/or private API keys just because they were "part of the home directory, which was just a hotbed of criminal activity"

## sandboxing for this

Maybe there needs to be a VM layer. Is it possible to set up a Kubelet with permissions low enough that a user couldn't hijack the server?

Like, to some degree they could always be an asshole by forkbombing or using as much CPU as they have credit for to mine crypto, but, like, there's a level of that that's tolerable: they need to be able to not, like, hijack other users' namespaces.
