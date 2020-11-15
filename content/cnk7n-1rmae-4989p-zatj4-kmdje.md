# DingRoll and Bagtent Structure

spawned from [Thread Jam](5e1y8-03bex-6w9e6-7pq56-78ece)

Like, how does the document system model of DingRoll intersect with the document system model of Bagtent

- having the IDs be ULIDs would make them nice for indexing
  - it'd mean you'd have to repost a document to backdate it, though
    - and that'd mean you'd have no
  - unless you mandate a "Backdate announcement" object for the change to be accepted
    - and any removal of that backdate can only be accompanied by a removal of the backdate that would orphan
      - Hmm, this *is* starting to sound like a Bagtent validation rule...
    - or the "Backdate" is a "virtual backdate"
  - or, you know, you just forbid backdating, and if you want to rebase you do the whatever-
  - but, wait, no, you always need at least some degree of backdating
    - because, you know, connections have latency
    - also, this allows for offline stuff
      - and, you know, the Latertime construct stuff described here
  - oh hey wait no yeah you can have it both ways
    - the IDs can enforce a freshness
      - like maybe they're even a delta...
        - but now we're getting into blockchains
          - if anything, this'd be where I switch to Dat
            - or whatever has mutliple-poster support
    - but the metadata (frontmatter)
  - a weird idea, and I think this is somewhat off-topic?
    - but what about using Pouch attachments for this
      - The document is the frontmatter and the body is the attachment
      - Haven't I thought this is the part where you should always fork off to a blob store?
        - But, like, for the Stubernetes Workspace Project's purposes, the blob store would still absolutely be Work
          - even if it requires Bulk Storage capacity, like you're versioning psds or whatever
            - but, like, the point is, Work is classified to have a Bulk storage capacity, and to contain the canonical records of (or, you know, state you don't want to lose) whereas the whole point of
