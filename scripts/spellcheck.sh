#!/bin/bash
: '
Script to run spellcheck on all .tex source files.
Requires aspell.
'

ASPELL_ARGS="-c -t --dont-backup --home-dir=scripts"
EXCLUDE_TEX="src/cut.tex src/header.tex"

for texfile in src/*.tex; do
  if [[ "$EXCLUDE_TEX" = *"$texfile"* ]]; then
    echo "    skipping: $texfile"
  else
    echo "    spellchecking: $texfile"
    aspell $ASPELL_ARGS $texfile
  fi
done
