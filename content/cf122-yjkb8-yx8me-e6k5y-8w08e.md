# (Not) Getting Fancy with OpenSUSE's menu entries

Had to ditch this after realizing that [grub cfg does not support bash substitution](https://savannah.gnu.org/bugs/?38893) [(per stackoverflow)](https://unix.stackexchange.com/questions/84140/how-to-set-a-variable-equal-to-the-output-from-a-command-in-grub2)

```sh
function explainRelease () {
  if [ "x$1" = "x-Current" ] ; then
    echo " Current ($(date +%F -r "$2"))"
  elif [ "x$1" = "x-*" ] ; then
    printf "%s" "$1" | sed 's/^-/ /'
  fi
}
```

One wonders why [it even has functions](https://www.gnu.org/software/grub/manual/grub/html_node/Shell_002dlike-scripting.html)
