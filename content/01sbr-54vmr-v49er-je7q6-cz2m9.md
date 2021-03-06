# The Right Way to Do Login Emails

Send a code, have the code lower in the message by default, let the user configure whether they want emails with the code higher up ("eye by default", in Surpass terms), lower but still present

all three emails should have a link (the link requires clicking a button after GET) that expires in a user-configurable (account-possibly-restricting what can be requested, and by default probably just has a fixed value based on the eye/triplet/shroud "base stuff" thing)

note that the shroud doesn't have a default effect on login at all, because everything is expected to look just like an uncreated account (no preload of options, which'd be a thing you'd do if people are logging in to public accounts, along with the info that's public about them, if they used their username)

that's a thing, these options can be preloaded in on variants based on the input string, like only acknowledge when logging in via username, that's a sensible default. users can also associate multiple emails to one account that each has different settings you could set it so that... i guess there'd be an interface for "login methods to present UI for for me", and by default it'd be all of them (because that's what unacknowledged-existence accounts need to use all the same facilities)

these base sets can probably be diversified a bit, like maybe into a decision tree, like, "look, here's the default. is that too restrictive for you? not restrictive enough? okay, do you want Ashley Madison style cloaking, or just everything-defaulted-to-a-presentation-by-recognition?"

user should be able to configure how many characters and if they want letters or just digits, and that key size is weighed against the window time to give a zxcvbn-style prompt about how secure that token will be within that time duration

a key thing I haven't typed yet here is that codes can be short, and overkill should be... permissible (maybe someone really wants access to be link-only), but not within the normal UI range.

email hopping to transfer an email's identity association from an old account to a new one can be done by having the email be associated (by permitted access) to both accounts, then both ends approve the transfer. (the gaining end needs approval, or at least email notification, because there could be a schedule allowing for intrusion, say, after hours, and not letting a hole be set up silently makes one less thing that can be worked into prep time in an attack - the "making noise and being reversible" school of defense)

blip idea: notification coalescing by user. if three users send you fifteen PRs between them overnight, you get three mails. you won't get more until you've looked over contributions, which will be in like "see all" lists per-user. (hey, yeah, this was how Slack notifications visually worked, kinda.)

Remember to follow [Session Handling Best Practices](a61hh-5zn9z-cd8wg-4tke1-a9dwe) (there's a note there on how to not expose these URLs)
