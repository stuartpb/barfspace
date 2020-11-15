# sturling mk 1

This was my first crack at keeping a petlog-like structure for a system I was setting up: an installation of Arch Linux that ran off of a microSD card, in a USB reader, for use across multiple hardware setups (such as a laptop I was able to borrow from a friend that had a malfunctioning hard drive, but was otherwise operable).

Having gone through the bootstrapping process with more than a few different incarnations of Linux systems, and having attempted multiple incarnations of this scheme a few times, I decided this time around to track all the loose changes I made to the system in a big manifest, as I made them.

Initially, this file was kept in my home directory as "sturlog.txt", without being tracked in Git or uploaded anywhere; later (probably when I was having trouble booting into the system and wishing I could see the most recent changes I'd made), I decided to copy-paste the file to Gist, where I then converted it to Markdown (I'd been using an ad-hoc markup semi-inspired by MediaWiki syntax up to that point).

The separate files for changes here have been derived post-facto from the Git history (check around dfc680b for this file's history before being integrated into the repository), which is why most of the content is in the 2013-07-04 entry, when the file was first uploaded to Gist (the later three files summarize subsequent changes made to that content).

## those split files

(these can probably be reintegrated now that the file is tracked in bagtent and there's no need to be so stingy about files-by-date)

- [2013-07-04](5wp98-1v8sk-v5a4q-35h51-aj55r)
- [2013-08-21](fq8kn-q9vwy-yt9b1-cnkek-dywmq)
- [2013-12-31](8c8qt-yk4km-8m9b6-svx8w-gztjp)
- [2014-01-03](v7x2y-m1htn-wj98r-fra9v-x4e2r)

## metadata

For what it's worth, this is what this machine's metadata would have been like, just like newer Sturlings:

```yaml
hostname: sturling
distro: archlinux
processor: x64
chassis: convertible
```
