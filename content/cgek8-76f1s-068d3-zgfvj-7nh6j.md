# node changes

While nothing went unrecoverably wrong in the setup phase, I think it wouldn't be too bad, since I'm changing the deployment method anyway, to go ahead and teardown the rook-ceph stuff and redeploy. before doing that, I intend to set new hostnames across the cluster

Since the "stu-" prefix is really reserved for pets and horses, I was never really sure I wanted to go with it in the context of this cluster. I mostly did it because, in the beginning, it was like "Hey, if this cluster plan goes south, I can repurpose any of these as pets based on their name from Stubernetes"

but it has a bunch of other problems:

- three extra redundant characters before tab completion kicks in
- random alphabetical sorting, where related nodes appear far apart
- the rule isn't easy to follow (I had to pass up "Wednesday" because "studnesday" makes no sense)

So, my new plan is to have a three-letter prefix denoting the main attributes of the device, a hyphen, and then the node's "nickname". the first character is either "w" (worker) or "m" (mario), and the last two are wither "pc" or "pi". thus:

- sturl -> mpi-pearl
- stuby -> wpi-ruby
- stuphire -> wpi-sapphire
- stumethyst -> wpi-amethyst
- stumez -> wpc-gomez
- stuticia -> wpc-morticia

this will also help me stop reading "stuticia" as "st. utica"

could also do "c" for control but nah I like the m/w symmetry

I'm gonna go to bed overnight and consider if I don't want to rename stuby to wpi-garnet, stuphire to wpi-amethyst, stumethyst to wpi-pearl, and sturl to mpi-schtuball. or mpi-steven, or even mpi-rose

I actually kind of love the idea of making it rose? and maybe later I can add an mpi-steven. and other pis can get added

- sturl -> mpi-rose
- stuby -> wpi-garnet
- stuphire -> wpi-amethyst
- stumethyst -> wpi-pearl
- stumez -> wpc-gomez
- stuticia -> wpc-morticia

I figure I'll also use `vm` if I introduce non-bare-metal nodes: maybe `vi` and `vc` for `vpi` and `vpc` instead, if there's ARM virtualization in the mix?
