# Understanding Lua

This is... well, read the Background section, I'll try to explain there.

This structure is mostly copied from GitHub, where this was published as a repo with most of the drafting being done in issues (before being migrated to notes.stuartpb.com and archived about a year later).

Before that, this was on Trello, and before that it was in my OneNote notebooks.

## Table of Contents

- [Background](129dp-3b2av-fx9kp-87pbd-1negx)
- [Preface](hsdps-qd33n-ma9qt-218pj-m4q07)
- Introduction:
  - [What is Computing?](mxy04-xhrty-wz8vn-996xd-9edr3)
  - [What is Lua?](11e74-96wft-k58nm-ks5n1-1a9c4)
  - [What is this book/series/whatever](tm37y-wsgbn-4b9ae-1wf1p-h25pr)
- Opening:
  - [Introducing the context](9fq5t-ypgck-mz9b7-3gbmf-se40q)
    - [How different value types look](k82q2-exrm1-4f9f1-5egd4-4t22j)
  - [Tables, Part 1: K -> V](ha48c-wd641-4x9x5-40154-ybtgv)
  - Locals and assignment: See [On introducing locals][]
- [Conditions, comparisons, and primitive operations](vzxtv-tm5hk-mpabg-50ymy-a2n0n)
- [Tables, Part 2: Arrays](q8hfr-nwtfc-4d934-nhsnp-7j0g6)
- Constructing and Calling Functions: See [On Functions][]
- A break to talk about [Garbage Collection][]
- intruducing the concept of [lexical scope][] and how it can be used in functions
  - this is where this subject was oriented on Trello, but now I'm pretty sure it could be placed in a better spot.
- [The Environment](6nmzh-0d7gc-vp9m8-y5mt4-qetr7)
- [Modules, standard libraries](yts23-nwbqm-rw8hf-2ddsw-n730e)
- [Basic I/O](0satz-q5qz1-g98zb-vbept-bq2cg)
- See [On Loops][] for why loops should probably come earlier than this point
- Using these basics together
- Recursion
- Upvalues
- Multiple returns and varargs
  - Creating sprintf
- Metatables
- [Coroutines](rpv18-h1fjc-w486j-z30qp-wbaqz)

## Work-in-progress/abstract non-narrative notes

- [Describing immutability](skkm3-fjvmp-gf8qx-t6ewt-e8pgp)
- [On Numbers](5tk2a-b69r2-32808-4kbhm-cec23)
- [On Functions][]
- [On Userdata](qqa16-vvtr0-c29wf-ys5gw-pep8d)
- [On metamethods](zd6hj-kp8n9-rc812-1v6gm-y6ft0)
- [On tables](f53q2-8tmmx-m6ajy-sqhmm-cfsg2)
  - [The first example table](7fqc2-ze9fk-919x0-fjes4-57b80)
- [On introducing locals][]
- [On bitwise operations](n9dp2-3pz03-419ab-rcb8s-4w94y)
- On [Garbage Collection][]
- On [lexical scope][]
- [On Loops][]
- [On Strings](bf5ac-jt29a-rh8eb-kpnzx-x4ngc)

[On introducing locals]: 1zjay-g0a3c-ra85p-4zv6x-3r6h0
[On Functions]: ypqj4-z5n8d-g18sx-jshhs-p5qwj
[Garbage Collection]: sxsa2-17sd8-rb92r-mqa1j-5mgwz
[lexical scope]: ecgac-kgk22-ej9na-da4ze-80zc6
[On Loops]: n3rwg-t6bt6-8f9f4-c5mf1-xew2y

## Notes on other aspects / considerations

- [On art style](mgb1b-3vkfk-cs8gx-eex0k-tdd4t)
- [Understanding Lua as a Performance](6h38c-5kmj8-2v989-dg60q-r100w)

## Appendices or Something

- [Influences on Understanding Lua](evej0-apysd-gr8tx-72m1n-t20gq)
- [Mechanical Computers](f7sp1-y1md3-868yd-x9dxq-tmv0e), illustrating the abstract nature of computing
  - [The Tinkertoy Computer](chqcm-k42pr-e2abr-y0yqk-01fgh)
- [Dashseat and Understanding Lua](wbrr5-baj5f-wm9n3-d91yg-6f80x)

## Expanding / Sequels

- [Understanding Lua Season 2: TRON AS COSMOS](16xhv-pkpx4-pw96w-55mdn-6ghvn)
