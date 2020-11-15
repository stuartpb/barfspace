# Notes in the Afternoon

I've figured out the way forward for my notes today.

## the moop

Ever since I realized I needed a more diverse digit set for the note IDs, I've been kind of despondent, since my "badifogu" identifier format, as rad an alias as it may be for hypothetical people, would have been a one-way lossy transformation - and, since the prefixes were still hexadecimal, it didn't actually help precision any. I gave it a brief test run for my "internal notestack", and found the experience kind of miserable.

It also really shot down one of the core ideas that I'd wanted from the experiment, which is that I wanted a format that would easily be interoperable with random UUIDs - if you had another source that wasn't on board, you wouldn't want one direction to have to deal with lossy identifiers going the other way. The ideas I had for badifogu would have required having some of the bits be pseudo-random when round-tripping, and just ugh, it would have been a mess.

It also left me feeling kind of discouraged about how ugly, lopsided, and boring with that one repeated "4" the UUIDs are. They make the tabs too long, it's hard to recognize patterns... like, really, I almost ought to have a "Complaining about UUIDs" page, now that I have such a clearly-superior notation for them.

It even also kind of soured me on the whole "Bagtent suite" plan: in practice, all I ever really used were bagtent-conjure and bagtent-distances, and the latter was only for validating that my note graph contains no orphans - and it's not even particularly good at doing that (it'd be a lot better if I used something that cached the metadata).

## the twist

Once I realized that the real improvement I'd wanted - switching to Base32, doubling the character space to nearly the whole alphabet (and, under Crockford32, only leaving out the letters you wouldn't miss) - would allow for not only isomorphism, but *neat* isomorphism, it revitalized my interest not only in

## the scoop

I'm going to convert the Random UUIDs to [Quintuplex Universal Identifier](mpcz4-k4ygd-mg9xd-4bpgm-53h4f) notation (since they're isomorphic), and, while I'm at it, I'm going to drop the file extensions.

Anyway, that's probably going to be a somewhat ambitious project involving a little bit of code at *least*, so the plan right now is to (in local workspaces) clone 4d20 as a bare repository

## thought

I like how this codifies the "any scripts you need to work with your document base should just be vendored in alongside the documents within your branch" model

## how it was made

`GIT_COMMITTER_DATE="1604941200 -0500" GIT_AUTHOR_DATE="1604941200 -0500" git -c user.name=nobody -c user.email= commit -m "Root commit"`

I almost went with the US headline ("As Biden Plans Transition, Republicans Decline to Recognize His Election"), but I liked the International Edition one better. More general, and who wants to think about Joe Biden anyway?

## barifying

I tried deleting the local content within the 4d20 directory and setting `git config --bool core.bare true`

So, I just deleted it and redid `git clone --bare git@github.com:stuartpb/4d20.git 4d20.git`
