# On Literate-YAML-to-Commented-YAML

This is a nice fantasy, but there's on core problem: you can't insert comments inside scalars.

This is fine, if you never use the parent document's literate style to comment within scalars.

But **YAML doesn't allow comments within a multi-line string.** So, if you're doing a document break within a scalar, you'd need to convert to whatever the comment style is within the long-string's language (is it YAML? TOML? Something where hashes won't work? What if there's no comments at all?)

I think that language could come from a spec, but it'd make more sense to just highlight it with a cookie (like, heck, you can technically use the `%YAML 1.2` directive - or you can comment `# YAML` at the top)

and, like, yeah, it can always be safe to do comments outside a multi-line string

Another approach would be to *parse comments within the string*, which I think should similarly require a cookie to enable. The idea here is, you'd leave these lines untweaked, but in rendering you'd parse indented lines *within the yaml*

And that'd technically be legal, and nobody's stopping you from writing comments like that to avoid breaking the no-insertion rule...

but I prefer the "render-without-comments-and-direct-to-source" version - that way, you can always just add "redundant comments" wherever, if you want the source to be commented. It's really more useful as a thing to, like, summarize

Another cool thing one could do is include links to section anchors instead of block comments
