# My Perfect Workspace World

The thing that I want - all I want out of the world (as far as having room to experiment with software goes) - I mean, really, my perfect human experience looks like:

- Universal basic income (of the "income plus" variety where other basic needs like healthcare are also provided by the state)
- Free virtual machines for anybody whose work is robustly open source (ie. following [SACRED][] principles).

[SACRED]: https://github.com/stuartpb/sacred-tenets

I like the idea of the CNCF cluster, but it's too heavily gatekept right now

Like, the core of this is that, like, the "free VMs" thing... it should apply to *everyone*, whether they're an active contributor or just an "idle consumer" who basically only pulls other people's changes. So long as they're not using the VM for *proprietary development*, it should be free, because this allows for the *real* thing open source projects need: *an interested and engaged user base*.

And I'm emphatic about the "the only restriction is if the development is proprietary" thing. Like, people should be allowed to use this for, like... private Minecraft servers (so long as all the extensions in use are public, and their use is documented), and personal photo storage, and everything.

In short: **cluster computing should be a public utility**, one whose only restriction is that it can't be used for private *endeavors*, where an "endeavor" is quantified as "anything that could be of benefit to the general public".

(You know, this "endeavor" definition is another kind of important concept I should probably elaborate on somewhere, kind of like what I'm doing with "SACRED". "Of benefit to the general public" doesn't have to mean *everybody* can use it: it means *anybody* can use it, in the sense that they don't have to be a coworker in your company - that's what the "A" in SACRED is all about - wait no I fucked up, let me try this again.)

("Of benefit to the general public" doesn't have to mean *everybody* can use it: it means *somebody* who isn't you could reasonably be expected to take a potential interest in the same work, personally. Something where sharing it with them doesn't impact you at all.)

Like, my personal photos don't need to be public, because they're not the kind of thing where somebody's going to be struggling with something, and then they come across my work, and it makes their life easier. But the system I use for *uploading and backing up* those photos *absolutely does* need to be public.

The point where this touches SACRED at large is that anything created toward fulfilling that has to be made public, and, if it exists, can be compelled to release. If there was a really important transform step in the seed data, but your IDE for the transformation's development was the readline prompt in Bash, and by the time you realized it could be useful it was purged from .bash_history, well, that sucks, but okay. The only thing that would get you *evicted* from this system is if you've got a *standing project* that you're not releasing: you can be compelled to release *as much of the project as you have access to* under threat of eviction, but if the project is bad at SACRED and requires a bunch of expert knowledge to operate... okay, that sucks, but since you've made all your work available, someone else can work on fixing that in their own derivative. (If you go and do something like *refuse to maintain release history*, something like that that would *actively impede others from building on your work*, that's... probably also grounds for eviction, if it's a reasonably-complex project, the kind you really shouldn't try to maintain without Git backing the work tree.)

Again, the point is that all work on the system (where "work" is a synoynm for "endeavor" as described above) should be as foundational as possible. Some aspects of SACRED are limited by abilities (like descriptiveness, or an awareness of privilege enough for good accessibility), but some things are just naturally SACRED, and you just need to not impede them.

I guess the baseline would be that, by default, everything in your *entire* tree gets published. If you've got the acumen, you can narrow that (like, you can set up a gitignore), but you have to be able to prove that nothing that's being gitignored could bring any of your work closer to SACRED.

[This Medium article](https://medium.com/@jkriss/anti-capitalist-human-scale-software-and-why-it-matters-5936a372b9d) kind of reflects some of my other thinking in this vein.

## Endeavors and Enterprise (ie. Services)

One thing I'm thinking about right now: what would the constraints on use of a cluster like this around commercial use need to be? For example, I am *absolutely against* the notion of a cluster like this being used to mine any sort of crypto-currency (even if it's building a "new coin" - so long as it's an endeavor toward converting CPU cycles to cash, I am 100% opposed), but I'm *totally into* the idea of somebody using it to run their own Etsy-like shop, ie. using the tech to facilitate communication in taking comissions to build bespoke artwork.
