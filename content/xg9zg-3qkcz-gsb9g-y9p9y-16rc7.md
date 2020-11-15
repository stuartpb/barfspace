# Namespace Taboos

A quick reference for why you shouldn't allow that character

## Colon (`:`)

### In filesystem paths

- Not allowed in filenames on Windows (as it would conflict with the colon separator used for drive letters).
- Separates directories in the `PATH` environment variable, where it [cannot be escaped](https://stackoverflow.com/questions/14661373/how-to-escape-colon-in-path-on-unix).
- Separates lowerdirs when mounting an overlay FS in Linux, where it, again, can presumably not be escaped.
