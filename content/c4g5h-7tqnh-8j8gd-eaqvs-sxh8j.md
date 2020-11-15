# Alternatives to how my notes/bagtent uses UUIDs

- Page titles could be hashed from their first heading instead of their content
  - This would still make them something that should be managed by tooling
    - It also means that files ought to be named by the hash of their first heading
  - This doesn't play as nicely with total-content-agnosticism, though:
    - This enforces headings
      - doesn't play well with pages with multiple h1s
    - Introduces a unique namespace requirement (for headings)
      - though you could pull a trick where you're allowed to "encode" a different hash by adding to the left-side
        - you could do it as a separate namespace, like `redirect/`
          - though that should also be used for actual redirects
          - but you could reuse it and do like `ln -s $1 redirect/$1`
        - or `../fixed/` or something
          - where this'd just be a symlink to `content/`
          - there *is* a "can't go through the same door twice" allowance for symlinks, right?
            - ie. if this were a nested dir, I can do `fixed/` to go into the same directory
            - and even another recursive `foo/` to go `fixed/foo/`,
            - but I can't go `fixed/foo/fixed/` or `fixed/foo/foo`?
      - but the idea I had was that you just wouldn't process links `*[in italics](to-wherever.md)*`
- You could also have a tree level at which pages are the hashes of the *calling link*
  - this would allow pages to have conflicting/multiple/missing headings
    - multiple headings would just be handled with multiple ways to discover the file
      - you could enforce uniqueness
  - So each link name creates a "pointer", that can default
  - It still involves an explicit namespace, though
  - the bagtent structure I'm using in my notes
  - this does introduce a rethink of the Alias concept, though
    - except you need to have the redirects instead of double-listings on render
      - though you could do JS hackery and lean on `rel="canonical"` in your renderer
- You could make the link a symbol to another arbitrary link that points to a page
  - This being like the shared-footlinks namespace
  - But, really, we already have this: just use the namespace for pages as your level of redirection
  - if there's a concept you want to point to and it's bigger than the page you're pointing to, then, well, go ahead and make that page, and have it point to the page that already exists
    - you want to have a semantic link for that concept at the level you're linking at
      - might as well have accompanying documentation explaining the distinction anyway
      - and if the concept shifts across more nodes in the future, the page can explain it
  - any tooling for this that'd create/default links as files from that namespace might as well just do it by creating a link to use as a new page's content
  - and then, ultimately, you're always linking to an arbitrary page, so you're back where we started: just link to the page for the concept you want as it's best expressed in terms of the current notes, whether you have to newly-document that
    - maybe this is pointing to a feature we need: bagtent-bubble, which rewrites a link

Anyway, bottom line is, these still need tooling to implement, so if you're using tooling to manage your links, why not go all the way

Reflecting on all this made me recognize [the boundaries of what may truly be called "Bagtent"](nvyr5-p3msy-cd91s-wqy8r-3vep0).

- [Crockford Base32 for UUID v4, too](4p973-96srh-4e86t-ny0x8-1qf84)
