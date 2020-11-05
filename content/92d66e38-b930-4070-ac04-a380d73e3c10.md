# Lash Revisited

Some of my thinking on this comes from having seen Go templates, and having read a little more of the Lua manual

So you'd have afew new parsing rules in Lua:

- Statements that do not begin with keywords, known variable names, or void statements are recognized as commands
  - You'd have some kind of special rule for strings starting with `.` or `/`
  - Most tokens like `-` need to be separated by a space to be recognized as a token, ie. `word-stuff` will never be read as `word - stuff` without those spaces
  - Any command follows special parsing rules until (unescaped) newline, semicolon, or `|` (and maybe `&`)
  - Note below that assignments to environment variables don't count
- Just for fun, `$` is interpreted as `_G.`
  - since we're effectively getting rid of `_ENV` with this command thing
  - actually, let's make it equivalent to `_ENV`, with any string token following it recognized like `_ENV.`
  - This lets us handle customizing the environment of a command before calling it
- Commands piped into another command form an actual pipeline
  - the last command in a pipeline of commands, or a command with no piping, is the value of the command as a string
- Piping passes a command into the value of the next command
  - One thing about this is that we're not changing the Lua calling syntax, except to allow "piping into" as a form of call.
  - Wait, actually, isn't this the idea of having a command represent a process handle?
    - I guess we just do that in the context of pipelines
    - But, like, yeah, there should be a way for a function to say "give me the actual stdout stream from the previous command"
    - Maybe that's what `&` does? It sort of does double-duty, since it's also bitwise-and outside of command context, since Lua 5.3
      - I feel like it'd be better to introduce a `||`
      - The thing is, then what do you do when a command is on the right-hand side of that?
      - Okay, you know what, that's `& |`, and `&` just means "convert me to a process handle", and that gets passed in to commands with whatever rule
