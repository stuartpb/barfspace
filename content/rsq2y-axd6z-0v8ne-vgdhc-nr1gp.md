# The week before Halloween, 2018

October has been busy, and I'm just finding the time and space to breathe now.

I guess I've been kind of... hedgey, about what I want to put in *these* updates and what I want to put in Right Now.

I guess I'd rather just have, like, a series of build-log posts that'd live in the "tree" here?

Okay, so, it's like, somewhere between Right Now and News, in that it'd be... build logs?

Nah, you know what, it should be build logs done by updating Right Now, and then I push previous updates if that gets too hairy to a "past updates" page?

Okay, you know what... yeah, no, it's gonna be that trivial work details go in these checkins, and the current state is in Right Now, and I update about that here...

okay, but, so, like the idea is, I want somewhere to put "I'm installing avrdude on OctoPrint so I can do a firmware update"... okay, this is kind of a petlog thing though

Okay, well, whatever, I'll go back and put this in a petlog later. Just remember that I did all the firmware update stuff 2018-10-27.

Also doing a `sudo apt-get update && sudo apt-get upgrade` first

The thing is that I haven't had a print going for the last half hour because I've been so distracted

argh, and `sudo apt-get install avrdude` kept failing like this:

```
Reading package lists... Done
Building dependency tree
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 avrdude : Depends: libftdi1 but it is not installable
E: Unable to correct problems, you have held broken packages.
```

per `https://askubuntu.com/questions/363200/e-unable-to-correct-problems-you-have-held-broken-packages` I was able to fix this by running `sudo aptitude install avrdue` but geez, this took me like a day
