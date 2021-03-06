# Kinds of Software You Can Make

This is meant as a way to perceive and structure the [Zero to Software](gmpsm-6b804-gp8sy-hyne0-txv0w) notes on building modern web apps.

## An Image Processor

This seems like a good example of a general class of app: people want to make FaceApp-type stuff.

so you still need to go through "Is this necessary?" and naming and branding and all those general concerns

then some pretty basic questions. Does this care about users? (Not really.) Does this care about outside data sources / API endpoints? (No.) Do you need persistent storage? (No - it just does the translation, then spits the changed file back.) Do you need special hardware? (You might need a graphics card if you're going for the fancy transformer stuff.)

and then you could have a whole path on

- "Setting up a neural network for translating things to other things",
- or "training computer vision to find features"
- or just basic stuff like filtering or drawing
  - using canvas in the browser
  - using ImageMagick on the server
  - using canvas on the server

(each of these being applicable in other contexts, of course)

this could also maybe split here for "ways to process video"

and then "Figuring out file upload" and then "processing and returning a file"

maybe this page could even list "here are some ideas that haven't been done yet you could use as your target", in this case:

- Album Art Overlay Adder
- An app to insert you into photos you weren't in (train it on photos identical except you entered left the frame)
- an app that puts your face on others' bodies, or vice versa
- an app to cover faces with scratch-outs/The-Ring-like-distortions/black bars

And maybe also link to example services like

- the one that auto-removes backgrounds
- the auto-googly-eyes-gif maker
- icon processors / favicon generator (believe this is already a class of note)

## The core insight to this

The thing I love about this idea is that it shows *which skills do and do not deviate between different classes of project*, which was one of the core insights I was trying to gesture at - how knowing the right 80% of stuff can make you capable and effective across a *broad* problem space.

## more thoughts

An example that comes to mind here is how Foone does their Death Generator modules - it often uses a steadily-building set of skills that you can devise from their tweet threads, which share some common techniques?

Hmm... yeah, this kind of covers a thing I've been thinking - it isn't really possible to generalize past a certain level, because the answer is always "copy the way someone else did something, to a point".
