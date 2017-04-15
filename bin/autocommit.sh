#! /usr/bin/env bash

TIMER=3000

autocommit () {
  if ! git diff-index --quiet HEAD -- ; then
    git add . && git commit -m 'autocommit' && git push -f
  fi
}

autocommit
while sleep "$TIMER"; do autocommit; done
