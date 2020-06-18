# Paired Delimiter Replacement Logic

A feature VS Code needs if you're gonna do automatic bracec matching is, if I highlight, say, an opening square brace that's matched with an ending square brace, and then I type `<`, it shouldn't try to surrount the square brace in angle brackets like `<[>` - it should replace the opening square brace with a `<`, and the closing one with a `>`.

or, like, right there, when I hit backtick and an angle bracket, it shouldn't then put another angle bracket that ends up on the other side of the other backtick after I type that. I guess that's just some weirdness with how quote characters aren't auto-balanced, I guess

but, like, yeah, any selection of unmatched brace characters should implicitly select the matching end-brace. you should be able to delete and retype to match, but...

I'm trying to figure out how this should work for multiple opening-braces that have closing braces at different points in the tree. Do you use this to allow a kind of quick flattening? Can the brace stay "implicitly highlighted", to be matched with whatever replacement text? What about leaving it specifically red-squiggled if the opening braces are missing, rather than going with whatever the parser thinks is the mismatch point? Can this work when the selection is dragged around?
