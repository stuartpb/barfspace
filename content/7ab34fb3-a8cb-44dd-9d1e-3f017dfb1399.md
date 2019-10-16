# trying to get Proton Video to work

I updated my system a couple days ago, didn't make an entry for it because it was pretty noneventful

I've had a couple games with black-screen video (God's Trigger and the newly-released-in-the-Humble-Monthly-Bundle "PUSS!"), so I Googled "proton no video" or something like that and found [this comment](https://steamcommunity.com/app/221410/discussions/8/1733213724896178853/#c1733213724900604217), so now I'm trying `yay -S lib32-gst-plugins-bad` and seeing if that fixes it

## first run

Hitting enter to pick three defaults, skipping past all the diff prompts etc...

## failure 1

```
==> ERROR: Failure while downloading https://www.imagemagick.org/download/releases/ImageMagick-7.0.8-64.tar.xz
    Aborting...
Error downloading sources: lib32-imagemagick
```

trying again with `yay -S lib32-gst-plugins-bad --editmenu`

updating the ImageMagick version to 7.0.8-67, the closest version on the server ("7.0.8.67", in the PKGBUILD's notation)

also editing the sha256sum to "SKIP" (next time around, I changed it to "d98ea9d8829a4d87dae5d04ce7f2e558c236f3be7916742f2cf36dfedbae9677" from https://imagemagick.org/download/releases/digest.rdf)

## problem 2

```
==> Making package: lib32-bluez-libs 5.50-2 (Sat 05 Oct 2019 02:28:48 PM PDT)
```

deprecated bluetooth stuff seems weird for codecs to need, but okay, whatever

In the process of building this package, it does unit tests, and one of them fails, and then the next one hangs:

```
PASS: unit/test-uhid
  CC       unit/test-sdp.o
  CC       src/sdpd-database.o
  CC       src/log.o
  CC       src/sdpd-service.o
  CC       src/sdpd-request.o
  CCLD     unit/test-sdp
./test-driver: line 107: 2156494 Aborted                 (core dumped) "$@" > $log_file 2>&1
FAIL: unit/test-sdp
  CC       unit/test-avdtp.o
  CC       android/avdtp.o
  CCLD     unit/test-avdtp
^Cmake[3]: *** Deleting file 'unit/test-avdtp.log'

[stuart@stushiba ~]$ make[3]: *** [Makefile:8979: unit/test-avdtp.log] Error 130
make[2]: *** [Makefile:8877: check-TESTS] Interrupt
make[1]: *** [Makefile:9261: check-am] Interrupt
make: *** [Makefile:9263: check] Interrupt

==> ERROR: Aborted by user! Exiting...
^C
```

searching the "line 107" message turned up the AUR comments for [bluez-utils-compat](https://aur.archlinux.org/packages/bluez-utils-compat/?comments=all), which suggests removing the check from the PKGBUILD to work around this.

I mean, you know, whatever, they're deprecated anyway, screw it

I edit the PKGBUILD for this, too, to comment out [line 60](https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=lib32-bluez-libs#n60) (which already has some "tests will fail" stuff going on, complete with [Bugzilla link](https://bugzilla.kernel.org/show_bug.cgi?id=196621))

## problem 3

`lib32-libbluray` is running into JDK issues:

```
ant -f ./src/libbluray/bdj/build.xml \
    -Dbuild='/home/stuart/.cache/yay/lib32-libbluray/src/libbluray-1.1.0/src/libbluray/bdj/build' \
    -Ddist='/home/stuart/.cache/yay/lib32-libbluray/src/libbluray-1.1.0/.libs' \
    -Dsrc_awt=:java-j2se:java-build-support \
    -Djava_version_asm=1.6 -Djava_version_bdj=1.6 \
    -Dbootclasspath="" \
    -Dversion='j2se-1.1.0'
Unable to locate tools.jar. Expected to find it in /usr/lib/jvm/java-8-openjdk/lib/tools.jar
Buildfile: /home/stuart/.cache/yay/lib32-libbluray/src/libbluray-1.1.0/src/libbluray/bdj/build.xml

init:
    [mkdir] Created dir: /home/stuart/.cache/yay/lib32-libbluray/src/libbluray-1.1.0/src/libbluray/bdj/build

compile:
    [javac] /home/stuart/.cache/yay/lib32-libbluray/src/libbluray-1.1.0/src/libbluray/bdj/build.xml:26: warning: 'includeantruntime' was not set, defaulting to build.sysclasspath=last; set to false for repeatable builds

BUILD FAILED
/home/stuart/.cache/yay/lib32-libbluray/src/libbluray-1.1.0/src/libbluray/bdj/build.xml:26: Unable to find a javac compiler;
com.sun.tools.javac.Main is not on the classpath.
Perhaps JAVA_HOME does not point to the JDK.
It is currently set to "/usr/lib/jvm/java-8-openjdk/jre"

Total time: 0 seconds
make[1]: *** [Makefile:2858: all-local] Error 1
make[1]: Leaving directory '/home/stuart/.cache/yay/lib32-libbluray/src/libbluray-1.1.0'
make: *** [Makefile:1029: all] Error 2
==> ERROR: A failure occurred in build().
    Aborting...
Error making: lib32-libbluray
```

There's probably a way to resolve this by installing more packages or something, but [the latest package comments](https://aur.archlinux.org/packages/lib32-libbluray/) suggest I can skip over it entirely (the Java side of stuff is handled by the mainline `libbbluray` package), and that would let me not mess with my system's Java mess (so I don't have to worry about breaking Minecraft).

Fixed by using the revised `build()` function from there adding `--disable-bdjava-jar`:

```
build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd $_pkgbase-$pkgver

  ./configure --libdir=/usr/lib32 \
    --prefix=/usr \
    --with-java9 \
    --disable-doxygen-doc \
    --disable-bdjava-jar
  make
}
```

## done

no change to the games that don't show video though, womp womp

gonna try rebooting, after running a `yay -Syu`
