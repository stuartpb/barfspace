# Closing Time

*(Tiare tells me [the song](https://www.youtube.com/watch?v=xGytDsqkQY8) is about birth? Whoa, I can totally hear it, the imagery in how the song's about endings and beginnings)*

A [Notestack Core of Engineers](63p2w-vj7t2-baaa8-r76as-nntma) Special Time-Sensitive Task Force.

Welp, [Cloud9 is closing down](y8mrm-5zwbk-wjaa1-m8y0r-3e66h), and [GitPod is insanely expensive to use as a primary](a0c3k-3zt2d-e59hb-6p83z-4tpm1), so I need to find a new solution.

In a larger sense, GitPod might be feasible for my development output, but I can't have my notes eating into it - and if I find a new solution for my notes, would it really be that great to keep using GitPod? We'll see

## Stuff I tried

I'm using https://stackshare.io/cloud-ide as my search point - it's got a cohesive enough list of options that I don't feel I need to relist them here (it even lists long-dead offerings like Nitrous).

## The new Cloud9

So, I tried migrating my C9 workspace to AWS, but... at this point, I just can't settle for C9's Markdown featureset - I can't ctrl+click to follow links and can't follow links in preview.

## Codeanywhere

Paid a month into Codeanywhere to see how that is - it doesn't have a Preview function, so it's no good for these notes, and I cancelled right away.

(I do like they way they present a "connection editor" with options for like a million storage backends, but also a "workspace" construct like Cloud9...)

## Codenvy

I checked out Codenvy - looks like this is running an old version of Che. No Markdown preview, so I can't use it.

## Redhat's Che hosting

I tried Redhat's Openshift Che website, but links didn't open in their Che 7 Dev Eclipse Theia container, and I couldn't debug with source maps, and it would suggest creating from templates that it would then say are "too old", and just... ugh, forget it.

Also it's so sloppy that Che's welcome page is dark text on a dark background

## CodeSandbox

Skipping this because it's not a real dev environment with a backing VM, meaning I can't develop the bagtent scripts, etc. It's also weird about projects that aren't in any kind of framework... if this isn't open source, it seems like it's a pretty gross glob-of-gum with specific adaptors, and it will almost certainly fall apart as soon as the vulture capitalists start tightening the screws

TODO: Write a page explaining what will happen to your startup, through no fault of your own - this imght overlap with that "Future Memorials" page I described on Weird Stubs

## Koding

Looks like Koding's become self-hostable abandonware: that's nice, I might try it. (Why couldn't Nitrous do this? Probably some capitalist bullshit. Or maybe they did and I just don't care.)

## Self-hosting a cloud for these

Not sure how to do this... this is one of the open ends of

## Might be time to start localizing this

One of the things I'm facing is that it might just be time to start experimenting with multiple working-tree sources.

But I hate the prospect of losing working trees *so much*.

Eh... I got by with petlogs, though.

Anyway, this is a good-enough opportunity to test the barest form of "federated bagtent" interoperation: if bagtent can't hold up when I'm committing from multiple trees from the same brain, how am I supposed to cope with *multiple brains*?

But, like... agh, I almost didn't push my final "everything out of GitPod" commit, and the thought of losing what I spent all last night writing - *even for just a couple weeks* - was enough to make me want to abandon these notes forever, to avoid stepping on toes and creating reintegration work. Ugh.

This is largely a problem of not having the shotclock going, though. So maybe the local spaces can focus on making the shotclock work again.

Also, a thought: I really ought to make a "how git stash works" conceptual explainer, because I still don't really understand it, but I use it (just did to do the git-pull of that GitPod content), and that's a bad combination - is it a single ref that uses the reflog instead of parents? Is that stable? In what circumstances? Why not make new refs?

Making a note here to remember that I have a "bin/setup-workspace" script in GitPod that's completely empty, it's the one thing I didn't commit because, you know, no content, nothing to commit (I think it's described)

Anyway, I'm writing this stuff on stushiba in a [VS Code (OSS)](ef70t-zvnhr-8faw2-p3fs5-5qwrd) window - I've been finding a lot of stuff I like about it (even though I'm not wild about a lot of its defaults, they're generally smooth enough to change). These are all features I need from Theia (and many of them I could, like, half-get from Cloud9).

I think I was also listing I was going to explore Minikube? (UPDATE after grepping: it was in the Right Now description - should probably branch off to a new subpage and interlink to Kubernetes Discoveries)

Anyway, even if I end up hosting something off my desktop, anything I go with ought to work on a Raspberry Pi, where it could maybe live alongside a not-published-publicly private notes tree beyond [The Shadow Curtain](wm7ba-3ycgc-wn8h2-pjnsv-xny45).
