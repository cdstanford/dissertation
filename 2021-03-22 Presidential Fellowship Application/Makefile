.PHONY: research teaching diversity
.DEFAULT: all

all: research teaching diversity

research:
	pdflatex research.tex
	bibtex research.aux
	pdflatex research.tex
	pdflatex research.tex

teaching:
	pdflatex teaching.tex
	pdflatex teaching.tex

diversity:
	pdflatex diversity.tex
	pdflatex diversity.tex
