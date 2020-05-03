# PixUnstick 3000

So, this'd use a model that keeps a "screen profile" at pixunstick.com (saved per-user, across all the user's machines), and a "native agent" that consults that model according to the screens on this system.

It's for people who want to unstick a screen that might be used across many machines (ie. via a KVM switch)

The key reason for this design is so the native agent doesn't have to be portable, and can get as deep as it has to to provide "just flashes this region" functionality at all costs, on top of all windows, ignoring all color temperature alterations, all of that.
