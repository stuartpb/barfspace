# Implementing User Accounts

Still porting from Trello: https://trello.com/b/H5WTAbWL/implementing-user-accounts

[Background image](https://trello-backgrounds.s3.amazonaws.com/51901b73c30c061842001c4b/c1a052bf1125bcc77c05f3d507b68b1c/tron_original_clip.jpg)

Note that this was originally written in late 2013, early 2014, long before [my newer notes on security and user identity](9qb42-94e42-81ans-2rerv-1nq45).

Also note that I think apps shouldn't roll the dice on rolling their own user account system like this, as there are a lot of necessary features for good usability, a lot of moving parts and a lot of things to get wrong. That's why I'm building [Accouch](3bgmz-ptkas-baa2b-w9a4z-kmm7f) to provide a right-way-to-do-it as much as possible, so you don't have to know most of this stuff.

## Previous

This is something you'll want to do as you're [Building App Servers](q692n-5rhwm-m39eb-afjjf-pk6yn)

## Overture

User and session best practices

These are the high-level points needed to implement user accounts correctly and securely

(meta tangent thoughts moved [here](gct9a-nnxk5-4nayw-kxpg6-4vwrt))

## Registration

It makes sense to have your initial batch of users be invite-only as you're getting your app set up.

When it comes to email addresses, don't prompt the user for email twice (double-prompting was one of the evils I built surpass to address).

You *can* make it so users can add/set an email address on their account, and then you send a confirmation link: that's the flow that makes sense for claiming ephemeral accounts, or associating to a user who logged in through a third-party provider originally (though those often give you their email address, there are a whole bunch of caveats to consider around that).

What makes sense if email's going to be their primary access token, however, is to prompt for it once, then send a registration link that is associated with that email.

I recommend requiring that the account have *some* email address attached. Even if your user is authenticating with another site, you should get their email address so you can notify them for things and let them get in if one of your third-party auth methods has to go down.

Email also puts a higher burden on anybody looking to automate account creation: it's not insurmountable, but it does beat the alternative.

## Sessions

See [Session Handling Best Practices](a61hh-5zn9z-cd8wg-4tke1-a9dwe)

## Passwords

(TODO: import this stuff)

## Separate Collections

(TODO: import this, maybe as a separate page that can also get linked from Utilizing Databases)

## Read on

For more on security, see [Security and Preparedness](hw6vz-kevem-r3bhk-1xhme-8zvw1)

For how to actually code this, see [Utilizing Databases](5gz17-zrde9-yc9cn-h8rfj-0fb40)
