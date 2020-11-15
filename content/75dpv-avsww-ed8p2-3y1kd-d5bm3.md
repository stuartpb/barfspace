# Producing an online indie game under democratic socialist principles

## Higher concept

I feel like we can really make these principles connect if we talk about executing something concrete

Need to specify up-front that "online" here means "bazaar" and not "networked" - see note on confrontational gaming's issues below

To be clear, this is equal parts theoretical exercise and serious proposal - if discussion progresses to the point that this starts to look like a viable idea, I'd be ready to facilitate it to the best of my ability.

## Game premise

A Metroidvania like SOTN or Hollow Knight about the people taking back a giant bank

The player is a heroic figure, but their initiative is to "restore life" to the bank by making it safe for citizens

### Why have a premise up-front?

Because a) you're not going to get people to coalesce around a non-idea, and b) the nature of the game dictates the organizational structure required to produce it. You can't take a team built for Madden and put them on Magic: The Gathering.

## Why this premise?

Well, part of it is because I just like this kind of game.

But also, Metroidvania games work well with lots of art contributions, which are easier to conglomerate than code-heavy games. They allow for lots of different themes (per-area)

The "online" aspect of this is *critical*, as the game *must be* a living work for this synergy, which assumes a bazaar and not a cathedral fundamentally

Single-player (or cooperative) averts the mess of problems that developing any kind of competitive game under democracy would entail. Essentially, it's my PoV that it's easier to build a game under collaborative principles when the game itself is collaborative.

### A quick parable on what an oppositional game would have to deal with

Alice (who here may refer to a certain kind of mechanic or strategy, and not necessarily a distinct character / weapon) is overpowered. Bob players complain, and say that Bob should be buffed, and Alice should be nerfed. Alice players say that Bob players just need to git gud. The Bob players start a smear campaign against prominent Alice mains, and (since forum flame wars have *actual power* in this model) whip a vote that causes Bob to be overpowered, to "make up for all the days of Alice players running rampant". Alice players stop playing. The game becomes Bob-dominant, and boring, and the Bob players leave, too. The game sucks, and all the devs stop contributing. The game development maybe fractures along factional lines, and suddenly, hooray, you've reproduced all the problems of Trotskyism in the form of a figting game that collapsed from infighting. Good Jorb.

## hey maybe another premise

[DR. SMORT](h91j6-k38pc-4taxv-p0k21-8aamh) is something I'm planning to develop on my own, but oh hey it happens to have a design that would dovetail with this idea *just perfectly*, right down to the pre-existing community of collaborative authors?

## Tech stack

Web platform as the tech stack, as this is the closest thing we have to a collective platform (also, you know, it's inherently online)

Beneath that, stack should be as portable and decoupled-from-implementation as possible. Wherever possible, logic should be implemented in straight JS functions that aren't predicated on outside projects, so that said outside engine stuff

That's not to say that engines shouldn't be used - just that contributions should be largely engine-agnostic.

Design should be influenced / inspired by existing engines in the same genre to whatever extent possible, based on the experience of devs who've worked on this kind of game before. What I mean is, if most games have a "Sprite" class to represent an on-screen entity, the design of the class should be based on interfaces that these engines usually have, using names that are most common. No one engine should have particular influence.

This is kind of just turning into my general tech design philosophy, this should maybe get forked off to another note

But yeah, tl;dr: the programming undertaking should only happen after an engine overview of at least a half-dozen games like this, what particular tradeoffs were made in each case, things like that

## Prior art

- [Pixeljoint collaborations](http://pixeljoint.com/forum/forum_topics.asp?FID=1)
- GoonTower et al on Something Awful

## Operational structure

- Constitution / Bylaws are considered "part of the game" - not in a meta sense, as this is
- Needless to say, everything is open source
  - Assets are Creative Commons
  - Characters and dialogue and all that have to be open, too
  - Bylaws / constitution, of course, are forkable
  - This allows for an unabated exodus in the event that the Trademark Holder stagnates in adminstration (ie. becomes like Node circa 0.10)
- How is trademark (and related assets ie. Git(Hu|La)b org ownership, domains, etc) adminstration handled?
  - It's really important to note that trademarks are the banner under which development organizes, and is critical like that
  - Distinct LLC?
  - Elected treasurer (financials) / secretary (non-financial assets) makes sense
  - important to note: Communications Facilitator is a separate position (or, really, set of positions) from Secretary (who is essentially "keeper of secrets", ie. "the password for the Twitter account")
  - so "Secretary" really means "the one who is given actual functional authority / power to execute X role"
- Lead PM / designer should be an elected position
  - Delineating responsibilities for this role especially need to be explicitly spelled out in the constitution
- Annual elections with an ability to call a Vote of No Confidence at any time?
- "Publicists" as contributors - people whose job it is to promote their initiatives
  - Like, this is a thing I've thought about re: democracy for a while: campaigning is an *important function*, and the labor of campaigners should be recognized and, more importantly, *delegated by official channels*, so "I have an idea but I don't know how to broadly communicate it" doesn't always translate into "only the dumbest and most disingenuous candidates / initatives succeed"
- What else about the game's design could be safely democratized?
  - Contributors need a certain degree of autonomy
  - Need to strike a balance between that autonomy and "editorial discretion" to make contributions work cohesively
- Is enfranchising paying players moral?
- Should contributors have stronger voting positions?
  - Only for certain classes of vote?
- Promotion - how do you attract contributors (laborers + pay + voters)?
  - Bulletins of important votes should appear via in-game signs in relevant areas, ie. hubs, places where you use a mechanism that might get overhauled or whatever, idk
- How should contributors be compensated?
- Executing official functions
  - Basically just publish a statement to the Forum stating "I'm officially doing X", or we'll assume you're just fucking around and making a statement of intent
    - The important thing is that you use the base word "official"
    - Using "officially" sarcastically is grounds for immediate impeachment, do not fuck with us

## General constitutional thoughts

This is a little thing on "how to write an accessible constitution people can actually use"

(cut out from Google Keep - these should really get their own page)

constitution section tags, like the "This section is X" from the HTML LS

informative
normative (most of the tags listed below)
administrative (ie. defining legislature)
superlative? (part that grants special privilege or power/duty/command)
prohibitive (ie. things all citizens are expected to behave within)
punitive (rules that should, in a theoretical "ideal" operation, never have to be consulted)

should each one have an "audience" section that defines, like, "you're only be subjected to these laws in the context of X", that would be reiterated at the top of each page or such

## Sort of higher questions

### Avoiding unintentional sabotage

- What would suffer if it's not baked in from the beginning? (ie the thing above about "Why say what kind of game we're making up front?")
- Differentiation - how do we "divide turf" so that, say, a group that wants a different aesthetic (or one other "dealbreaker") doesn't just fracture the base?

### Avoiding intentional sabotage

- How do you prevent fashy gamer chuds from just intentionally sabotaging the game because they want all games to be developed under brutal tyranny? (god damnit)

### Design thoughts to address the above?

These should probably be argued democratically:

- I think pixel backgrounds / world art with vector sprites would allow for a broad range of styles to be incorporated
  - This would also probably be good from an engine perspective - ortho platforms are easier to code than inclines.
- Establishing aesthetic guidelines (like outlines/not, cubish/not) should probably take some kind of cue from Pixeljoint

## Pitching this whole thing

- Post to LSC mailing list?
  - I'd say to include, in this order, in the initial post:
    - Higher Concept
    - Premise
    - Why have a premise up-front?
    - Why this premise?
    - Operational structure (should be worked out a bit more clearly)
