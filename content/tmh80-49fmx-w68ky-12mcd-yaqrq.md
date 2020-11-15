# 2017-12-02

setting up a local npm global setup with `mkdir .npm-global && echo 'PATH=$PATH:$HOME/.npm-global/bin' >> ~/.profile` (this creates .profile for this install)

`.npm-global` being the recommendation of https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npms-default-directory-to-another-directory

what I really wanted to do, tbh, was use /usr/local and do everything global through `sudo npm install -g` into /usr/local, but for some reason the default is `/usr` on Arch, and I couldn't get any effect with `sudo bash -c 'prefix = /usr/local >> /etc/npmrc'`, possibly because it says the global config is looked for in `$PREFIX/etc/npmrc` and `$PREFIX` means it's looking in `/usr/etc/npmrc` which is not a thing?

anyway using a non-privileged local dir for my user is fine by me

I was worried about man pages but apparently man actually looks for man pages as a sibling from /bin dirs in `PATH`, which is just wild

`npm config set prefix ~/.npm-global`

having set all this up I ran `npm install -g nodemcu-tool`
