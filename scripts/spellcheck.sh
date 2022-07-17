: '
Script to run spellcheck on all .tex source files.
Requires aspell.
'

aspell -c -t --home-dir=scripts src/0-abstract.tex
aspell -c -t --home-dir=scripts src/1-intro.tex
