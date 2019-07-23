# How Stuart P. Bentley Starts Projects

NOTE: Now that this has been integrated into the same notes graph as Lean Notes, it really ought to be merged with that

I originally called this file "apps.md", but this also applies to browser extensions, initiatives, events - basically any project that looks likely to become its own entity. (Some projects initially start as less than this, then retroactively get revisited with this approach after coming into their own.)

This is my own personal process for projects fitting this kind of pattern. You might decide it makes sense for you and copy it to some degree - that's fine with me (if you do, forking this file to describe your own thoughts would be awesome). All I know is, this is what I've been doing for the last few years, and it's worked for getting a lot of projects to where I want them to be with little-to-no friction.

## Step 0: Have an idea

As they say, necessity is the mother of invention. Most of my project ideas come from me struggling with something, and knowing how I'd do it better.

Relevant Lean Notes board: [Getting Something Started](https://trello.com/b/4qIwFkHD/getting-something-started)

### Step 0.1: Write that idea down

I track most of my projects on a Trello board, where my leftmost list is project ideas I've had the initial inklings of but no further follow-through. Sometimes I propose ideas in other channels (ad-hoc discussions, Twitter, notes in Google Keep, https://github.com/h5bp/lazyweb-requests, @huttj's Slack, etc), but I eventually make a card for it on my Trello board.

Any further notes on that idea I try to write on that idea's Trello card, or at least link to it if I've written it somewhere else, until I have somewhere more robust to record and correlate my thoughts (like GitHub Issues, or a Trello board for the project, or a channel on Slack or Gitter).

## Step 1: Name that idea

A project's name is crucial. It's how you refer to that project, how you distinguish it from other projects, and what you conduct all steps going forward with. Locking this down early makes everything else move significantly smoother. It's better to start with something unique but stupid that you can replace later in development than to try to work around not actually having a name.

