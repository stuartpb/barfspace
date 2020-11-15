# Smort, having thought on it

## the big shift

I forgot that mapping the second button to a radial menu would mean that you couldn't use it as a gun.

So, anyway, I've thought about it a little more, and I think what'd be cool would be having "no UI", but when you press the Up button while standing, Smort looks up, and it opens the portal to his lab immediately above his head, and all your UI stuff (like a minimap!) projects from that. So the "Return to Lab" function is

Also, I didn't realize you could add items to the pause menu when I had that idea - though I still want something a little more "actiony"

## more on portals

One thing I love about Minecraft-type games is building your own transportation system. (It's also why I love Mini Metro.) One of the things I want to have with SMORT is that you can acquire additional portals, and they don't have to point to your lab at the other end

I was originally thinking "what color should the lab portal be?", and then "well, obviously it should be customizable, and there should be multiple options", and now I'm wondering how much farther than a simple palette swap I'd be willing to go

## Technical challenges

I feel like the big obstacle here is how much code I can fit into the PICO-8 space? Like, the stock platformer is almost full, and it doesn't even have *one* gun

There are a lot of ways to spread data out across cartridges, but code seems like it doesn't really get to sprawl

Anyway, here are some of the approaches I've been thinking (and they kind of tie in with the other game ideas I've had, specifically [the Castlevania Bank idea](75dpv-avsww-ed8p2-3y1kd-d5bm3)):

- SMORTLAB is one cartridge that may or may not contain the DISS, like Creatures Docking Station
- The DISS is a gateway hub to levels stored on other cartridges
- Other cartridges can write data to the SMORTLAB / DISS cartridge based on the save state
  - the docs note that an update will wipe these out, but if the base game gets updated, it can run through these cartridges and have them save the data back into it

## SMORTLAB: How accessible should it be?

One of the things about having SMORTLAB on a separate cartridge is that I wanted jumping to it to be *quick*, like switching a weapon in Mega Man

Though, really, isn't the point of the whole weapon-crafting-system that you can build that easy-action design into *the item itself*?

## A refinement of the weapon idea

Everything is cores, except that cores can have slots for cores

So, like, you start with the Bopper, which is a core that just does a one-tile-width attack immediately in front of you

Another would be the Celestial Dash, which works and looks exactly like the dash in Celeste

But, by default, it only goes forward. You have to upgrade it (via new blueprints / research? a new type of core getting discovered?) to have a Direction Slot, and the first Core that can go in that slot is Whatever Direction I'm Holding

but there are also Condition Cores which "contain" multiple cores

## research

Research happens in "research ovens" or whatever, which you fill with whatever the enemy-grinding resource is

(an idea I just had is that Basic Enemy Energy is known as "BEES", so you insert them in a Hive)

All that putting these in does is speed research up - by default, it will take 5 years, but every blueprint has its "five minutes" point, which is the resource count required to reduce that time to five minutes.

the BEES are all consumed once the research finishes, so don't go cranking the speed up if you don't want to

For some blueprints, this number may be prohibitively expensive? And it's on some kind of curve. So, like, for some blueprints, you'll just start the research and it'll be like "so I'll get that later, might as well try fighting that one boss again in the mean time"

## blueprints

So here are some thoughts:

- You can have "entirely new type of core" as the kind of thing you need to liberate from a Chozo Statue
- You can also have "upgrading"?
  - The thing I'm not wild about with this is that I feel like it can lead to "let me put everything on hold until I've fully upgraded this blueprint" which I don't want; I want upgrades to be like new suits in Metroid, where they're still transformative (cf. the Celestial Dash getting a Directional component)
    - Hmm, but isn't that more of a "class of core" thing?
- I had the idea of "Research" and "development" being two separate things
  - Well, the end goal of this thought train was along the lines of "you pay a fraction of the Five Minute Point to produce a duplicate of a core"
