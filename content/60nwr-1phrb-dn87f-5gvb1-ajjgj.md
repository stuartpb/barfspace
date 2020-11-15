# revokum

https://unusual.studio/projects/#1d732f88-640c-4451-a4a2-8f1e72187dc0

this'd be a service

tech side, you can have it so X percentage of authority revoked requires explicit operator approval

the service would be a person who you can tell "yeah, we had to fire an employee, we're sending you the termination papers" and there's whatever level of pre-agreed-upon thoroughness to prove not only that this isn't an attacker, but that it's not a rogue abuse of power in breach of contract and state law (all Revokum operators would be legally bound to NDAs with outside parties, citing CIA-like "can neither confirm nor deny" policies)

you can have higher level of confirmation (ie. more officers needed to confirm) for revoking, like, a datacenter's worth of credentials due to a lost developer laptop or something

## technical implementation

for SSH key revocation, the easiest way is to make a `revokum` user on your server with SSH-only access, and abilities constrained, as much as possible (through configured setuid binaries, custom shell, all that) - even more than a `git` user - to only be able to revoke keys it has been configured to allow revocation for, after a threshold of certification for the request (via SSH keys? is that possible? also allow GPG keys anyway?)

you would of course also have to have a recursive "set the revocation policy" authority to make sure this is kept up to date

should run this by Security StackExchange

## use example

important to note that phone credential stealing has a MUCH more/less urgent threat model, as the only way it can be used is if *immediately taken from the user's hands*, pretty much.

Maybe "only accept these credentials within these hours, unless this other threshold is met" can be used to enforce the chain of command

Hmm, should this maybe be abstracted into a generalized system that can also be authorized to run commands like "emergency, shred all sensitive data / local copies of secrets" (maybe implemented under different users on the server, for full permission separation)?

This starts to fall under something that's useful in deployments of Operation BIGDOG

## similar

- [SSH setup keys](p8tar-6rkdy-4sag1-crmgb-d380e)
