# In a Perfect World: My Dream Identity Management System

In a perfect world, every feature on this list would be part of how every website and service handles its user accounts: in the world as it exists today, you're lucky if a site does even *one* of these things.

[Accouch](3bgmz-ptkas-baa2b-w9a4z-kmm7f) is my main project focused on implementing this as a runnable service

## Registration Would Start With Email

For one thing, confirmation is [the only way to validate an email address][1], and making it the *first* step in the registration process, on top of adding an impediment to automated account registration, ensures that *every* user account has a working email address attached, allowing it to be used for user notifications as well as authentication (email tokens, as described below, should be the *primary* mechanism for authentication, more than passwords).

[1]: https://hackernoon.com/the-100-correct-way-to-validate-email-addresses-7c4818f24643#.qfzes3i2u

## Configuration Would Make Both Blunt And Granular Control Easy

Many of the details in my dream account management involve a lot of scenarios where the user can opt into a lot of convenience, a lot of security, or somewhere in between. This would be implemented in the user's control panel by letting them choose which side of any high-level concern they'd wnat to start from, which would set all the lower-concern options to their farthest extents

## Authentication Would Support A Wide Array Of Multiple Factors

Ideally, the user would be able to choose which of these factors would need to be provided for different levels of task.

See also https://github.com/opensets/domainprofiles/issues/135

There's also the matter of allowing levels of mandatory authentication given factors of time and actions being taken: for instance, the user should be allowed to choose (as some sites have it now) to make it so a TOTP code only needs to be used with the first login on a machine, or the first login within 90 days of the last login (the last login having entered a TOTP, or last login period, or last login having used some combination of factors), as well as mandating additional factors / mandatory reauthentication for certain privileged actions (like reconfiguring security policy, or other "unrecoverable" actions).

One of the most important points about this is the implication it makes about passwords:

## Passwords Would Be Just Another Possible Factor

If the user wants to make it so that they can *only* log in with the factors we treat as "second" or "third" today, they'd be allowed to.

On this subject:

## Email Access Would Also Be Just Another Authentication Factor

Email access wouldn't be seen as necessarily "deeper" than password access, the way it's handled today, where we let anybody effectively *bypass* passwords by allowing them to "reset" them with a link sent to their inbox.

## Passwords Would Be Subject To As Few Restrictions As Possible

Passwords should support full-on passphrases, or even thousand-character random keys, as well as single-characters or even, if the user wishes, the null string.

Passwords should support *any* Unicode characters - not even limited to the Basic Multilingual Plane.

This is part of the [official NIST Digital Identity Guidelines](https://pages.nist.gov/800-63-3/sp800-63b.html), which I should really review in full and reconcile with this document

## Password Hashing Would Be Client-Calcuable With Configurable Strength

You don't know what computational ability is available to the user, and how paranoid they are about attackers.

The user should be able to adjust their hashing parameters.

## Users Would Be Allowed To Be As Insecure As They Want

There's nothing wrong with pointing out the *flaws* in a user's authentication scheme - both in terms of potential issues of versatility (for instance, a user whose password contains emoji will likely find themselves in trouble if they have to sign in at a kiosk with only a QWERTY keyboard available), but

It's permissible to have *some* degree of minimum safety if, say, an account with zero access restrictions can be hijacked as a relay for spam, but beyond measures like this, users should be allowed to pick whatever restrictions are appropriate for what they're looking to do.

## Masking Would Be Optional When Entering Passwords

https://www.nngroup.com/articles/stop-password-masking/

## Masking Would Be More Transparent

We'd have something like [Chroma-Hash](http://mattt.github.io/Chroma-Hash/)

## Absolute Blind Entry Would Be Available, Too

When you're entering a password (or similar unlock pattern, like a keycode or gesture) in an environment where your inputs are being recorded and/or publically broadcast (eg. a live stream with screencast), *any* amount of transparency is a *massive* compromise of security. For this reason, while it'd be possible to completely disable masking for *trusted* environments, it'd *also* be possible to completely disable *feedback* for *untrusted* environments, making potentially-masked inputs not even display *character lengths*, nor show what characters are being pressed on an on-screen keyboard.

## Double Entry Would Be Optional For Any And All Critical Entries

The option to enter a field twice, so as to raise a warning if the second iteration doesn't match, should be provided for *any* field whose entered value can't be easily changed without repercussions - including, **but not limited to**, passwords and/or email addresses.

https://xkcd.com/970/

While this should be *provided* for all fields, it should also be *ignorable* for all fields - while *some* users have muscle memory meaning that it's easier to verify typed info by entering it twice than by reading it (especially in scenarios where the data is masked, like password entry), it's also possible that they're in a situation where it's **much** easier to just verify the data was typed correctly the first time (for instance, a user using a cursor to type on an on-screen keyboard). Depending on an individual's circumstances, making them re-enter data they already ensured was entered correctly is just a nuisance, and skipping it must always be trusted. It's okay to point out that the user is taking a risk when they do this, but they shouldn't have to jump through any hoops they don't have to.

## Usernames Would Always Be Changeable

Changing a username many times in quick succession might trigger a security review to prevent abuse

Not allowing changeable usernames is actually kind of a patriarchical worldview. You know what adults in the Western world are likely to require a name change at some point in their lives? Married women.

## Users Would Be Able To Control Any And All Disclosure Of Their Info

If the user can configure their account to not require any exposed factors (such as the saved settings of their password hash), it should be possible for the user to opt into a mode where any interaction with their account short of a complete authentication (eg. a failed login attempt, or a password reset request) doesn't even disclose the *existence* of their account. Other data, such as parts of their email address, would also be configurable.

This isn't always practical, and it prohibits a lot of useful feedback and usability, so it's not necessarily possible to implement this globally - but there are always users for whom this is desirable,

## Lockout Would Be A Significant Consideration, With Authoritative Overrides Available To Adapt

It's always possible for security factors to fail, and there should be the ability

Users could specify policies (defaulting to something sensible, but strengthenable upon request, per the description above) for, say contacting support and providing three other proofs of identity, in order to solve lockout issues in a time of crisis.

## "Security Questions" Would Be A User-Choosable Secret, For Human Support Use Only

If the user wants additional passwords with prompts, they should be able to set up additional passwords with prompts.

The purpose of a *secret* like this is to facilitate recover *when the passwords fail* - and it should be oriented around *humans*.
