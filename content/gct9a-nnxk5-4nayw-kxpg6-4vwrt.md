# Based on my thoughts and experiences in the field

*(these were a couple cards in the Overture list for [Implementing User Accounts](rt4ha-04jzn-wm9m5-6q6kc-sqfcm) about the scope-weirdness of it all)*

Oof.

So this section totally comes out of nowhere, interrupting the enabling-technology introductions with a title like "User Account and Session Best Practices". (I've done what I can to make it flow a bit better.)

A lot of that is because it was essentially something I meteor-smashed in during a break from writing Lean Notes to work on PlugMap. While Lean Notes is essentially me writing down well-introduced procedures and references, PlugMap is an experimental project in which I'm synthesizing and reinventing from several different sites I've found similar ideas in.

This section is a bit of a diamond in the rough, though, in my humble honest opinion. I might even call it a crown jewel. The other sections apply mostly to people coming in afresh to Node or maybe web dev in general, and while it's all quality, it's also still mostly stuff where I'm just compiling and defining bits and pieces I've more or less read elsewhere.

Not this, though. I've *never* seen a truly good series looking at and talking about how you should structure your user account and session flow, and it shows in the way that user account and session stuff is:

- painfully inconsistent (everybody thinks they've got passwords figured out- and half of them want your email address twice. And they're enforcing a CAPTCHA!)
- decades behind in usability (a whole new paradigm in interaction that cargo cults the authentication from the mainframe computer lab days)
- muddled in the few cases where parts are openly taught (why does everybody act like describing how to get a token from Facebook explains how you should use it?)
- frequently completely absent in terms of security (remember how GitHub authenticated by the username stored in the session cookie for *years*?)

This is mostly ideas I've had based on the practices I've discerned or reasoned from the outside looking in (including problems I've only seem in systems that don't do them), and am currently implementing in PlugMap. Things like:

- Keeping sessions EXCLUSIVELY to tokens on the client
- Not letting any account be created without completing a handshake (and doing that handshake up front)
- If you're going to use passwords- use bcrypt!!!
- Login tokens! For users who never remember passwords that's what most sites already support- they just call it "reset password" and involve a bunch of unwelcome song and dance
- If you send login tokens, you don't need passwords! And you don't need to fight brute force attacks!
- Never take any action on a GET request! Always make a button! (This is general practice but most frequently violated in email links)
- Require that handshake again to change password!

Etcetera!

## Placement

Anyway, the server-building card is getting kind of big, I think it can be split in half.

(Edit: Actually, it's the cards on either side that are wider than is comfortable. Oh well, it's still not a bad point to break on.)

This section will probably just have a lot of call-forwards to the content in whatever the second half this breaks into is.

I think there's only a little of Building App Servers that's distended, and this section will come after the majority of it.

Maaaybe I talk basic Express routes and templates, then this, then databases. Talk about what you'd put in a database, then talk about how you use that database generally: that sounds like a pretty Lean Notes thing to do. Somebody who thinks concepts need to be slowly hammered in one by one before they can be used would freak out, but somebody who wants to think things out then get things done would be enthralled.

I'm happy with this, actually. User accounts are like THE thing that's more widespread as a site need than anything else, and this series breaks it down (literally, into modular rational chunks based on most common to least common needs). The next section deals in the generalities needed to write whatever else your particular site has.