(Note on renaming: you can handle it later, but not *too* much later - you should only revisit the name between once you've *actually started building something* and when you *really start telling people about it*.)

Relevant Lean Notes board: [Naming and Domains](https://trello.com/b/TekvQe5x/naming-and-domains)

Most of my thoughts and process around naming are spelled out on the Lean Notes Naming and Domains board: I will specially note that, these days, my go-to process is pretty much to pick a key word the project's name should incorporate, type that into LeanDomainSearch, sort by Length, and register one of the shortest names that's catchy with NameSilo. As soon as I register the domain, I point the DNS record to [Parked Project](https://www.parkedproject.com), and maybe set up an email redirect under the domain.

## Step 2: Create an organization on GitHub

There are so many advantages to starting a new project (of this nature - non-entity projects, as alluded in the first lines of this document, are a different story that will probably be covered in their own file) on GitHub as an organization and not a repo:

- **Securing the name at the root level.** This heads off uncomfortable trademark disputes, like the kind you'll see with hostile forks, right off the bat. It also lets you have a *(name-of-project)*.github.io domain, which you may choose to use separately from your main domain content for whatever reason (ie. a page concentrating on describing your GitHub presence).
- **An image on GitHub and attached services.** Having a root organization is how you have a logo on services like Gitter, and in front-ends like GitHub for Windows. It's also the image that gets attached when somebody links the project on Twitter/Facebook/Slack.
- **A place to keep related projects.** The most immediate utility in this is creating a repo that can hold the development of the project's art/branding assets (ie. the logo), which is only tangentially related to that project's code.
- **An abstracted-away identity.** Starting the project with its own organization allows you to bring on new contributors to the project, hand maintenance off to others down the line, or even disown the project altogether (and maybe even maintain your own fork after that case!), without it getting tangled up in your own personal brand. (See also [this question on Programmers Stack Exchange](http://programmers.stackexchange.com/a/82782/25572).)
  - As an example of what this helps: name a popular Node.JS project created by TJ Holowaychuk. Now, without looking, name the URL for that project's repo on GitHub. Is it going to be under @visionmedia (an organization with TJ's old username), or @tj (the new name of TJ's GitHub account)? Is it going to be under the stewardship of a company like Sencha or LearnBoost? *Does* it have its own org? Even the projects that *do* have their own organizations don't always have their component parts under the same organization - there's an @expressjs org, but Express itself is under @strongloop, as a byproduct of the ownership scramble that arose after TJ washed his hands of Node because *this wasn't figured out from the get-go*.

Note, to reiterate: *each distinct project* should have *its own organization*. Maintaining one monolithic "personal" organization, containing *all* of your personal projects, is scarcely better than just keeping the repos under your own account.

## This is the point where the actual work starts

From here on out, I do all work out in the open, in public repositories and workspaces. If there's any value in closing this work off from the public and making it proprietary (a notion of which I am MAJORLY skeptical), it's going to be later down the line, after you've started doing "non-obvious" R&D - it's not in the early stages, where you can benefit from having fellow travelers stumble upon the project and give tips (and/or other contributions), and can link directly to your codebase when soliciting help when you get stuck.

Calling someone in to help fix a problem where you're obscuring parts of your work is effectively asking them to play [psychic charades](http://blogs.msdn.com/b/oldnewthing/archive/2005/03/21/399688.aspx). In my experience, *starting a project proprietarily* only serves to help self-important novices avoid having their Dunning-Kruger-delusions of grandeur pierced by the reality of open scrutiny. Your project isn't some kind of brilliant secret where your *very first steps* are going to be special trade secrets. Don't kid yourself.

(Sometimes devs will choose to start with a private project so they can hard-code things like private keys into the code base. No. Take five minutes to understand best practices around runtime configuration encapsulation, then do it right the first time.)

Also, with the payment plan used by services following GitHub's example, you can do as much as you want for free if you're doing it in public.

## Step 3: Create a repo for the logo

To hold the first concrete work I do toward any project, I create a repo for something like "logo" (or "logos"), "branding", or "assets".

I start the repo's name with the name of the organization, like "dingroll-logos" and not just "logos" (so the url comes up as "dingroll/dingroll-logos"). There are a miscellany of reasons to name the repo like this, not relying on the owning organization to convey name information: most plainly, because **this repo can live under other users' accounts when forked**. If they fork a repo *that brings the name of your project on it*, that gets clearly displayed to anybody looking at the list of repositories on their account.

## Step 4: Clone the logo repo

I do my actual *coding* in Chrome, but I personally don't have a satisfactory Chrome-based solution for drawing logos (yet), so I do this using a few clicks in the (honestly kind of abhorrent from a functional standpoint) GitHub for Windows client to clone the repo on my dektop computer (which is usually booted into Windows on the off chance I decide to open up Steam and play some obscure Windows game).

## Step 5: Draw a logo

Relevant Lean Notes board: [Branding and Design](https://trello.com/b/xI45lmUk/branding-and-design)

From there, I open up Inkscape and create an SVG file for a logo essentially following the guidelines laid out in the Branding and Design Lean Notes.

I think the SVG reasoning is laid out pretty well in Lean Notes, but I'll reiterate: vector is good, and SVG is a good vector format, because text formats are good, because you can diff them and edit the underlying data by hand in a pinch (I've been known to handle SVG "uploads" by opening the file in a text editor and copy-pasting the contents).

## Step 6: Render out

Pick some absurdly large size like 4096x4096, so even some kind of So-High-Resolution-It-Literally-Attaches-To-Your-Eyeballs-Retina use case can be downsampled from it without having to futz with re-rendering.

For your own app cases, you can just use the SVG itself, which is going to be smaller than pretty much any render *and* look good in a resolution-independent format. The render is just for outdated raster-reliant external stragglers (read: every site that takes "image" uploads, ever).

## Step 7: Upload the logo

Specifically, drag and drop it onto the org page on GitHub. If you're doing it right, you can just click "okay" without messing with the "crop" UI (which is really only there for selecting your face in an uploaded photo for ad-hoc personal account avatars).

## Step 8: Branch into project-specific work

At this point, the steps taken vary depending on what technology makes sense for the project. There are a few ways I usually go with this, with some combination of approaches within:

- Altogether static HTML with maybe some JavaScript, deployed to GitHub Pages
- A static page that does local infrastructure using PouchDB and/or ServiceWorker
- A bundled PhoneGap/Crosswalk app or Chrome extension
- A Node.JS-based app server

These will probably be laid out in their own files at some point. There's some stuff on some of them in boards on Lean Notes.
