# inlin functionality

## HTML inlining

- rewriting of `a href` to absolute URLs
  - should optionally redirect to the original page for URLs that start with `#`?
- `link rel="stylesheet"`
- `script` can come later
  - there should be limits on this - like, I'm not 100% sure you can inline modules?
    - there's definitely a module inliner

## CSS inlining

- handled by `postcss-url`
- url rewriting
- we don't handle style-attribute inlining, that's left up to juice

## JS inlining

- breaking `<script` and other such constructs with backslash escapes or spaces (as appropriate)
  - is this already a step in minifiers?

## SVG inlining

- for img elements matched by extension?
- embeds et al?

- remote fetching for stuff like `use`?

## a thought

(this overlaps with wjet, too)

There should be support for, like, using any local copy of a remote destination under a level of directory for the host

but yeah, this is an idea: on top of "this is the folder for the root of the site the page is on", you could also have "search for files using the full post-two-slashes name under this directory" as a way of defining the page. think of it as an "alternate protocol provider" for hosts

like, I do keep the root files under a folder called `www.stuartandtiare.com`

That might be a sensible factorization for this parameter I haven't quite figured out how to describe: you can specify the "Host" or "Address" or whatever the WHATWG name is for the corresponding part of the URL

what about port? I'm thinking specifying a port always goes to the network. partially because that's a neat override, and partially because Windows filesystems don't allow colons in filenames (and, you know, stuff like path doesn't do well with it)
