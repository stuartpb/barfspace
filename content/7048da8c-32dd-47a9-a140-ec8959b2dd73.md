# mcgraph

I think this'll be what I call the "Bagtent Suite" components that maintain the Markdown Content Graph (ie. the file listing node/edge information based on outbound links)

Or maybe we just have a `.cache/edges.json` or `.cache/bagtent/edges/content.json` that tools can load/update (or optionally ignore with a `BAGTENT_NOCACHE` or `--no-cache` or something)

Would this go in `content` as the relative root? (or, like, do we have a shadow tree of edges?)

Or maybe we have the values allowed to be a tree instead of a list of files? so the root is just like `[["README.md",<list of files linked in README>],"content",[<list of all filenames and their outbounds>]]`, and you can figure out the relative path resolution at runtime if you need to handle cached edges that aren't neighbors under `content/`

I think the "shadow tree of edges" makes the most sense

don't forget to strip `#` fragments

## if I wanted this to be Bash-centric

Is there a fast Markdown parser (ie. something written in C) that can extract "all links"? Like jq, but for data in Markdown
