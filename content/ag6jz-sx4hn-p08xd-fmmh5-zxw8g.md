# Git data to include when rendering

TODO: look into the best way to get:

- The last time a page was updated (probably rendered as a link to the GitHub/GitLab view of the full history for a file)
  - Note that, on pages where this *really* matters, this should be part of the content
    - See, there's "the last time this data changed", but that can include, like, minor proofreading fixes, or just updating a small thing
    - You often want to circumscribe the whole nature of when a page's content was formulated
    - This is more about just having a raw heuristic for basic stale content detection
    - see [Judging Staleness by Context, Not Time](07kf4-pcyaz-vba68-rkj1n-yg85x) for why this isn't a fundamentally good heuristic
  - Anyway, it would be cool if there's one Git command that can retrieve this in batches
  - This is one of the main reasons I'm apprehensive at the prospect of using most existing static rendering pipelines - I don't know if they've got the openings for this kind of injection
- Creation date isn't something I really care about? I feel like you can find that by going back through the page commit history if you care about a page's content origins
- Authorship of course doesn't matter for these notes, but it could in another bagtent application

see also [Metadata Database](pqjhc-jw5dw-0za66-1xx15-7br0r), [IDE Undo Buffer Git Remote](1dzb3-gbj93-ma8t8-p06mh-3j1mh)
