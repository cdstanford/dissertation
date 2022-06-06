.PHONY: build clean

SRC_FILES = $(wildcard *.tex)
FIG_FILES = $(wildcard figures/*/*.pdf)
BIB_FILES = $(wildcard *.bib)

build: dissertation-official.pdf
	echo $(SRC_FILES)
	echo $(FIG_FILES)
	echo $(BIB_FILES)

dissertation.pdf: $(SRC_FILES) $(FIG_FILES) $(BIB_FILES)
	pdflatex dissertation.tex
	bibtex Main.aux
	bibtex dissertation.aux
	pdflatex dissertation.tex
	pdflatex dissertation.tex

dissertation-official.pdf: $(SRC_FILES) $(FIG_FILES) $(BIB_FILES)
	pdflatex dissertation-official.tex
	bibtex dissertation-official.aux
	pdflatex dissertation-official.tex
	pdflatex dissertation-official.tex

clean:
	rm *.aux *.toc *.out *.log *.bbl *.blg *.pdf
