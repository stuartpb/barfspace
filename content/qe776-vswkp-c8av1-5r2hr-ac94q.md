# Flexible / Worse-Case-Scenario Keys

(and yes, I mean "worse case" and not "worst case", the idea is that we're talking each successive case being a "worse case" than the last)

bouncing off from the "reducing the attack space needed to brute force", this ties into the "brute forcing passphrases as a way to protect ideas" concept that was conjured around the "hashblot game" note, these ideas ought to be woven together and maybe added to the series

the idea of reducing the attack space by a hint of some of the hash (which could be an alphabi hash-prefix doing double duty as a cryptic clue to the image's meaning)

this would be an AMAZING idea for a CTF / Scavenger Hunt

this also brings the idea that maybe it just adds random bits to the end to force more searching (ie. the search space is only narrowed down by the hash)? the idea being that, if it's right, it can take a hotpath relative to being wrong

this ALSO intersects the "encrypting word by word of the passphrase" idea, allowing the attack to be parallelized

this is maybe the overall theme of this weird Smuggler's Cove thoughtspace: "Strategically Weakening Passkey Structures", in the same vein as the gesture-swipe system that underlies Windows' Picture Passphrases

it's both for mnemonic forgiveness and for input noisiness

So this explores how you can use, like, the entire words to a secret song - or the fourier transform of a song (like in the Richie Rich movie!) - or other biometric kind of secrets / identifiers (it's important to understand the *distinction* between the two - if a high-res photo camera, using any kind of wave spectrum, can capture it in a public setting, it's not secret)

The previous note ties into the "Things You Might Not Have Realized Aren't Secret" page

another way of "weakening" passkeys is to have them in escrow, or to have "escrow levels" where having a "more accurate" key creates a hash construct that can get the actual key in fewer rounds - this is probably the best way to do "less wasteful" forced-iteration

but, wait, isn't that just the same thing as adding hash rounds? because you can just use the "weaker" level as a password hashed with fewer rounds

maybe the idea here was to "sandwich" a search space, so, like, you can prioritize iterations to search for more-statistically-likely typos-or-whatever "faster" than others...

but, nah, you could still do that with rolling...

ohh, is it because multiple-hashing requires symmetric work to construct? nowww I get it, you can put all the "acceptable" entries, but if a brute force search is trying the weaker space it'll take an intractible number of rounds to search each

oh snap, is this a way to force users to use more secure passwords, but if they want to just have an absurdly-short password, it'll take them that much longer to log in?

okay, now I'm remembering what the deal was with the "time to key expiration" was (what I've written below), the idea was that it'd take a long time (like maybe thirty seconds) to produce the key for "I can only remember a bit of the password", but if that password (or phrase or whatever) is still in the 99.9th percentile of what it takes to search, then it's still uncrackable - you could crack it after

but wait, how much time does finding a crypto-suitable prime take? since that's what you'd need for a time lock

I keep lunging for "but they could also get that confirmation after PBKDF2!" and then realizing "wait,

one thing I keep circling around to is that, if you have the "correct values" of each "close hit" or "close enough" unpublicized, then yuo can have your "correct guess" resolve faster, but the "weak guess" has to try *all* the values - even the ones that are actually encoding closer values - to the point

but I'm not sure if that's all that desirable of a feature?

I guess that was the question: would you divide it up in such a way that it's like "if your guess is in this specificity range, try seeing if this value yields a workable hash after this many rounds"?

or you could make it ambiguous: "this guess will yield answers at anywhere from

ohh, maybe you could do it with a block that reveals tokens at undisclosed times (but on intervals), so you just keep seeing if the current round resolves the next key at every sync point

that's a cool way to hide when you've scheduled something until it happens - but it requires that information to be secret between the party that created the schedule (ie. the block of time-release keys) and the party that used the schedule - and if there's a predictable interval of keys before them, it ruins the surprise

this could also be a matter of hiding *that* you've scheduled something

this "expiry time as a factor of key strength" tradeoff feels like something I would have written in My Dream IAM

this can also be used to structure recovery: something like maybe a Shamir's Secret Sharing group can put your recovery key together, but the system can be configured to only trust that key for a year, and it'll incur a one-month defrosting time to access (which is why the replacement is distributed after like ten months)

Oh man - especially if you make the defrost *also* distributed by something like secret-sharing - this can be a way of strengthening your security *just because it's harder to keep a large-scale secret longer*. It's a *social protection mechanism*. You can *target the tradeoff point* where you think

It's also to give your team more time to revoke the key, detect intrusion

wow, I am WAY off course from the original idea here
