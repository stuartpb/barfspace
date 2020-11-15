# Unusual Studio Projects Eleventyfication

Or, like, screw it, maybe this is the point where I go ahead and merge USP into this notes body.

I'd take the YAML documents for each project, and I'd merge them into the notes as frontmatter. Then, I'd render unusual.studio/projects out from the notegraph

## As a project store

Yeah, like, the more I think about it, this is the model that makes sense - in fact, this could get mutated from "unusual.studio/projects" to "portfolio.stuartpb.com", which is just a lens into the notes blob.

then, unusual.studio/projects can turn into another fontend into the notes - a way of saying "here's my schedule for where I'll be concentrating in the notes on camera"

or, heck, could this even become useful for structuring note contribution off-camera?

## How to define the frontmatter?

So, obviously we can keep the same layout as before, but I feel like I want the stuff that defines "this page describes a project" to be under its own object.

Really, the object is defining the preview card's content, not the actual project. The project is defined by the text, and, you know, the reality outside the text

If we're putting the Markdown at the top level, can we maybe have a "excerpt from the section under this subheading" instead of the current remarks design?

So I've been thinking the object could be called "card" or "slide" or "folio"

You know what, though? I kind of feel like I should do it, I almost want to say like Kubernetes namespacing? like it'd live under "unusual.studio/projects" as an object name?

definitely feels like that would confuse some systems

I could tackle this under a UUID like BISNES, but, like...

## Location: Kind of the big problem with this model?

You can have the project definition live on any document? And for complex projects the page for it isn't clear?

Eh, I'm thinking... if content shifts like that, you can shuffle content around so that links point to a new node - and if that isn't feasible, then maybe the project needs to be redefined to fit the node that has become stuck in place?

like when I was describing acebins and magickshop in the same document: it turned out that that page wasn't describing one or the other so much as it was describing a "common ancestor" of both. if that page had been tagged acebins, then I think I'd have moved the acebins metadata?

or, like, yeah, see, it depends on what context things linked into it: if they described "acebins" as the idea described there, or if they were describing the actual "acebins" root idea that wasn't on that page.

whichever one wins out determines what moves. in the event of a tie... I don't know, you kinda just go with your gut. Which one's going to confuse people the least?

this kind of lifecycle mutation was a question before I started looking at this, though. All that moving to Bagtent changes is that there's now more surrounding context to inform the decision of how to shuffle IDs and content. (See also the Oozy Sewer)

## another thought about which page should hold the metadata

the page should be the one that would best serve as an "entry point" to understanding that project.

## name naming tangent

what if a project description above the name is a "ruby" and a project description after is a "sapphire"? I think those can become pet names, maybe for projects that don't have names? and ones with only a name are Pearls? idk
