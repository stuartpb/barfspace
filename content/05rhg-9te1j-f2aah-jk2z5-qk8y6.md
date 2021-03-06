# Encrypting a Repo / Directory

## Overview

[Arch Wiki's comparison](https://wiki.archlinux.org/index.php/Disk_encryption#Comparison_table)

[gocryptfs's comparison](https://nuetzlich.net/gocryptfs/comparison/)

## EncFS

https://www.arg0.net/encfs [(git)](https://github.com/vgough/encfs)

classic (it's the one recommended in [the go-to Stack Exchange question about this](https://unix.stackexchange.com/questions/28603/simplest-way-to-password-protect-a-directory-and-its-contents-without-having-to)), but it's "maintenance mode" and with auditing failures in the past (as [arch wiki](https://wiki.archlinux.org/index.php/EncFS) notes)

## Gocryptfs

[arch wiki](https://wiki.archlinux.org/index.php/Gocryptfs) seems to like it

[man page](https://jlk.fjfi.cvut.cz/arch/manpages/man/gocryptfs.1)

## CryFS

Based on gocryptfs's comparison table, I actually think I like this one best. An encrypted metadata structure / block system that's sync-friendly seems cool, and like more than the other options offer. Also, multiple GUI frontends is cool?

- https://www.cryfs.org/tutorial/
- https://github.com/cryfs/cryfs

## Using a Yubikey

[this gocryptfs issue](https://github.com/rfjakob/gocryptfs/issues/281) describes a generic way to devise a Yubikey-based system for encrypting a repo, which I think SiriKali uses?

(this could probably get spun off to a page all about Handling Key Material)

## GUI

- [SiriKali](https://mhogomchungu.github.io/sirikali/)

## more considerations

- What kind of command-line options are there? gocryptfs has kernel mount options

## Git-specific encryption stuff

- https://daveparrish.net/posts/2018-06-12-DIY-encrypted-Git-repository.html
  - https://github.com/dmp1ce/decompose-gitolite
  - see also [Gitolite](cw5f4-gxafp-e0ayc-70sgf-8yj8x)
- https://github.com/spwhitton/git-remote-gcrypt
- https://git-annex.branchable.com/tips/fully_encrypted_git_repositories_with_gcrypt/
- https://superuser.com/questions/1162907/setting-up-an-encrypted-git-repository
