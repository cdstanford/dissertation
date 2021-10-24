.PHONY: build clean

SRC_FILES = $(wildcard *.tex)
FIG_FILES = $(wildcard figures/*/*.pdf)
BIB_FILES = $(wildcard *.bib)

build: dissertation.pdf
	echo $(SRC_FILES)
	echo $(FIG_FILES)
	echo $(BIB_FILES)

dissertation.pdf: $(SRC_FILES) $(FIG_FILES) $(BIB_FILES)
	pdflatex dissertation.tex
	bibtex Main.aux
	bibtex dissertation.aux
	pdflatex dissertation.tex
	pdflatex dissertation.tex

clean:
	rm *.aux *.toc *.out *.log *.bbl *.blg *.pdf
