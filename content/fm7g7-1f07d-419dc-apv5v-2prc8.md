# 2017-12-31

I went and looked at the commits to petlogs I made from MGit and, hurr durr, checking "Autostage modified files" doesn't *add* files, so I had to go back and edit the commit... which MGit has no way to do. Enter Termux.

I installed Termux and went into my phone's Settings (searched for "Termux") to grant it storage access, then installed Git and ran `git rebase -i HEAD~2` to go back and amend the commit.

From here, I wanted to add my SSH keys that I'd set up to Termux; I did it by doing `touch ~/.ssh/id_rsa{,.pub}` as the Termux user, then catting the files from `/data/data/com.manichord.mgit` into those as superuser, so I didn't get any headaches around file ownership again. (`su` was inserting literal tabs under Termux, so I did this step in a ConnectBot local terminal.)

anyway from there I was able to `git push -f` the fixed commit and now we're back in business.
