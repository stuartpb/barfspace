# rudeboy

Rudeboy is Ska Linux's package manager, which wraps pacman

## thoughts

I'm thinking rudeboy could have an "edit the current snapshot" mode, which would essentially just call pacman

## pacboy / rudeman

One of the points I'd go for with rudeboy is that it'd have a subcommand-oriented interface more like [`apk`](https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)

however, for incensed Arch people, there could also be a pacman-compatible wrapper

## rosetta stones

I think https://github.com/Inducido/upkg-package-manager-rosetta-stone is the most sensible baseline

some other influences:

- https://wiki.alpinelinux.org/wiki/Comparison_with_other_distros#Comparison_chart.2FRosetta_Stone
- https://www.reddit.com/r/linux/comments/41turl/rosetta_of_package_managers/
