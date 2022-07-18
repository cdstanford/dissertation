#!/bin/bash
: '
Script to run spellcheck on all .tex source files.
Requires aspell.
'

ASPELL_ARGS="-c -t --dont-backup --home-dir=scripts"

aspell $ASPELL_ARGS src/0-abstract.tex
aspell $ASPELL_ARGS src/1-intro.tex
aspell $ASPELL_ARGS src/2-background.tex
aspell $ASPELL_ARGS src/3-rw.tex
aspell $ASPELL_ARGS src/4-foundation.tex
aspell $ASPELL_ARGS src/5-composition.tex
aspell $ASPELL_ARGS src/6-distribution.tex
aspell $ASPELL_ARGS src/7-testing.tex
aspell $ASPELL_ARGS src/8-monitoring.tex
aspell $ASPELL_ARGS src/9-discussion.tex
aspell $ASPELL_ARGS src/ack.tex
aspell $ASPELL_ARGS src/appendix.tex
aspell $ASPELL_ARGS src/dissertation.tex
