# "make retrieval script"

this was originally dreamt up for a Module Tree plugin system packaging format, but it could be useful in other contexts

Basically, it goes through each directory, sees if it's a Git repo, sets the line to the git clone to restore the Git state if it is, and if it isn't, it outputs a series of `mkdir` and `echo >` heredoc lines for the dir, where the delimiter for the heredoc is the SHA-256 of the file - along with `chmod`s for executables /  anything differing from the expected umask

worth noting that this would pin specific checkout commit hashes, so you'd want to also have an update step to get the latest version / substitute all the Git lines to blank the checkouts

maybe you could call it `mkmanifest`? [oh, that's already a thing](https://linux.die.net/man/1/mkmanifest)

## wait

isn't this basically just like a tarball of a repo with un-inited Git submodules?
