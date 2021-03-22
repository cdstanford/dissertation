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
	bibtex teaching.aux
	pdflatex teaching.tex
	pdflatex teaching.tex

diversity:
	pdflatex diversity.tex
	bibtex diversity.aux
	pdflatex diversity.tex
	pdflatex diversity.tex
