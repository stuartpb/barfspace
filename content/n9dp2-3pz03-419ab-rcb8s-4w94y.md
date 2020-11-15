# On bitwise operations in Understanding Lua

## Comments from Trello card "(Hold your horses Mr. Bitwise)":

> You essentially shouldn't need to twiddle bits at the level Lua operates at (that stuff should be in C code that Lua calls to), but if you're a low-level programmer who wants to twiddle bits, the bitlib will be described in a chapter or appendix or something.

---

> Bitwise can be replaced in general cases with the underlying numeric mathematical operations, like subtracting a power of 2.

Basically, I'm going to leave out bitwise operations, except *maybe* to have a comment about them in the margins, which might suggest reading some remote footnote talking about how bitwise operations are generally a Bad Thing and why they're not covered with the rest of the primitive operations (or maybe just "If you're a C programmer, you might be wondering why bitwise operations aren't included in Lua's primitive operations: see Chapter 37D or whatever for more about bitwise operations in Lua").
