# Quadration Dead Man's Switch System

Just a quick thought: you have a Quadration dead-man's-switch system delete its "safe" scheduled release keys so that older encrypted "backups" will never be accessible

## The Dr. Strangelove/Fail-Safe Problem

You'd need some kind of condition for a Node to be able to tell the difference between "I've been cut off through some kind of communication failure (possibly all systems had their CNI break at once)" and "the rest of the cluster has been destroyed and I am the last survivor"

This is a problem in any distributed system, but especially in a Dead Man's Switch one, which is all about attack resilience - and one of those

this is a textbook Lockout Attack, and should absolutely be described in the security series where I cover these

## anyway

I was proposing a "secret forgetter" battery-backed hardware module? I think this is what I was proposing it for

## also

I think this is where Iwanted to make the point: you cycle out / delete and burn old keys so leaked backups can't get decrypted through a leaked old DMS key
