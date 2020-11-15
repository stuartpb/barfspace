# understanding ReplicaSets

popping out from [the tutorial](cps0h-ape60-pa820-68w3m-825h7)

So there's a `Controlled by` field that lists our Deployment: so I guess other things can create ReplicaSets?

Okay, and the ReplicaSEt didn't exist when the server came online...

so Deployments are the "plan documents", and ReplicaSets are the live construct it creates

so I guess you can think of ReplicaSets like the next level above Pods: pods only live as long as their contained processes, but ReplicaSets have lifespans based on the stuff *above* them.

ReplicaSets all control the same kind of Pod - a Deployment might involve multiple different kinds of Pod, but each of those kinds would have its own ReplicaSet

It always comes down to *scaledown* for me, ie. "how do I conceptualize this"

I guess the way to describe it might be that ReplicaSets are like... the example that comes to mind is "the Slayer". In Buffy terms, "the Slayer" is a ReplicaSet

or, like, "The Seven" from The Boys

## stuff I'm getting from the next tutorial

Ah, okay, a ReplicaSet is also mortal? Like, I can't change the number of Pods it's supposed to have? If it scales at all, it creates a new ReplicaSet?
