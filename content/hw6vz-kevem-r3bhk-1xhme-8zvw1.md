# Security and Preparedness

[Background image](https://trello-backgrounds.s3.amazonaws.com/51901b73c30c061842001c4b/3132c68f48241f44316df02ad60228d0/The_Antonia_Fortress.jpg)

## Previous

You should be thinking about this right around the point where you're considering [Hosting and Infrastructure](hhypz-mtvwt-g0bq6-n8vma-gzy0y)

User data security is covered in [Implementing User Accounts](rt4ha-04jzn-wm9m5-6q6kc-sqfcm)

## Overture

Security at its most fundamental level is being ready when things go wrong.

It's not just protection from intentional malice: it's protection from Hanlon's Razor cutting you down by incompetence, by bad design leading to holes that unravel the whole sweater.

## General Strategy

Encapsulation: Don't put all your eggs in one basket: if somebody breaks into your database, they shouldn't be able to then use what they've found to break into several other things.

The more servers communicate with each other in a manner that doesn't require the separate nodes to implicitly trust each other, the more secure you'll be.

Host-Proof Hosting: http://blog.passpack.com/2008/03/host-proof-hosting/

You *can* do this, but it will lead to situations where user data is unrecoverable - that's a bad spot to be in. Only do this if your users are expected to be more prepared and careful than you are.

Plan for recovery over prevention. You should design your systems as tightly as possible, for that earlier note about not accidentally unraveling, but at the same time, your plan can't just be "we're never going to get breached, because if we do that'd be the end of us".

## Vulnerabilities to Watch

Channeling: http://www.defensecode.com/public/DefenseCode_Unix_WildCards_Gone_Wild.txt

Channeling is when you combine multiple types of information into one "channel", and one type of information (that can be manipulated by the user) can be used to influence another (that is treated as privileged).

A historical example of this is the old phone switching system used by AT&T through the 1970s: customers were able to whistle certain tones on the voice line to direct the system to let them call anyone they wanted.

A modern case where you will run into this issue (linked above) is in how Unix and its descendants use the same syntax for specifying filenames as they do for specifying command-line arguments, leading to cases where a filename can be interpreted as an argument.

In some commands, this can be avoided by using `--` to separate the rest of the argument list to be *exclusively* treated as filenames.

Public Access Secrets: Don't expose anything that's meant to be secret in a place where users don't have to prove they can be told that secret.

For example, this Google exploit works by trying to log in as people - before users are logged in, it says what their email address is:

http://www.tomanthony.co.uk/blog/google-exploit-steal-login-email-addresses/

also the GibsonSec Snapchat hole

## Sharing Service Accounts

*(This section describes the tool Meldium, which was acquired by LogMeIn and melted down for scrap some years ago. It should be replaced with my more modern suggestions in a future commit)*

https://meldium.com

Good services will let you decouple users from accounts, but for some (often in the branding space, like Twitter, YouTube, and Gravatar), you need to make an account for your project. In this case, you can track them on Meldium.

Meldium still involves writing down passwords, which Lean Notes does not recommend.

## Prevention and Detection

*(this section was empty on the Trello board this was drafted on)*

## Architecture

Encrypt any third-party tokens in your database. Otherwise, you can fall victim to an attack like [what happened to Buffer in late October 2013](http://open.bufferapp.com/buffer-has-been-hacked-here-is-whats-going-on/#update9). Just set a random secret token in your config, much like you should be doing for session tokens (except you'll use this for a two-way encryption function and not hashing).

## Backups

Tarsnap and its backing store Amazon Glacier

I think there are better offerings these days? I wanna say there's a good FOSS tool for backing up to Backblaze?

## Preparedness and Recovery

Protip: Track Your Factors. Be aware and write down what every piece of information lets you do: what passwords let you read what keys, what keys let you administer what services, what services let you reset what passwords, etc.

Revoke and Reset (Protip/Instruction): ALWAYS revoke keys and reset passwords *immediately* when they get leaked. Track *anything* these keys would give access to, and reset *everything*.

See http://www.devfactor.net/2014/12/30/2375-amazon-mistake/ and https://jordan-wright.github.io/blog/2014/12/30/why-deleting-sensitive-information-from-github-doesnt-save-you/

Plug: The OPWS tracks the reset password pages for a lot of sites

Also plug: [revokum](60nwr-1phrb-dn87f-5gvb1-ajjgj)

## Read on

Speaking of messy situations: [Email and Phone Numbers](5kphh-cm8ce-2h89n-qebh1-8yjg7)
