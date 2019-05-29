# bagtent higher construct thoughts

peeled off from [the original bagtent ramble][mound], some context may follow from there

these are thoughts for how the "base spec" can work within higher-level pipelines. for instance, the "acl structure" below is about making federation/CI more natural

## tree spec stuff

another thing I'd like to add is a script that adds / allows for a metadata file listing content files that don't accept new internal links, eg. for deprecating a page

### authorship / acl structure thoughts

could also allow for some kind of ACL structure, where all commits from "owners" of various files are auto-merged (so long as they're appropriately rebased)

ownership and selections like that can recursively delegate by link (in a second system that maybe compiles into a raw UUID list, or maybe it's a directory of "maintainers" or "owners" by username/owner name, or owners themselves have UUIDs - actually, let's say the user system would work by directories, where the user directory names can be whatever you want), but you probably want that to be filtered by stuff like "child that only has parents/inbounds under this root" or "isn't owned by one of these / any users"

exclusive ownership can also be handled by some higher-level thing that can reject multiple ownership by checking some extended constructs

maybe that directory can be "authors"

you can have authors updated by some kind of CI or tooling or whatever from content (or vice versa), but that's your own thing to figure out (in that case, you can make your authors by UUID of the file that defines them)
