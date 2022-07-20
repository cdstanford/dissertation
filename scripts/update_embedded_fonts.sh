#!/bin/bash
: '
Script to check that all fonts are embedded.
Currently this just outputs the data to a file -- check the first column
manually, should be all "yes"
See: https://www.karlrupp.net/2016/01/embed-all-fonts-in-pdfs-latex-pdflatex/
'

echo "    updating scripts/fonts.txt"
pdffonts src/dissertation.pdf > scripts/fonts.txt
