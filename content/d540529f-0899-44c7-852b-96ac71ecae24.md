# Getting PICO-8 on studeku

following https://www.lexaloffle.com/bbs/?tid=3935

SSHing in to the IP on screen (I accidentally had my DNS set to Cloudflare for whatever reason)

## getting the zip file

wget for the Raspberry Pi zip link I get when doing the "email me" thing

also, what the heck, I'll create an account

## image bullshit

copying urls from `/html/body/div[4]/div[2]/div[4]/div[3]/div[1]/div[2]/img` and curling... nope, still doesn't work. Wow, what a dick

fuck it, reuploading these to imgur:

- [pico8.png](https://i.imgur.com/v0mdomJ.png)
- [pico8_dark.png](https://i.imgur.com/9k3aZiE.png)

## anyway

unzipping pico-8 to the pi user dir

`sudo -i`

```bash
cd /etc/emulationstation/themes/pixel-tft
mkdir pico8
curl https://i.imgur.com/v0mdomJ.png > pico8/pico8.png
curl https://i.imgur.com/9k3aZiE.png > pico8/pico8_dark.png
cp amiga/theme.xml pico8/theme.xml
nano -w pico8/theme.xml
```

replacing `./console.png` with `/home/pi/pico-8/lexaloffle-pico8.png`

setting the system view to the dark one and the other ones to the light one

```
cd /etc/emulationstation/themes/carbon
mkdir pico8
curl https://i.imgur.com/v0mdomJ.png > pico8/pico8.png
curl https://i.imgur.com/9k3aZiE.png > pico8/pico8_dark.png
cp amiga/theme.xml pico8/theme.xml
nano -w pico8/theme.xml
```

making the changes described there

`nano -w /etc/emulationstation/es_systems.cfg` and inserting this between pcengine and psx:

```xml
  <system>
    <name>pico8</name>
    <fullname>PICO-8</fullname>
    <path>/home/pi/pico-8</path>
    <extension>.p8 .p8.png -splore</extension>
    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 "/home/pi/pico-8/pico8 %ROM%"</command>
    <platform>pico8</platform>
    <theme>pico8</theme>
  </system>
```

`exit`ing sudo, `touch pico-8/-splore`, `sync`, `sudo shutdown -r now`

## diagnosing issues

well, first, I want to see if pico-8 will start from the command line, so I do `pico-8/pico8 -splore`, and I get the error `error while loading shared libraries: libwiringPi.so: cannot open shared object file: No such file or directory`

[this post](https://www.lexaloffle.com/bbs/?tid=27846) suggests it's an issue with this build, but, you know, fuck it, if this is a recurring build issue, I might as well install wiringpi anyway?

`sudo apt-get install wiringpi` and now PICO-8 is startable, but the controls, unsurprisingly, are no good

setting `button_keys 80 79 82 81 5 4 0 0 0 0 0 0 40` in `.lexaloffle/pico-8/config.txt` and now it's playable

## fixing

okay, looks like my clever sentinel pattern doesn't get recognized as an "extension", because PICO-8 is not showing up. rats, that would have made things nice and simple. time to get clever - changing the extension and command so it looks like this:

```xml
  <system>
    <name>pico8</name>
    <fullname>PICO-8</fullname>
    <path>/home/pi/.lexaloffle/pico-8/carts</path>
    <extension>.p8 .p8.png .arg</extension>
    <command>/home/pi/pico-8/argfile.sh %ROM%</command>
    <platform>pico8</platform>
    <theme>pico8</theme>
  </system>
```

(on further investigation, the retropi launcher doesn't really seem to get us anything)

in `pico-8/argfile.sh`:

```bash
#! /bin/bash
if [[ $1 == *.arg ]]; then
  set -- $(cat $1)
fi
/home/pi/pico-8/pico8 $1
```

`chmod +x pico-8/argfile.sh`

now `echo '-splore' > .lexaloffle/pico-8/carts/splore.arg`
