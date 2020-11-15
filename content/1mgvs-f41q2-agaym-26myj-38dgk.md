# Talk Proposal: "Verif Morghulis: All Passwords Must Die"

I know that I've got a standing talk proposal in #38, and I do intend to give that talk at some point in the future (maybe even this year), but at the moment I'm not chomping at the bit about writing it, because it's not all that closely related to the thing I'm working on right *now*. What I *am* working on right now is something I *passionately* want to give a talk about, *urgently* (in April, if possible): how *absolutely nuts* the current state of authentication and account management is, across the *entire landscape* of the Web today.

This isn't JavaScript-specific (though I do intend to shout out some JavaScript solutions to the problems I raise, including some I've written myself), but it *is* specific to the *web development* space - let me know if you think that's too broad, and I can look for a different forum that might be interested in hosting it.

This would sort of follow the kinds of things I said in [my 2011 Cracked article on information security], and recaps a few of the points

I've been slowly but steadily cataloging

User account systems are like mouths: we've all got them, we all need them to sustain operation, we don't think about them, most of them stink and/or have cavities, and the ones that are good at doing one thing with them usually aren't better at other things.

## Everything I'm About To Talk About Matters

A lot of this stuff may sound like nitpicks about small inconveniences. Why should we care about such small details?

You should care because a handful of *micro* failures are how you end up encountering *macro* failures.  **Bad usability is bad security. Always.** When users are frustrated and their willpower / brainpower is depleted, they're going to start making mistakes. Some mistakes are more likely and perilous than others, some are more directly connected to exploits than others, but *all* of it wears the user down, which lowers their defenses. *Every* UX win is an infosec win.

Like Sheriff Hopper says in Stranger Things, nine times out of ten, when a child goes missing, it's someone the parent or guardian knows. Infosec is the same way: while there are technical risks, they can be patched out. The ones *developers* have to worry about are risks *posed by users*.

We like to fantasize about constructing elaborate, obstacle-course-like security restrictions that we'd need some Oceans-Eleven-like heist to circumvent, just like we fantasize about going all Liam Neesons on exotic kidnappers who've Taken our daughter. But the truth is, approaching security from this showy standpoint is just building a system that's *more likely to fall*, just like how Mac on It's Always Sunny would get his ass kicked.

## The Way We Compose Passwords Is Totally Wrong

- We'll open with an easy one: "correct horse battery staple" is a more secure password" than "Tr0ub4dor&3".
- **Password rules are wrong.** With the exception of length, putting restrictions on what a password may contain only serves to make working with it harder, which leads to the aformentioned wear-down of the user's strength, which lowers their defenses. I'm not just spitballing on this one: this is the stance of the current NIST guidelines. In this specific case, passing up their advice raises the chance that the user is going to do something stupid, like put the password on a post-it on their monitor.
- **Gauging password strength is tricky.** zxcvbn is pretty much the only library to get this right.
- **Password input should be showable.**
- **Password input should be _differentiable_.**
- **Password input should be *fully* hideable.**
- ***_Other_ inputs should support this confidentiality.** Passwords aren't the only thing a person can want to keep confidential.

## The Way We Implement Passwords Is Totally Wrong

- **Hashing should be client-side.** Sending plaintext passwords to the server, even if TLS is keeping it safe on the wire, provides the opportunity for a rootkit on the server to sniff the password. Furthermore, if you do non-trivial hashing on the server, you're allowing *attackers* to waste *your* cycles dealing with *their* attacks.
- **Any site that allows password reset via email should allow *login* via email.** The former applies to *virtually every site on the Web today*, whereas the *latter* I've only found in production (outside of sites I've made myself) on two sites, including Slack.
- **Passwords should be *optional*.** This is really why I'm calling this presentation "All Passwords Must Die"

## The Concept of an Actual "Session" That Ends Is Dead

- It died with the Personal Computer, and Mobile buried it. **Let it rest in peace.**
- The model that matches how people actually use accounts in the modern world is a "device" model, where each browser on a traditional PC counts as a separate device.
- This is the path that browsers have been assuming you're following anyway. It's why Chrome has a "Guest" option, and why Incognito retains cookies for the life of the window.
- Yes, there are still public computers, and shared family computers, but my point is that *even these* are handling "sessions" at a level *outside your scope*. While that is, of course, not a *guarantee*, and you should still make it *possible* to handle a device that doesn't work this way, nothing should be designed around the assumption that it *is*.
- You may be angry, or in denial, or bargaining with your UX team to re-introduce the concept, but everybody's life will be easier when you put your grief aside and reach **acceptance**.
- If you intend to have devices need to re-authenticate after a period of time, sessions should expire on the *server*, not the client: the client should never *forget what device it is* unless the *server* has forgotten the device (in which case it's a "new" device).
- Centralizing sessions is the right way to do it; if you think you can do it another way, I invite you to check joepie91's flowchart about why JWT can never be an acceptable solution (TL;DR you can't revoke access without effectively having sessions).
- Sessions (or, as they should be conveyed to the user, *devices*) need to be manageable
- "Remember Me" is either useless or harmful. If it's unchecked, nobody's going to check it, and they'll just be grouchy that they keep having to re-enter their password (or otherwise reauthenticate) Better: a "Stay logged in on new device?" email, with links to logout (and optionally report breach and respond) - some sites do this anyway - without the

## A Whole Bunch Of Other Stuff Is Wrong

- "Security Questions" should almost never be used. The questions shouldn't be site-dictated, especially as most questions a site pick are questions that someone could easily learn in conversation. And this isn't some goofy thing like that scene in Sneakers where Stephen Toblowsky says "passport"; it's something most people won't notice, like David Rees spilling the beans in Going Deep, or all those guys who got hacked via Xbox Live.
- Usernames and handles should be changeable - don't use them as a primary index. Some guys seem to think "oh, name changes are just for weird dead celebrities like David Bowie or Prince" - uh, yeah, them and *seventy percent of married women*. If you think cultural needs that white men in America generally don't deal with are insignificant, that's a signal that the rest of the world *will* notice.
- All that stuff I said about email should be optional, too, optionally removable or optionally upgradeable. Maybe the user has a more secure channel, or has a second factor like a yubikey
- It should be easy to revoke a compromised device. Not so easy you can troll someone with it, but easy enough that the scenario where someone who shouldn't have been able to remove a compromised device
- There should be a ready response to lockout. This is the purpose of an all-configurable secret plan (
- **All of this should be packaged together.** Can you imagine if we made developers re-implement TLS for every site? This shit is *tricky*, and applicable *everywhere*, with *very* few exceptions. Making this part of the *user agent* would be a mistake: this should be an evergreen field of experimentation open to *site* authors, not browser vendors. But it *should* be possible to get all of this one-shot, instead of having to roll your own, which is so exhausting that we've been spinning our reimplemented wheels for the past fifteen years just barely keeping up with no real advances in the state of the art.
