# Markdown Macro R&D

This was superseded by [an idea that would use query-string/fragment URLs as targets](btrtq-ty8za-8natk-cmerg-h8k45)

Another related precedent, as I discovered reading [this](https://nikcodes.com/2013/08/20/semantic-markdown/) article about [Semantic Markdown](c0g5q-c0kq9-tgaaw-avh15-004rm), was implemented by Aaron Parecki in 2012 using an extension of the syntax for linking to images. I'm not sure if it's necessarily that much cleaner than the stuff described below, but the "exclamation point before the link activates an elevated form of link syntax" makes sense to me: something kike `![stuartpb/bagtent](:github)` (with our without the `!`) makes sense to me.

(It also uses YAML data at the top with an EJS-style templating insertion in-document: that could also work, with maybe a few other template/macro languages mixed in:

- TeX
- m4
  - see [this tutorial](http://mbreen.com/m4.html)
 - the whole "any token that doesn't evaluate to a recognized expression evalueates to itself" paradigm is a cool one imo
- Go

## Old idea

It'd be nice to have a tool/script that conjures a new page via a "cursor"

I think this was one of the aspects I was originally thinking about for bagtent-rig?

Maybe it can be something like - ooh, and I'm liking this idea, because it can work like a cheap trick in browser JS - a fragment link that's a hashbang can describe the structure (like if you're making a side thought, you can write like `[](#!sprout)`) (EDIT: this is what I explore in that "successor" idea linked above)

this might also be a job for editor tools like Emmet or a VS Code / Theia extension

on the other hand, this might interfere with genuine applications needing that interface namespace to invoke editor commands like "save"

maybe it can work like a... special protocol query string? I think that makes the most sense

maybe we can be real hacky about it and have it be a url format like like `sh:bagtent-conjure+--init-from=$HERE` which makes a new document with a "`from [here](pretend-this-is-the-origin-uuid.md#heading-above-the-link)`"

or some other query-url-like structure where the first item represents a "script" in the current "path"

maybe "replacement-spec URIs"? or whatever imperative family "mailto" is classified under

I'm thinking something that could be a spec for some tool with a knockoff name like artoo. `rto:` or `rwto:` for "rewrite to"? I want to make it clear that it's designed with this idea of a script that's namespaced in the user's local "path" - or... maybe aliases come in from a DNS-like namespace

One of the big considerations from me: I don't believe Markdown believes in URLs with spaces in them

Anyway, this "weird command link" style is a neat way to design "meta-urls", is my thinking.

but yeah, the idea is to be able to write `(page:new)` like an action or whatever to create a new page with a "from here" link at the top
