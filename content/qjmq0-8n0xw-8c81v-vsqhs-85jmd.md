# NodeMCU stuff on stushiba

I somehow didn't have wget installed until today to do the NodeMCU stuff, wild (also installing gperf)

having an issue where /dev/ttyUSB0 isn't showing up, gonna reboot

error was fixed after reboot. It might be worth figuring out the causes of this issue if I want to update my Prusa's firmware again

running `make menuconfig` per https://github.com/nodemcu/nodemcu-firmware/blob/dev-esp32/docs/build.md

changing python2 path to "python2"

started enabling bluetooth then noticed there doesn't appear to be any NodeMCU stuff for it

enabling modules: bit, crypto, encoder, SPI, WS2812, time

ran into an issue with pyserial, doing `sudo pacman -S python2-pyserial` to fix it

ran into a problem with future so I installed python2-future as well

## okay that all worked

Time to install nodemcu-tool globally.

I don't know if I've installed an npm global before, it doesn't look like I've got it in my $PATH...

Following from prior art in [stuzzy 2018-09-08](a70es-06g3f-e59rc-b1qdq-0qwck) (NOTE: that page has a lot of useful stuff on it), I check and apparently I've got a ~/.npmrc that explicitly sets `prefix=/usr` (and that's it)

## setting up infrastructure

Adding `[[ -f ~/.profile ]] && . ~/.profile` as a line to `~/.bash_profile`, right before the final line of the same structure that sources .bashrc if it exists.

initializing that profile with a little bit from the Ubuntu default profile, modified a smidge:

```bash
cat  > ~/.profile <<'EOF'
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH
EOF
```

setting npm up to work with this with `npm config set prefix '~/.local'`, which overwrites that stupid default from the file

now running `npm install -g nodemcu-tool` works, and after `. ~/.profile` I can run `nodemcu-tool fsinfo` to identify it
