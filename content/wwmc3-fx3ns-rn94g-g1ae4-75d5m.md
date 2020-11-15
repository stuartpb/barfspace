# how I unfucked my windows 10 login

## the situation

some update to Windows 10 made it so it was prompting me for my password, which didn't seem to be what I remembered it to be (and I couldn't figure out how to log in), so I tried resetting it from Linux using chntpw.

this ended up only making the problem a lot worse, and I was locked out of Windows for somewhere between three and six months.

## my original plan to resolve this

one morning after my system had powered down and I wasn't in the middle of something, I booted into [stuquart][] following [these](https://winaero.com/blog/reset-windows-10-password-without-using-third-party-tools/) directions.

[stuquart]: ky9bb-ysmyy-g883t-9sy76-0wa48

I got as far as trying to run "net user", then "net user login new_password" where "login" is the username and "new_password" is the new password (so if my username is "blerp" and I want to make my password "derp" the command is "net user blerp derp")

## argh it didn't work

I got this "system error 8646" that was caused by the whole "microsoft account" bullshit that led to this mess

ultimately I flailed around for a while and eventually went "well, crap, if I have a working SAM hive on stuquart, why can't I just look at my account there and compare it to the one here and just merge until that works?"

that revealed that my broken hive had one value the other didn't, "CachedLogonInfo", and googling that put me on the right track - this is more or less what I did to fix the issue: https://gist.github.com/CHEF-KOCH/d531d9474dd40a45d19c460db29422a8

note that I couldn't figure out how to edit this stuff in RegEdit, possibly because I'd broken the file in some whay that it doesn't read in RegEdit, but anyway I was able to delete those values from the SAM from stushiba using chntpw
