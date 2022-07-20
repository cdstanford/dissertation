#!/bin/bash
: '
Script to produce a table of all fonts in the final pdf.
In particular, the table includes whether the fonts are embedded --
this should be "yes" for all fonts.

Further info:
https://www.karlrupp.net/2016/01/embed-all-fonts-in-pdfs-latex-pdflatex/
'

echo "    updating data/fonts.txt"
pdffonts src/dissertation.pdf > data/fonts.txt
