# reflection on a Stack Overflow

[i am going to become the joker](https://stackoverflow.com/questions/5787796/hide-password-with-asterisk-in-lua)

Are you frustrated by your scripting language's inability to employ the full range of capabilities afforded to native binaries? Well, have I got the solution for you!

Ahaha and of course it doesn't work on 64-bit Windows because it's using the 160bit subsystem

## twist

I love how some idiot at the top got two upvotes for describing a lack of a raw terminal keyboard input interface in ANSI C as it not having a "low-level character read function"

thinking I might leave a reply setting them straight: "To clarify my previous comment..."

## background

Ironically I found this answer today not because I was searching for "lua hide password", but "lua ssty echo" after searching for "terminal hide input". Like, the research I did to understand this question/answer helped me to understand the terminal/stdio abstraction distinction clearly enough that I knew what concepts to look for now, but the best mention of them in the context I'm currently operating on is still the place where I learned it

A sufficiently-advanced GPT-like construct, if asked the same questions I am asking right now, might well end up reading my own words back to me in response. And I wouldn't necessarily remember that fact - if you'd changed the username on my comment, I would have *totally ripped into the guy*

## phrased differently and the Windows hellcosystem

It wasn't that I'd forgotten what I'd learned - I remembered that I'd have to set the properties at the terminal level, and that it would probably involve os.execute - but I forgot what the specific commands would be, and perhaps more notably, what a hilarious pain in the ass it would have to be to want to try this within the native Windows ecosystem

Windows is like a giant Easy-Bake oven that, in the last five years, has installed a normal-size, actual oven inside it

next to a couple of mostly-usable conventional ovens made out of mangled pieces from the Giant Easy-Bake Parts ecosystem

along with like eight different kinds of unshielded microwave cooktop where it's really impressive, see, the pan floats by itself!

so if you want to actually microwave something, what you do is, you put a regular microwave oven inside your regular conventional oven
