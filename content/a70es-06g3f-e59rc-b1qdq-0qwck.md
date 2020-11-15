# 2018-09-08

`sudo pacman -Syu`, because I'm about to do a bunch of package installations

## Clipboard

I was thinking about setting up some scripts that would make writing these logs a little easier, and part of that would involve copying commands to the clipboard, so I read up on https://wiki.archlinux.org/index.php/Clipboard and, dang, I didn't know I needed a clipboard manager just to persist clipboard contents after closing the app the text was copied from.

Gpaste looks good, and xclip and xsel look pretty much interchangeable, so I went ahead and `sudo pacman -S gpaste xclip xsel`, then run `gpaste-client settings` and enable the gnome-shell extension (though I can't tell where it is) and syncing the extension's state with the daemon's.

The extension isn't showing up: I'm not sure if that's something that'll happen after I reboot or what.

## Other missing core stuff

I just realized the reason I haven't been able to open links from Atom is because I don't have `xdg-open` because nothing I've installed listed `xdg-utils` as a dependency, so I go ahead and `sudo pacman -S xdg-utils`

I also run `sudo pacman -S --asdeps perl-file-mimeinfo perl-net-dbus perl-x11-protocol` for the optional deps

## Profile structure

Added `[[ -f ~/.profile ]] && . ~/.profile` as a line to `~/.bash_profile`, right before the final line of the same structure that sources .bashrc if it exists.

Going forward, I will be putting all of my environment configuration into `~/.profile`, unless it is shell-specific, in which case I will use the shell's specific profile file.

I don't have any cross-shell interactive tweaks I feel like making right now, but if I choose to do so later (for instance, making the `alias ls='ls --color=auto'` line apply cross-shell, and/or turning it into `export LS_OPTIONS='--color=auto'`), I'm thinking I'll create a `.shirc` file that I'll source from `.bashrc` (and other shells' equivalents).

The legacy changelog for 2013-07-04 on sturling mk 1 was informative here, as were:

- https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc
- https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment
- https://wiki.archlinux.org/index.php/Bash#Configuration_files

## Adding local bin to PATH

Following the profile configuration described above, I create my `~/.profile` with `echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.profile`, which will allow me to override globally-installed binaries from my user dir (this is also not a bad way to do aliases)

## Bash interactive convenience function

Adding `mkcd () { mkdir -p $1 && cd $1; }` to the bottom of my `~/.bashrc`

## Making readline's tab completion a little smoother

Creating a `.inputrc` with two lines:

```
set show-all-if-ambiguous on
set completion-ignore-case on
```

The first came from https://wiki.archlinux.org/index.php/Readline, while the latter came I think from the page on Bash completion (though I actually ganked it from the aforementioned legacy sturling changelog).

To adopt this in the terminal I already have open, I run `bind -f  ~/.inputrc`.

## Wifi Hacking

I've been thinking I might like to run some experiments that would involve turning the machine into a hotspot:

https://wiki.archlinux.org/index.php/Software_access_point

So the first thing here is to run `sudo pacman -S iw`

Okay, it looks like my hardware can support it, that's all I really want to know for now - I can revisit this later.

## NodeMCU

I've been meaning to program this NodeMCU dev kit I got about ten months ago, but I haven't had a really suitable system to hack on it until now (I had tried it with stukilla on [2018-12-02](tmh80-49fmx-w68ky-12mcd-yaqrq) and [2018-12-04](thgsp-dpjvm-41890-nce93-9vajr), but ended up running into issues, hence why I was originally going to build stuzzy as "stukilla mk 2").

When I was originally experimenting with all this, I was trying to work with whatever the chip came flashed with, since I figured it had only been a month and whatever it came with as stock was probably fine: however, looking at the options on https://nodemcu-build.com/ for additional modules, and how long it's been by this point, and how I was never able to get the stock firmware to work, I'm going to trigger a custom build from that page (selecting `bit bloom color_utils crypto encoder file gpio http net node sjson spi struct tmr uart websocket wifi` along with TLS and FAT support, since I've got 4 megs to play with, I'd like to use HTTPS where I can, and I do have an SD card reader) and try to load that onto the chip (while seeing if I can pull the shipping firmware off of it as the build processes).

First, I install pip via `sudo pacman -S python-pip`, then `pip install esptool --user`

Then, I try to get info on my chip with `esptool.py flash_id`, but I get permission denied reading `/dev/ttyUSB0`, so, between https://github.com/espressif/esptool#serial-port and https://wiki.archlinux.org/index.php/users_and_groups#Group_list, I do `sudo usermod -aG uucp stuart`, then restart (since I have to log out to apply the change anyway).

flash_id works now:

```
esptool.py v2.5.0
Found 1 serial ports
Serial port /dev/ttyUSB0
Connecting....
Detecting chip type... ESP8266
Chip is ESP8266EX
Features: WiFi
MAC: 68:c6:3a:80:97:c8
Uploading stub...
Running stub...
Stub running...
Manufacturer: c8
Device: 4016
Detected flash size: 4MB
Hard resetting via RTS pin...
```

I'm throwing together a quick subdirectory for this with `mkcd nodemcu`, then running `esptool.py read_flash 0 0x400000 stock-flash.bin` to image the stock ROM so I can query its characteristics before I go flashing my own ROM (and restore it if anything goes sideways).

At this point, I'm going to try again with the NodeMCU-Tool stuff; first, though, I'm running `echo "prefix=$HOME/.local" >> ~/.npmrc`, so that npm global installations can live in my user directory alongside the tools installed by pip.

Once I've configured npm, I run `npm install -g nodemcu-tool` to get it.

Okay, so, nodemcu-tool can't make heads or tails of the chip running this stock image: running `strings` on the dump I made earlier finds no hits (case-insensitive) for "Lua" or "MCU", but paging through with `less -M` uncovers the string `"@D:\arduino-1.6.5-r5\portable\packages\esp8266\hardware\esp8266\2.0.0\cores\esp8266\core_esp8266_main.cpp`, so it looks like this shipped with some kind of Windows-built Arduino firmware that wasn't stripped for debug symbols.

Seeing that, I'm cool blowing the stock image away now, though I'm still curious about the image's structure, so I `sudo pacman -S ghex` to glance over the image layout.

GHex starts lower than my screen, so I move it into range with Alt+Spacebar and "Move".

Huh, all the unused space in the image is set high instead of zeroed. Looking at the gaps in the custom firmware image I downloaded earlier, apparently that's normal? Eh, I guess.

Anyway, now that I've gone ahead and ensured I wouldn't be destroying anything of consequence, I go ahead and run `esptool.py write_flash 0 nodemcu-master-18-modules-2018-09-08-21-37-47-float.bin` to flash this new NodeMCU build onto it.

Now I run `nodemcu-tool fsinfo`, and the system recognizes it:

```
[NodeMCU-Tool]~ Connected
[device]      ~ Arch: esp8266 | Version: 2.2.0 | ChipID: 0x8097c8 | FlashID: 0x1640c8
[device]      ~ Free Disk Space: 3123 KB | Total: 3123 KB | 0 Files
[device]      ~ No Files found - have you created the file-system?
[NodeMCU-Tool]~ disconnecting
```

Okay, I think I've gotten the system set up enough that I can start developing for this board.

Now that I know the image with all the modules I compiled in only takes up a quarter of my space, I tried to use the online build system to make a build with `adc bit bloom color_utils cron crypto encoder enduser_setup file gpio http i2c mdns mqtt net node ow pcm pwm rtcfifo rtcmem rtctime sigma_delta sjson sntp spi struct switec tmr uart websocket wifi wps`, but it refuses to try a build with that many modules (I had to steal the selection in the console via `Array.from(document.getElementById('modules-master').querySelectorAll('input[type="checkbox"]')).filter(e=>e.checked).map(e=>e.value).join(' ')`), claiming that failure is inevitable. I think I could probably prove it wrong, but that'll have to wait for once I start trying my hand at hacking on the firmware, but I'll put that off until tomorrow.

## GNOME

Turned off the annoying drop sound when trying to navigate past end-of-input with `gsettings set org.gnome.desktop.wm.preferences audible-bell false` (found via https://wiki.archlinux.org/index.php/PC_speaker#GNOME)

Added Terminal and Atom to favorites.
