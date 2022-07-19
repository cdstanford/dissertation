.PHONY: build clean show-input-files

SRC_FILES = $(wildcard *.tex)
FIG_FILES = $(wildcard figures/*/*.pdf)
BIB_FILES = $(wildcard *.bib)

build: dissertation.pdf

show-input-files:
	@echo $(SRC_FILES)
	@echo $(FIG_FILES)
	@echo $(BIB_FILES)

dissertation.pdf: $(SRC_FILES) $(FIG_FILES) $(BIB_FILES)
	pdflatex -interaction=nonstopmode -halt-on-error dissertation.tex > /dev/null
	bibtex --terse Main.aux
	bibtex --terse dissertation.aux
	pdflatex dissertation.tex > /dev/null
	texfot pdflatex dissertation.tex

clean:
	rm *.aux *.toc *.out *.log *.bbl *.blg *.pdf *.temp
