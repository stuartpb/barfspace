# On How Understanding Lua should introduce Loops

Here's the original loop I described card-by-card in my "Loops" list on Trello:

- `guessed = stdout:write'Guess the secret word: '`
- read line
- `while guessed ~= secret`
- `io.write('Incorrect, try again: ');` read line
- `print('Correct!')`

I then had it followed by a card titled "don't actually implement a password like this":

> For one thing, it's stored in plaintext, and for another thing, it's vulnerable to timing attacks. In general, you should never take security into your own hands.
>
> Oh, it's also brute-forceable (duh).

This is a *terrible* idea for an introduction to loops: while using a simpler `while` for the condition instead of a `for` is a good idea (and I think that's what led me to this approach, wanting a condition that wasn't number-based), this approach requires *modules and I/O* to be covered before *loops*, and makes it so covering *scope* has to be left to *functions* (which [the page on scope](ecgac-kgk22-ej9na-da4ze-80zc6) notes is subpar).

Maybe we can see something like what the largest square above 9000 is?
