# octoprint/printacle plugin ideas

## herp derp

A plugin that uses Prusa's status messages to display the ETA and percentage done, not OctoPrint's built-in completely-meangingless estimate (does this exist? Why is it not on by default? printacle would let you swap this component out)

[oh it exists](https://plugins.octoprint.org/plugins/prusaetaoverride/)

## Is It Hot In Here

a plugin that notices if your heating-up print bed is displaying the thermal curve we'd expect if you left the build plate off and gently nudges you to check that

## SMS notification via email to carriers

there's a Node lib for this that I don't feel like looking upright now

## scheduled print plugin

3d printer alarm clock. At the given time, your bedside 3D printer plays a tune, then start preheating a print, which will then commence once preheating finishes. Want to sleep? You'll have to cancel this print. (or, you know, sleep through the print, but that'll be on you - the silent print moving around is enough to engage my ADHD ass and not want to sleep, I think)

I suppose the sane name for this would be "scheduled printing" and there would probably be a few ways to tackle it (ie. do we have a mechanism to remove the print from the build plate? that's a thing I've thought about - do we have an option to promptt the user at the scheduled time vs being an alarm clock?)
